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

O tratamento para os casos em que os arrays não têm tamanho fixo geralmente são
* Usar estatísticas (média, tamanho, mínimo, máximo etc) como descritores.
* Representar o array em termos da sua distribuição.
* Se o array for ordenado, pegar, por exemplo, apenas os últimos valores e
quando o tamanho do array for menor que a quantidade de posições que desejamos
pegar, inserimos um padding.

### Entradas Categóricas

Para entradas categóricos, faz sentido usar o _one-hot encoding_ em vez de só
criar variáveis numéricas pra cada categoria porque o segundo caso faz com que
o sistema entenda que essas variáveis são relacionadas e ordernadas de alguma forma,
sendo que não é o caso.

O _one-hot encoding_ é recomendados nos seguintes casos
* Quando o índice numérico é um índice
* Quando a relação entre a entrada e a saída (rótulo) não é contínua
* Quando é vantajoso agrupar a variável numérica em intervalos
* Quando precisamos tratar diferentes valores da entrada numérica como
  efeitos diferentes no rótulo. Supondo que você queira definir se um bebê nasceu
  com um peso saudável. Para isso, precisa saber se nasceu apenas uma criança
  ou se são gêmeos, trigêmeos etc. O valor considerado "saudável" depende da
  quantidade de crianças.

## Design Pattern #1: Hashed Feature

O problema do _one-hot encoding_ é que você precisa saber as categorias *antes*,
o que nem sempre é verdade. Mesmo na divisão treino/teste pode ser que categorias
do teste não estejam no treino. Além disso, a cardinalidade pode crescer tanto quanto
for possível, uma vez que não sabemos qual o número máximo de categorias

Criar essa hash de features permite que:
1. entradas ainda desconhecidas caiam no mesmo intervalo que entradas semelhantes. Embora isso faça com que a predição não seja precisa, faz também com que não seja completamente aleatória.
2. a cardinalidade seja distribuída entre os intervalos (buckets).

O trade-off desse padrão é justamente a falta de precisão do modelo. Uma regra
geral para isso é definir um tamanho de bucket em que haja aproximadamente 5
entradas, dessa forma mantendo uma precisão mais ou menos ok. Mesmo assim, esse
método de hash não é indicado se o vocabulário *já é conhecido*.

A escolha do número de buckets deve ser tratada como um hiperparâmetro, já que
laria de problema pra problema.

Dicas:
* A ordem das operações importa. Primeiro o módulo e depois o valor absoluto deve
deve ser aplicado pra evitar erro de _overflow_ por conta da faixa de representação.
* É bom aplicar uma regularização L2 para tratar casos
em que algum bucket fique vazio sem que o modelo fique numericamente instável.

## Design Patterns #2: Embeddings

O _one-hot encoding_, além de criar uma matriz esparsa muito grande pro caso de
haver muitas categorias, ainda tem o problema de tratar as variáveis como
independentes e esses são os pontos que os _embeddings_ buscam resolver.

Embeddings são uma maneira de representar dados não-numéricos de maneira
significativa, de forma a facilitar o tratamento dentro dos modelos de aprendizado
de máquina, mapeando as categorias em vetores densos de uma cardinalidade menor
e fixa. Na prática, os _embeddings_ capturam a similaridade dos itens e por
causa disso também funcionam como substitutos para técnicas de _clustering_ e de
redução de dimensionalidade, como o PCA. Como são aprendidos como uma camada
oculta de uma rede neural, esses vetores passam por todo o processo de gradiente
descendente e isso significa que representam a mais eficiente representação de
baixa dimensionalidade para aquela tarefa em específico.

O trade-off desse caso é a perda de informação ao reduzir a dimensionalidade do
dado. Em troca, temos a informação de proximidade e contexto dos itens. Quanto
menor o tamanho do embedding, maior a perda de informação. Quando o embedding é
muito grande, muita informação contextual é perdida (é mais difícil encontrar
semelhanças).

A regra prática usada é a raiz quarta do número total de elementos categóricos únicos
ou $$1.6*\sqrt{elementos\_unicos}$$.



### Autoencoders

