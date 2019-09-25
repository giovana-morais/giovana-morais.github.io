---
title: Retirando a mensagem de "Invalid Partition Table!" que aparece antes do computador inicializar
layout: post
date: 2019-09-24
headerImage: false
tag:
- SO
- fdisk
- outros
category: blog
author: giovanamorais
---

## O problema

Recentemente formatei meu computador e quando finalmente fui fazer o primeiro
boot, notei que aparecia uma mensagem de "Invalid Partition Table", mas
que essa mensagem não impedia meu computador de ligar.
Muito pelo contrário, depois de apertar um `Enter`, a mensagem
sumia e o GRUB iniciava normalmente. Estranhei bastante e decidi
pesquisar.

Após alguns minutos de busca, descobri o que aconteceu: quando fui montar as
minhas partições, esqueci de dizer que elas eram "bootáveis". Já estava
achando que ia ter que fazer todo o processo de formatação novamente, mas nem
foi preciso.

## Como resolver?

Depois de ligar seu computador, abra um terminal e digite `fdisk -l /dev/sdX`,
onde `sdX` deve ser trocado pela
sua partição, que geralmente é `sda` mesmo. Se nenhuma partição aparecer
rode o mesmo comando como root.

Se aparecer uma partição com um asterisco (\*), essa partição está selecionada
inicialização.

{% highlight terminal %}
fdisk -l /dev/sda

Disco /dev/sda: 931,53 GiB, 1000204886016 bytes, 1953525168 setores
Modelo de disco: WDC WD10JPVX-75J
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes
Tipo de rótulo do disco: dos
Identificador do disco: 0x3ad8aefb

Dispositivo Inicializar    Início        Fim    Setores Tamanho Id Tipo
/dev/sda1                    2048     411647     409600    200M 83 Linux
/dev/sda2                  411648   42354687   41943040     20G 83 Linux
/dev/sda3                42354688  105269247   62914560     30G 83 Linux
/dev/sda4   *           105269248 1953525167 1848255920  881,3G 83 Linux

{% endhighlight %}

Se nenhuma partição aparecer, rode o comando novamente como root.

Digite `m` se quiser ver todas as suas opções de comando no `fdisk`.
A seguir, digite `a` para escolher qual partição deseja setar como inicializável,
`w` para salvar e fim.

{% highlight terminal %}
Comando (m para ajuda): m

  DOS (MBR)
   a   alterna a opção de inicialização
   b   edita o rótulo do disco BSD aninhado
   c   alterna a opção "compatibilidade"

  Genérico
   d   exclui uma partição
   F   lista partições não particionadas livres
   l   lista os tipos de partições conhecidas
   n   adiciona uma nova partição
   p   mostra a tabela de partição
   t   altera o tipo da partição
   v   verifica a tabela de partição
   i   mostra informação sobre uma partição

  Miscelânea
   m   mostra este menu
   u   altera as unidades das entradas mostradas
   x   funcionalidade adicional (somente para usuários avançados)

  Script
   I   carrega layout de disco de um arquivo script de sfdisk
   O   despeja layout de disco para um arquivo script de sfdisk

  Salvar & sair
   w   grava a tabela no disco e sai
   q   sai sem salvar as alterações

  Cria um novo rótulo
   g   cria uma nova tabela de partição GPT vazia
   G   cria uma nova tabela de partição SGI (IRIX) vazia
   o   cria uma nova tabela de partição DOS vazia
   s   cria uma nova tabela de partição Sun vazia


Comando (m para ajuda): a
Número da partição (1-4, padrão 4): [insira aqui a partição desejada]

Comando (m para ajuda): w
{% endhighlight %}

Agora tudo deve funcionar normalmente. (:
