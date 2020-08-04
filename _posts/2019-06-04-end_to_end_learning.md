---
title: "End-to-end learning for music audio tagging at scale"
layout: post
date: 2019-06-04
headerImage: false
tag:
- mir
- redes neurais
- pesquisa
author: giovanamorais
category: estudos, artigos
---

Autores: Jordi Pons, Oriol Nieto, Matthew Prockup, Andreas Ehmann, Xavier Serra
Disponível em: [ArXiv][arxiv]

Nota aleatória: Eu amo muito esse artigo.

Logo quando eu comecei a estudar Recuperação de Informação Musical, eu ficava muito
confusa porque a maioria dos sistemas que eu encontrava usavam direto o espectrograma,
que é uma representação compacta e etc, e não entendia o porquê de não usarem o
áudio em si. Esse artigo iluminou minha pequena mente e tudo fez sentido.

No estudo, tanto a arquitetura que trabalha com o áudio quanto a arquitetura que
trabalha com a imagem usam o mesmo back-end de processamento e variam
apenas no front-end, que seriam as camadas que lidam diretamente com o *input*
da rede.

A conclusão é que a entrada pura funciona melhor quando a base de
treinamento é gigante. Isso fica claro considerando o conceito do deep learning:
quanto mais processamento e mais dados, melhor a rede vai aprender e se comportar
com novas entradas. É esperado que, nesse caso, o sistema aprenda features que não
estão disponíveis para o espectrograma, mas ainda não é claro que tipo de
features são essas.

Contudo, a entrada como log-mel espectrograma se comporta muito bem pros casos
em que a base de entrada é menor e isso acontece porque o espectrograma é considerado
uma entrada de domínio específico, ou seja, já tem informações musicais bem
claras, como, por exemplo, o tempo e o timbre da música. Faz sentido uma
entrada menor e com mais informação específica da música simplificar também a
quantidade de processamento que é feito.


O código está disponível no [GitHub][github].

[github]: https://github.com/jordipons/music-audio-tagging-at-scale-models
[arxiv]: https://arxiv.org/pdf/1711.02520.pdf
