---
title: "como mudar o diretório em que o pip salva as bibliotecas"
layout: post
date: 2025-08-11
headerImage: false
category: blog
author: giovanamorais
---

três diretórios diferentes:
* o diretório no qual o pip vai extrair os arquivos necessários pra instalação
  (`TMPDIR`)
* o diretório do cache (`PIP_CACHE`)
* o diretório em que tudo fica salvo (`$HOME/.local/lib`)

em `$HOME/.pip/pip.conf`:

```
[global]
target=/onde/você/quer/que/as/libs/sejam/salvas
cache=/caminho/para/o/cache
```

no caso do HPC, eu geralmente jogo tudo pro `/scratch` pra evitar a dor de
cabeça de número e tamanhos de arquivo do `/home`.


referências
* https://hpc.ncsu.edu/Software/python_cache_directory.php
* https://stackoverflow.com/questions/67115835/how-to-change-pip-unpacking-folder#67123076
* https://stackoverflow.com/questions/24174821/how-to-change-default-install-location-for-pip
