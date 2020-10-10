---
title: "Spectral Modeling Synthesis"
layout: post
date: 2020-10-08
headerImage: false
tag:
- dsp
category: leituras
author: giovanamorais
---


Seção do livro [Spectral Audio Signal Processing](https://ccrma.stanford.edu/~jos/sasp/sasp.html),
do Julius O. Smith III.


Para sons periódicos, as componentes senoidais são harmônicas da frequência fundamental \omega_1.

Sons aperiódicos são representados como uma integra de senoides em todas as frequências da audição humana
(20 Hz a 20 KHz).

Senoides representam bem os sons tonais, como a fala ou vogais cantadas ou sons de instrumentos de corda,
por exemplo. A representação do ataque ou decaimento de uma nota é feita por meio da variação da amplitude.
Analogamente, o vibrato é representado peloa modulação da fase.
O ouvido fica em picos no espectro de um som, acabando por mascarar sons de energia baixa que estão com
frequências vizinhas.

A representação de ruído, entretanto, não é tão simples e necessita de muitas senoides para a modelagem.
Pra tornar a representação menos cara é necessário um modelo de ruído, como por exemplo números pseudo-
aleatórios passados em um filtro. Isso é chamado de modelo (S+N) ("_Sines + Noise_").

Outro caso em que modelos senoidais não se comportam bem são para a representação de transientes
repentinos no tempo, como onsets percussivos, sons "glitchies". Embora os transientes consigam
ser modeloados por meio de senoides, o número de componentes necessárias é altíssmo e com as fases
e amplitudes corretas. Para evitar isso, foi criado um modelo para transientes que trabalha com ruído
e as senoides, ou seja, o modelo (S+N+T).
