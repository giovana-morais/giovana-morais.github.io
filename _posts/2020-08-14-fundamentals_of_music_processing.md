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
mudança de escala ou de compressão logarítmica. A desvantagem dessa abordagem é que ruídos podem também ser amplificados.
* Sons com vibrato ou tremolo podem ser um problema pra métodos baseados em energia, uma vez que sua variação acaba enganando o método de detecção, que 
entende vários onsets em vez de apenas um. 

#### 6.1.2 Métodos baseados em espectro
* Música polifônica dificulta a tarefa uma vez que eventos de baixa intensidade
podem estar mascarados atrás de eventos de alta intensidade. Além disso, há o
vibrato, que pode ser até mais forte que o ataque de outras notas. Por isso, métodos baseados em energia podem não ser os melhores.
* A ideia desse tipo de método e ir pro domínio da frequência e então capturar
as mudanças no conteúdo espectral.
* Para detectar as mudanças espectrais no sinal, computamos a diferença entre
vetores espectrais subsequentes. Isso é conhecido como **fluxo espectral**.


#### 6.1.3 Métodos baseados em fase
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