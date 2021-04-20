---
title: "Apagando células do Jupyter antes de salvar"
layout: post
date: 2021-04-19 
headerImage: false
tag:
- jupyter
category: blog
author: giovanamorais
---

Às vezes quando você não limpa os outputs das células do seu notebook, o 
tamanho do arquivo final pode ficar muito maior do que o GitHub aceita e isso pode
acabar gerando uma dor de cabeça gigante na hora de tentar resetar o notebook
já commitado. Pra lidar com isso, a própria 
[documentação Jupyter](https://jupyter-notebook.readthedocs.io/en/stable/extending/savehooks.html)
mostra uma solução: um script que limpa as células quando você salva o arquivo e 
derruba o kernel.

```shell
# primeiro, encontre a pasta de configuração
$ jupyter --config-dir
# /home/usuario/.jupyter
```

Depois, vá até lá e crie (ou edite) um arquivo chamado `jupyter_notebook_config.py` e cole o seguinte
código nele: 

```python
def scrub_output_pre_save(model, **kwargs):
    """scrub output before saving notebooks"""
    # only run on notebooks
    if model['type'] != 'notebook':
        return
    # only run on nbformat v4
    if model['content']['nbformat'] != 4:
        return

    for cell in model['content']['cells']:
        if cell['cell_type'] != 'code':
            continue
        cell['outputs'] = []
        cell['execution_count'] = None

c.FileContentsManager.pre_save_hook = scrub_output_pre_save
```

Reinicie o jupyter e boa.
