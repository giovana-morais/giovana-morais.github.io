---
title: "Criando um script para inicializar minhas postagens no Jekyll"
layout: post
date: 2019-09-27 22:21
headerImage: false
tag:
- shell script
category: blog
author: giovanamorais
---

## Motivação

Eu acho muito legal a ideia de fazer as postagens do Jekyll usando só o
markdown, mas uma coisa que me aborreceu desde o princípio foi o fato de
ter que fazer na mão o arquivo com aquela header TODA VEZ.

O lance é que a preguiça é uma bênção para o programador e eu decidi aproveitar
que quero me tornar um h4x0r mestre no shell script e fazer algo que
montasse um template de postagem e já salvasse o arquivo
do jeitinho que o Jekyll gosta.

{:refdef: style="text-align: center;"}
![h4x0r](../../assets/images/ohno.gif)
{:refdef}

## O script

{% highlight terminal %}
#!/bin/bash
# script pra criar header dos posts do Jekyll já com a data certa

nome_arquivo=$1
data_arquivo=$(date +"%Y-%m-%d")

arquivo="${data_arquivo}-${nome_arquivo}.md"

echo "Criando arquivo $arquivo"

echo "---" >> $arquivo
echo "title: " >> $arquivo
echo "layout: post" >> $arquivo
echo "date: $(date +"%Y-%m-%d %H:%M")" >> $arquivo
echo "image: " >> $arquivo
echo "headerImage: false" >> $arquivo
echo "tag: " >> $arquivo
echo "category: blog" >> $arquivo
echo "author: giovanamorais" >> $arquivo
echo "description: " >> $arquivo
echo "---" >> $arquivo

vim $arquivo
{% endhighlight %}


## Como usar
Você pode jogar na pasta `_posts/` do seu projeto ou em `/usr/local/bin`
se desejar que ele possa ser chamado de qualquer pasta. Aí é só dar o comando

`./create_post.sh nome-do-arquivo`

que ele já vai gerar um arquivo `.md` com a data do dia e inserir as informações
básicas (no caso do script ali em cima, as minhas informações). Depois disso,
abre o arquivo no `vim`, que é o editor que eu uso.


## Próximos passos
O script inicial é a coisa mais simples do mundo e está disponível
[aqui](https://github.com/giovana-morais/toolbox/blob/master/sh/create_post.sh),
junto com [outros scripts aleatórios](https://github.com/giovana-morais/toolbox)
que eventualmente eu acho útil.

Efetivamente falando, os próximos passos seriam:
1. Ajustar o script pra receber uma string digitada normalmente em vez de
uma-string-já-formatada.

2. Pensar em uma maneira de fazer um arquivo de configuração pra setar
algumas variáveis como editor de texto, autor e etc sem ter que fazer isso
hard-coded.

3. Ou mesmo colocar um parâmetro do tipo `--editor vim` ou `--editor nano`
e deixar isso parametrizável. Seria brabo demais.




