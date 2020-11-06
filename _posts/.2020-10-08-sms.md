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

## Additive Synthesis (Early Sinusoidal Modeling)

[Daniel Bernoulli](https://ccrma.stanford.edu/~jos/sasp/Daniel_Bernoulli_s_Modal_Decomposition.html#sec:bernoulli)
foi o primeiro a acreditar que qualquer vibração acústica poderia ser
representada como uma superposição de modos simples, o que caracteriza o termo
síntese aditiva, na qual qualquer som s(t) pode ser expressado como uma soma de
senoides.

y(t) = \sum_{i=1}^N A_i(t)\sin[\theta_i, (t)], onde

* A_i = amplitude do i-ésimo parcial no tempo t
* \theta_i(t) = \int_0^t \omega_i(t)dt + \phi_i(0)
* \omega_i(t) = d\theta_i(t)/dt = frequência em radianos do i-ésimo parcial i vs tempo
* \phi_i(0) = fase no i-ésimo parcial no tempo 0

Para reproduzir um sinal dado, primeiro precisamos analisá-lo para determinar as
amplitudes e as trajetórias de frequências pra cada componente. A fase só será
relevante para frames que contenham ataques ou mudanças abruptas no sinal.

### Following Spectral Peaks

Picos senoidais são medidos no tempo em uma sequência de FFTs, sendo agrupados
em "faixas". O resultado final é uma coleção de envelopes de frequência e amplitude
no tempo. A taxa de amostragem desses envelopes é igual a taxa de frames da
análise (se o tempo entre FFTs é \delta t= 5s, então a taxa de frame é definida por
[1](1/)\delta t = 200H Hz).

A ressíntese feita por uma IFFT é feita sem modificações, contudo se for necessário ou
desejado usar osciladores senoidais, os envelopes precisam ser interpolados na taxa
de amostragem do sinal. (<- **por quê?**)

A fase pode ser descartada em momentos constantes da música e, quando necessário,
ser redefinida como a integral da frequência instantânea.
$$
\hat{\Phi}_k(n) = \Phi_k(n-1) + 2\pi T \hat{F}_k(n)
$$

#### Sinusoidal Peak Finding
*

#### Tracking Sinusoidal Peaks in a Sequence of FFTs
* Os picos precisam ser associados de frame em frame
* Um sistema de tracking encontram amplitudes, frequências centrais e algumas vezes
a fase.
* A interpolação quadrade é usada pra achar picos de magnitude espectral.
* As senoides são ressintetizadas por meiod a IFFT

## Sines + Noise Modeling
* Quando um pico espectral é denso, as componentes senoidais não são percebidas
individualmente, então é suficiente representar uma estatística perceptual dela.
* O ruído branco inserido é filtrado e somado a senoide
*

Sumário:
* Achar os picos nos frames da STFT
	- Nesse passo, detectamos quantos picos forem possíveis e só depois analisamos
	quais se comportam bem ou não, ou seja, quais não são ruídos.
*

## Glossário
* Envelopes: é o "contorno" do elemento no tempo. É uma primeira
aproximação da altura estimada, uma vez que descreve como um som varia no tempo.
Pode ser aplicado a amplitudes, a frequências e a tons (_pitches_).

