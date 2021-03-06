---
title: "Fundamentals of Music Processing"
layout: post
date: 2020-10-08
headerImage: false
tag:
- mir
- livro
category: leituras
author: giovanamorais
---

Autor: Meinard Müller

---

# Sumário
- [1. Representações Musicais](#1-representacoes-musicais)
- [2. Análise de Sinais com Fourier](#2-análise-de-sinais-com-fourier)
- [3. Sincronização de Música](#3-sincronização-de-música)
- [4. Análise de Estrutura Musical](#4-análise-de-estrutura-musical)
- [5. Reconhecimento de Acordes](#5-reconhecimento-de-acordes)
- [6. Tempo e Marcação de Beat](#6-tempo-e-marcação-de-beat)
- [7. Content-Based Audio Retrieval](#content-retrieval)
- [8. Musically Informed Audio Decomposition](#audio-decomposition)

---

# 1. Representações Musicais
---
# 2. Análise de Sinais com Fourier

A análise de Fourier busca decompor um sinal complexo, como é o caso do sinal
musical, em blocos de componentes senoidais, que tem uma interpretação interessante
e explícita por conta das frequências. Ou seja, passamos a analisar um sinal não
mais em função de seu tempo, mas em função das suas frequências.

## 2.1 Fourier Transform in a Nutshell

A ideia principal da análise de Fourier é comparar o sinal com senoides de frequência
$\omega$ Hz variadas. Para cada comparação é calculado o coeficiente de magnitude $d_{\omega}$,
que representa a similaridade entre o sinal e a senoide de frequência $\omega$,
e uma fase $\phi_{\omega}$.

A transformada de Fourier permite a reconstrução perfeita do sinal original a partir
de $d_{\omega}$ e $\phi_{\omega}$.

## 2.1.1 Transformada de Fourier para Sinais Analógicos

**2.1.1.1 O papel da fase**

* Dado uma senoide $g: \mathbb{R} \rightarrow \mathbb{R}$, tal que
$g(t) := A \sin(2\pi(\omega t - \phi))$ para $t \in \mathbb{R}$, onde A representa
a amplitude do sinal, \omega a frequência em Hz e \phi a fase, medida em
radianos normalizados com 1 correspondendo a um ângulo de 360 graus.
* Na análise de Fourier, a senoide usada é normalizada em relação a sua energia
média ao usarmos $A = \sqrt{2}$. Então para cada $\phi$, temos
$\cos_{\omega, \phi}(t) = \sqrt{2}\cos(2\pi(\omega t - \phi))$. Como a senoide é
periódica, consideramos a fase apenas no intervalo $[0, 1)$.
* Ao termos a frequência fixada, podemos usar a fase para deslocar a senoide
no tempo e vermos de qual maneira ela tem a maior similaridade com o sinal que
estamos analisando.

**2.1.1.2 Calculando Similaridade com Integrais**
* A similaridade é dada por meio da integral do produto de duas funções:
$\int_{t\in\mathbb{R}}f(t)\cdot g(t)$

**2.1.1.3 Primeira Definição da Transformada de Fourier**
* Basicamente, precisamos calcular a similaridade entre o sinal de áudio que
temos e a senoide \cos_{\omega,\phi}.
* Para cada frequência \omega fixa, temos
* $d_{\omega} = \max_{\phi \in [0, 1)}\left(\int_{t \in \mathbb{R}} f(t) \cos_{\omega, \phi}(t)dt\right)$
* $\phi_{\omega} = arg\max_{\phi \in [0, 1)}\left(\int_{t \in \mathbb{R}} f(t) \cos_{\omega, \phi}(t)dt\right)$
* A transformada de Fourier é definida pela coleção de todos os coeficientes $d_{\omega}$ e $\phi_{\omega}$.

**2.1.1.4 Números Complexos**
N/A

**2.1.1.5 Definição Complexa da Transformada de Fourier**
* A inserção dos números complexos faz com que consigamos codificar tanto a
magnitude $d_{\omega}$ quando a fase $\phi_{\omega} $em um único número complexo
representado como uma coordenada polar.

---
# 3. Sincronização de Música

Música pode ser descrita e representada de diferentes formas, como partituras,
representações simbólicas e gravações, que abrem espaço para diferentes
interpretações.
A ideia intuitiva da sincronização é conseguir encontrar, dada uma posição
em uma representação musical, a posição correspondente em outra representação.


## 3.1 Atributos de áudio

* Atributos obtidos de um espectrograma ao converter a frequência de eixo linear
(medido em Hertz) para um eixo logarítmico (medido em pitches).

## 3.1.1 Espectrograma de Frequência-Logarítmica

* *Equal-tempered scale*: cada potava é dividida em 12 unidades logaritmicamente (?)
espaçadas.

## 3.1.2 Atributos de Chroma

**3.1.2.1 Compressão logarítmica**

* Alternativa ao uso da escala em decibéis. Propõe um realce de valores mais baixos, mas
que ainda são relevantes, para que estes não sejam ofuscados pelos valores mais altos.
* Função definida como $\Theta_\gamma(v) = \log(1 + \gamma * v)$, aplicada a todos os valores
quando é necessária uma representação com valores positivos, como um espectrograma ou
cromagrama. Quanto maior o valor de \gamma maior a compressão.
* Atributos de chroma são invariantes a timbre até um certo ponto. (curioso)
* Essa compressão é bastante usada quando precisamos de atributos que
"simulem" nossa percepção.

---
# 4. Análise de Estrutura Musical
---
# 5. Reconhecimento de Acordes
---
# 6. Tempo e Marcação de Beat

Intuitivamente, a batida da música (o beat) corresponde a um pulso que um humano dá
enquanto escuta uma música, às vezes até de maneira inconsciente. A batida é geralmente
descrita como uma sequência de pulsos percebidos, que tipicamente são igualmente
espaçados no tempo e especificados pela *fase* e pelo *período*.

Tem esse [vídeo perfeito](https://www.youtube.com/watch?v=FmwpkdcAXl0) do próprio
Müller sobre tempo e beat tracking. :top:


## 6.1 Detecção de onsets

Definições:
- **ataque**: momento no qual o som aumenta, o que tipicamente
também implica um crescimento agudo do envelope da amplitude.
- **transiente**: componente de curta duração e alta amplitude, geralmente
ocorre no começo de um tom musical. Contudo também pode ocorrer ao soltar
uma nota que foi sustentada há muito tempo. Basicamente, em regiões transientes
o sinal evoluí rapidamente e até de maneira caótica.
- **onset**: Ao contrário do ataque e do transiente, o onset se refere a um
instante único que marca o começo do transiente.

Para detectar onsets em um sinal a ideia é capturarmos os momentos de mudanças
repentinas, que indicam o início de regiões transientes. No caso de notas que
tem um ataque bastante pronunciado, o onset pode ser determinado ao localizar
as posições em que a amplitude começa a crescer. Contudo, a tarefa pode ficar
mais difícil quando temos notas mais suaves que apresentam um aumento lento
em sua energia. Ainda mais complexo quando há música polifônica. Esses casos
requerem métodos mais refinados.


## 6.1.1 Métodos baseados em energia
* Aproveitar que algumas notas representam o aumento súbito de energia pra
fazer a análise de energia do sinal procurando por aumentos repentinos.
* Uso de janelamento pra encontrar picos locais. Geralmente com trechos de
áudio de até 10ms.
* Sons com pouca energia podem acabar passando despercebidos pelo método de
detecção quando consideramos a energia como algo linear. O ouvido humano
percebe o som em uma escala logarítmica e, portanto, para endereçar o problema
precisamos aplicar o logaritmo pros valores da energia. Seja por meio de uma
mudança de escala ou de compressão logarítmica. A desvantagem dessa abordagem
é que ruídos podem também ser amplificados.
* Sons com vibrato ou tremolo podem ser um problema pra métodos baseados em
energia, uma vez que sua variação acaba enganando o método de detecção, que
entende vários onsets em vez de apenas um.

## 6.1.2 Métodos baseados em espectro
* Música polifônica dificulta a tarefa uma vez que eventos de baixa intensidade
podem estar mascarados atrás de eventos de alta intensidade. Além disso, há o
vibrato, que pode ser até mais forte que o ataque de outras notas. Por isso, métodos
baseados em energia podem não ser os melhores.
* A ideia desse tipo de método e ir pro domínio da frequência e então capturar
as mudanças no conteúdo espectral.
* Para detectar as mudanças espectrais no sinal, computamos a diferença entre
vetores espectrais subsequentes. Isso é conhecido como **fluxo espectral**.
* O procedimento básico é
	- realçar os componentes espectrais mais fracos usando
a compressão logarítmica. O uso da compressão logarítmica faz ainda mais sentido
quando pensamos que algumas energias não tem amplitude alta o suficiente para
serem notadas em uma escala normal. O único cuidado a ser tomado é
não acabar usando um parâmetro $\gamma$ muito alto, de forma que ruídos também
sejam realçados e atrapalhem a análise.
	- computar a derivada discreta do espectro comprimido, considerando apenas
diferenças positivas (aumento de intensidade) e descartando as negativas;
* Existem passos posteriores que podem ainda melhorar o desempenho de,
por exemplo, a identificação de picos no sinal, removendo flutuações baixas
por meio de uma função média local;


## 6.1.3 Métodos baseados em fase
* Tons estacionários têm uma fase estável, enquanto transientes têm uma fase
instável.
* Uma fase $\phi$ determina como uma senoide de frequência Fs tem que ser
deslocada pra melhor se correlacionar com o sinal janelado correspondente
ao n-iésimo frame;


## 6.1.4 Métodos de domínio complexo
* Se a magnitude de um coeficiente $X(n, k)$ de Fourier for muito pequena, a fase
pode apresentar um comportamento caótico por causa de ruído e pequenas flutuações;
* O que se assume em um método de domínio complexo é que as diferenças de fase e de
magnitude são mais ou menos constantes em regiões constantes;
* A diferença entre os frames $X(n+1,k)$ e a estimativa $X^(n+1, k)$ quantifica o grau
de não-estacionaridade para o frame n e o coeficiente k. Contudo, sem discriminar se
é um onset (aumento de energia) ou um offset (redução de energia).

## 6.2 Análise de Tempo
A análise de tempo e de beat pode ser um desafio quando os onsets são fracos e há
mudanças locais no tempo ([rubato](https://pt.wikipedia.org/wiki/Tempo_rubato)) ou
quando o fluxo rítmico é interrompido ou perturbado
como é o caso da [síncope](https://pt.wikipedia.org/wiki/Síncope_(música)).
Assumimos que os onsets estão geralmente nos começos dos beats e que, para pelo menos
algum período de tempo, os beats são igualmente espaçados. Embora isso seja violado
algumas vezes, funciona pra maior parte das músicas comerciais, como pop e rock.

## 6.2.1 Representações de Tempograma
O tempograma indica para cada instante t uma relevância de um tempo específico de
uma gravação. O tempo t é medido em segundos, enquanto o parâmetro de tempo $\tau$
é medido em BPM.

O tempograma é calculado no domínio do tempo, com o sinal discretizado. Assumindo que os
pulsos têm a mesma posição que os onsets, o primeiro passo é usar uma função novidade
para determinar as posições dos onsets.

Considerando a frequência $\omega$ Hz e um espaçamento entre as amostras de $T$, o _tempo_ $\tau$
em BPM (beats per minute) é dado por $\tau = 60\omega$.

O tempo pode ter harmônicos e subharmônicos, uma vez que há algumas maneiras diferentes
nas quais podemos perceber o beat e o tempo. Essas maneiras diferentes de percepção
envolvem níveis de pulso maiores e menores.

## 6.2.2 Tempograma de Fourier

Para estimar a periodicidade, usamos a DTFT para calcular o coeficiente complexo de
Fourier $F(n,\omega)$. Buscamos aqui a correlação entre o coeficiente de Fourier e
uma seção (vizinhança) da função novidade, ou seja, a posição do tempograma é
dada pela correlação entre esses dois termos.

Definido por

$T^F(n, \tau) = |F(n, \tau/60)|$,

onde F é o coeficiente de Fourier.


Essa categoria de tempograma geralmente indica os harmônicos do tempo, mas
suprime os subharmônicos. Em aplicações práticas, só o intervalo entre 30 e
600 BPM (extremos inclusos é coberto), devido à nossa percepção de tempo.

## 6.2.3 Tempograma de autocorrelação

A autocorrelação é uma ferramente pra indicar a similaridade de um sinal
com ele mesmo com um deslocamento (_shift_) no eixo do tempo.  Também é conhecido
como produto interno deslizante.

É definido por

$R_{xx}(l) = \sum_{m \in Z} x(m)x(m-l)$,

onde l é o deslocamento no tempo, conhecido também por _lag_.

* $R_{xx}(l)$ é máxima pra l = 0;
* A autocorrelação grande pra um dado _lag_ indica a periodicidade do sinal naquele período
de tempo

Aplicar apenas um valor de _lag_ na autocorrelação faz com que só saibamos a semelhança do
sinal com ele mesmo para aquele valor, por isso existe a _short-time autocorrelation_, que é
calculada para um número variável de lags

$A(n, l) = \sum_{m \in Z} \Delta(m)w(m-n)\Delta(m-l)w(m-n-l)$

Essa representação é uma representação tempo-lag e precisa ser convertia para
tempo-bpm pra conseguirmos estimar o tempo.


## 6.2.4 Tempograma  cíclico

## 6.3 Beat and Pulse Tracking
## 6.3.1 Predominant Local Pulse

PLP é uma melhoria da função novidade, que consegue recuperar os valores de onsets
mais suaves, também se comportando bem em relação às mudanças locais de tempo ao escolher
o nível de pulso predominante do trecho do sinal.
A amplitude da curva do PLP representa a confiança naquela taxa de beats.

## 6.3.2 Beat Tracking by Dynamic Programming
## 6.3.3 Adaptative Windowing

## 6.4 Further Notes

---

# 7. Content-Based Audio Retrieval
---
# 8. Musically Informed Audio Decomposition
