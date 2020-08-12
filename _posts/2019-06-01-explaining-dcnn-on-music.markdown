---
title: "Explaining Deep Convolutional Neural Networks on Music Classification"
layout: post
date: 2019-06-01
headerImage: false
tag:
- mir
category: leituras
author: giovanamorais
---

Autores: Keunwoo Choi, György Fazekas, Mark Sandler

Disponível em: [ArXiV][arxiv]

Muitas 
[pesquisa][pesquisa-arxiv] e [tutoriais][tutorial] propõem métodos para que consigamos 
visualizar o que uma Rede Neural Convolucional (CNN) está aprendendo em cada camada. 
Isso é importante não só para correção de hiperparâmetros, como também é de extrema 
importância para o entendimento da rede: que tipo de padrão ela está identificando 
e quais estruturas estão ganhando importância como atributos do aprendizado.

Algoritmos como a CNN já são considerados estado-da-arte da área de recuperação 
de informação musical por causa da sua aplicação em entradas como o 
[Mel espectrograma][mel-espec], [STFT][stft], [Constant-Q][const-q]
que são representações 2D compactas mas que contêm informações
valiosas sobre o sinal. Contudo, existe uma diferença fundamental entre aplicar
CNN em reconhecimento de imagem e reconhecimento de gênero musical: no 
primeiro caso, as formas que desejamos identificar já são conhecidas e no
segundo caso não. 

Ou seja, quando temos formas conhecidas, olhar apenas 
as estruturas e os padrões identificados na imagem faz sentido porque
conseguimos associar com o resultado desejado. No segundo caso não,
já que não sabemos o tipo de forma que é necessário um espectrograma 
conter para que uma música
seja do gênero rock e é por isso que apenas a deconvolução não é suficiente
para entendermos que tipo de padrão a rede aprende.

O código completo está disponível no 
[GitHub][github].

[arxiv]: https://arxiv.org/pdf/1607.02444.pdf
[pesquisa-arxiv]: https://arxiv.org/pdf/1311.2901.pdf
[tutorial]: https://hackernoon.com/visualizing-parts-of-convolutional-neural-networks-using-keras-and-cats-5cc01b214e59
[mel-espec]: https://en.wikipedia.org/wiki/Mel_scale
[stft]: https://en.wikipedia.org/wiki/Short-time_Fourier_transform 
[const-q]: https://en.wikipedia.org/wiki/Constant-Q_transform 
[github]: https://github.com/keunwoochoi/Auralisation

