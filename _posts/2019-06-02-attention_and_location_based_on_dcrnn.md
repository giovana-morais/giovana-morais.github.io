---
title: "Attention and Localization based on a Deep Convolutional Recurrent Model for Weakly Supervised Audio Tagging"
layout: post
date: 2019-06-02
tag: 
- mir
- tagging
category: leituras
author: giovanamorais
---
Autores: Yong Xu, Qiuqiang Kong, Qiang Huang, Wenwu Wang, Mark D. Pumbley

Disponível em: [Semantic Scholar][semantic]

Esse artigo propõe uma técnica de auto-tagging para a classificação de ruídos de ambiente 
e por isso que os frameworks de atenção e localização são tão importantes: eles conseguem
identificar os pontos realmente importantes e suprimir os ruídos indesejados que também fazem
parte do ambiente.

Ao contrário da maioria dos estudos que eu li até agora, a entrada da rede não é um áudio
inteiro ou seu espectrograma mas sim os chunks do áudio. Ou seja, em vez de uma rede que identifica
padrões por todo o sinal, cada chunk recebe uma classificação e uma rede recorrente é alimentada
por esses resultados, fazendo um tipo de média para conseguir achar um padrão que seja global.

Olhando por esse ponto de vista, o trabalho propõe algo similar ao trabalho do Choi, que 
também faz a junção de uma CNN com uma RNN a fim de identificar padrões locais e depois sumarizá-los
para que sobrem apenas os que são relevantes a nível global.

Outra coisa legal que o artigo propõe são os frameworks de atenção e localização. O primeiro busca
identificar quais os sinais mais importantes para a classificação do áudio todo, atribuindo peso de 
mais ou menos importância e, com isso, também tentando suprimir ruídos indesejados. O segundo, que
depende do primeiro, busca os ruídos importantes no tempo do áudio.

A impressão que eu tive é que, em aplicações de **Music Tagging**, o framework de localização
não faz tanto sentido porque não há ruído ambiente que se misture com o sinal da música. Contudo, o
coeficiente de atenção é bastante interessante pra casos de tags com características muito marcantes, por exemplo algum padrão de percussão ou algo similar.

[semantic]: https://pdfs.semanticscholar.org/fc81/205f3580998d642d029a91be9ceb9d10ff4f.pdf
