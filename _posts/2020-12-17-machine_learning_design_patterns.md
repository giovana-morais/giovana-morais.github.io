---
title: "Machine Learning Design Patterns"
layout: post
date: 2020-12-17
headerImage: false
tag:
- machine learning
category: leituras
author: giovanamorais
---

# Sumário:
* [The Need for Machine Learning Design Patterns](#the-need-for-machine-learning-design-patterns)
* [Data Representation Design Patterns](#data-representation-design-patterns)

# The Need for Machine Learning Design Patterns

* Padrões são usados para indicar como resolver situações que já foram resolvidas
muitas vezes, mostrando o essencial da solução, sem incluir especificidades.
* Como Machine Learning está se tornando mainstream, o melhor que podemos fazer
é aproveitar dos métodos que já foram testados e provados pra endereçar problemas
recorrentes.

## Common Challenges
* Qualidade dos dados:
  - Acurácia: analisar e remover duplicados, checar por features faltantes, erros e
inconsistências, tanto nos dados quanto nos labels para o caso de modelos supervisionados.
  - Completude: representação diversa de cada label.
  - Consistência: às vezes há inconsistências na representação de uma amostra. Um exemplo
bem bom que pensei é no caso de diferentes pessoas que geram tags para gêneros musicais:
cada pessoa tem seu próprio viés e isso pode fazer com que uma mesma música tenha gêneros
diferentes. Cabe a quem usa o dataset tratar esses casos.
  - Tempo: latência entre quando um evento ocorreu e quando foi adicionado ao
seu banco de dados.

## Reproducibilidade
Por conta de aspectos naturalmente aleatórios do Aprendizado de Máquina, como os pesos
que são iniciados aleatoriamente em uma rede neural e etc, é comum usamos _seeds_
definidas, de forma que alguém que usar os mesmos dados, mesmas abordagens
pra divisão dos dados em treino, teste e validação e a mesma _seed_ consiga
reproduzir os mesmos resultados ou os mesmos erros.

## Data Drift
Esse conceito significa basicamente quando a distribuição dos seus dados mudam e
seu modelo e suas features já não conseguem representar bem o que está chegando
na entrada do algoritmo. Existem algumas maneiras automáticas de identificar isso,
por exemplo checando o desvio padrão dos dados. É importante sempre retreinar o modelo
quando um fenômeno desses acontece.

## Escala
Escalar modelos e fluxos de Aprendizado de Máquina pode se tornar bastante
complexo uma vez que muitas das técnicas que usamos já dependem do tamanho dos
dados que temos em mãos. Essa tarefa fica geralmente na mão de engenheiros de
AM/ML, que conhecem ferramentas mais adequadas para escalar esses fluxos.

## Múltiplos Objetivos
Embora o modelo seja feito apenas por uma equipe, diversas partes envolvidas têm
uma ideia diferente do que é o "sucesso" do modelo.


---

# Data Representation Design Patterns

* _Embeddings_: representação de dados que redes neurais profundas conseguem aprender
sozinhas. Essa representação final é densa e com dimensão menor que a entrada, que
pode ser esparso.
* Extração de features: processo de aprender os atributos que representam os dados
de entrada.
* _Feature Cross_: quando se usa uma combinação linear de mais de um atributo na
entrada do modelo, o que simplifica o aprendizado e as relações entre variáveis
categóricas com mais de um valor;
* _Hashed Feature_: padrão para representações de dados que não são fixas ou
aprendidas (como no caso de embeddings).

## Simple Data Representations

### Entradas numéricas

Escalar dados numéricos para o intervalo de [-1,1] é necessário para otimizar
as operações do gradiente descendente e fazer com que a convergência seja mais
rápida. O intervalo [-1,1] também oferece uma precisão de ponto flutuante maior.
Escalar os dados também faz com que atributos diferentes não tenham uma diferença
relativa tão grande.

Existem diferentes métodos de normalização (_scaling_) das variáveis. Algumas
dessas transformações são lineares como
* Min-max: o valor é escalado de forma que o menor valor se torne -1 e o maior
+1. O problema dessa abordagem é que os maiores e menores valores geralmente
são _outliers_, o que faz com que os dados fiquem concentrados em um intervalo
muito pequeno entre [-1,1]. Funciona muito bem para datasets que são
uniformemente distribuídos.
* Clippingi junto com min-max: ajuda a corrigir o problema dos _outliers_.
Valores que fazem mais "sentido" são escolhidos como mínimo e máximo do _dataset_
e, a partir disso, valores maiores ou menores são substituídos pelo máximo e mínimo
respectivamente.
* Normalização Z-score: usa a média e o desvio padrão pra normalizar o dataset,
já tratando os casos de _outliers_. `x_normalizado = (x - media_x)/desvio_x`.
Funciona bem pra dados normalmente distribuídos.
* Winsorizing: Faz o clipping do dataset de acordo com, por exemplo, os valores
do décimo e do nonagésimo percentil. A partir daí, faz a escala min-max.

Além das transformações lineares, existem as não-lineares que são usadas para
os casos em que os dados são enviesados (_skewed_) e, portanto, não têm
uma distribuição normal. Algumas transformações usadas antes da normalização:
* Logarítmo: tirar o logarítmo das variáveis faz com que as que têm menor valor
tenham um ganho maior do que variáveis com valor alto;
* Sigmoide e expansões polinomiais: a partir do logarítmo, podemos aplicar outras
transformações, como essas expansões que acabam jogando o valor pro intervalo
desejado.
* Bucketize: a ideia é criar um histograma e a partir dele fazer uma equalização.
* Transformada Box-Cox: essa transformada busca tirar a dependência da variância
da magnitude dos valores na distribuição.

#### Arrays de Números
