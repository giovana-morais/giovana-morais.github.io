---
title: "Fundamentals of Music Processing"
layout: post
date: 2020-08-13
headerImage: false
tag:
- mir
- livro
category: leituras
author: giovanamorais
---

Autor: Meinard Müller

---

## Sumário 
- [Prefácio](#prefacio)
- [1. Representações Musicais](#representacoes)
- [2. Análise de Sinais com Fourier](#fourier)
- [3. Sincronização de Música](#sincronizacao)
- [4. Análise de Estrutura Musical](#analise-estrutura)
- [5. Reconhecimento de Acordes](#reconhecimento-acordes)
- [6. Tempo e Marcação de Beat](#tempo)
- [7. Content-Based Audio Retrieval](#content-retrieval)
- [8. Musically Informed Audio Decomposition](#audio-decomposition)

---

## Prefácio
---
## 1. Representações Musicais
---
## 2. Análise de Sinais com Fourier
---
## 3. Sincronização de Música

Música pode ser descrita e representada de diferentes formas, como partituras,
representações simbólicas e gravações, que abrem espaço para diferentes 
interpretações.
A ideia intuitiva da sincronização é conseguir encontrar, dada uma posição
em uma representação musical, a posição correspondente em outra representação.


### 3.1 Atributos de áudio

* Atributos obtidos de um espectrograma ao converter a frequência de eixo linear
(medido em Hertz) para um eixo logarítmico (medido em pitches).

#### 3.1.1 Espectrograma de Frequência-Logarítmica

* *Equal-tempered scale*: cada potava é dividida em 12 unidades logaritmicamente (?)
espaçadas.

#### 3.1.2 Atributos de Chroma

**3.1.2.1 Compressão logarítmica** 

* Alternativa ao uso da escala em decibéis. Propõe um realce de valores mais baixos, mas
que ainda são relevantes, para que estes não sejam ofuscados pelos valores mais altos.
* Função definida como \Theta_\gama(v) = log(1 + \gama * v), aplicada a todos os valores
quando é necessária uma representação com valores positivos, como um espectrograma ou
cromagrama. Quanto maior o valor de \gama maior a compressão.
* Atributos de chroma são invariantes a timbre até um certo ponto. (curioso)
* Essa compressão é bastante usada quando precisamos de atributos que 
"simulem" nossa percepção.

---
## 4. Análise de Estrutura Musical
---
## 5. Reconhecimento de Acordes
---
## 6. Tempo e Marcação de Beat

Intuitivamente, a batida da música (o beat) corresponde a um pulso que um humano dá 
enquanto escuta uma música, às vezes até de maneira inconsciente. A batida é geralmente 
descrita como uma sequência de pulsos percebidos, que tipicamente são igualmente 
espaçados no tempo e especificados pela *fase* e pelo *período*. 


### 6.1 Detecção de onsets

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


#### 6.1.1 Métodos baseados em energia
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

#### 6.1.2 Métodos baseados em espectro
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
não acabar usando um parâmetro \gama muito alto, de forma que ruídos também
sejam realçados e atrapalhem a análise.
	- computar a derivada discreta do espectro comprimido, considerando apenas
diferenças positivas (aumento de intensidade) e descartando as negativas;
* Existem passos posteriores que podem ainda melhorar o desempenho de, 
por exemplo, a identificação de picos no sinal, removendo flutuações baixas
por meio de uma função média local;


#### 6.1.3 Métodos baseados em fase
* Tons estacionários têm uma fase estável, enquanto transientes têm uma fase 
instável.
* Uma fase \phi determina como uma senoide de frequência Fs tem que ser 
deslocada pra melhor se correlacionar com o sinal janelado correspondente
ao n^th frame;


#### 6.1.4 Métodos de domínio complexo

### 6.2 Análise de Tempo
#### 6.2.1 Tempograma
#### 6.2.2 Tempograma de Fourier 
#### 6.2.3 Tempograma de autocorrelação
#### 6.2.4 Tempograma de cíclico

### 6.3 Beat and Pulse Tracking
#### 6.3.1 Predominant Local Pulse
#### 6.3.2 Beat Tracking by Dynamic Programming
#### 6.3.3 Adaptative Windowing

### 6.4 Further Notes

---

## 7. Content-Based Audio Retrieval
---
## 8. Musically Informed Audio Decomposition