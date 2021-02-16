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
* [Problem Representation Design Patterns](#problem-representation-design-patterns)

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

## Design Pattern #2: Embeddings

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

Em resumo, os _embeddings_ aprendem a preservar a informação mais relevante da
tarefa: se for descrição de imagem, então a tarefa é aprender com o contexto
dos elementos da imagem se relacionam com o texto. Na arquitetura de um
autoencoder, o rótulo é o mesmo que o atributo, então a redução de dimensionalidade
tenta aprender tudo que é importante sem um contexto específico.

## Design Pattern #3: Feature Cross

Feature Cross é o processo de se combinar features categóricas
de forma que essa combinação seja uma nova feature sintética, tornando
algumas relações entre os atributos mais explícitos. Modelos
mais complexos coseguem inferir essas combinações de features, mas usando esse
padrão de feature cross é possível atingir resultados similares com modelos
muito mais simples, aumentando a velocidade do treinamento para uma performance
de mesma qualidade.

Devemos tomar cuidado pra não combinar features que já são correlatas porque,
se esse for o caso, a combinação não vai trazer nenhuma informação nova ao modelo.

Dependendo de onde vamos usar essa nova feature (por exemplo, uma rede neural),
teremos que fazer uma das opções
1. Gerar o one-hot encoding
2. Gerar o embedding

Esse padrão funciona bem com dados massivos, o que pode fazer com que a diferença
do tempo de treinamento (ao aplicar um modelo linear) seja bastante expressiva.

A aplicação desse padrão para features numéricas só pode ser feita a partir
de um pré-processamento, como a separação em intervalos (bucketize).

Como a feature cross trata da combinação de features, isso pode fazer com que
a entrada do modelo se torne esparsa. Pra lidar com isso é possível criar um
embedding da entrada, fazendo com que seja generalizada além de voltar a ser densa.

## Design Pattern #4: Multimodal Input
Esse tipo de padrão é usado quando temos entradas em formatos diferentes e
ambas as entradas são aceitas dentro do modelo (por
exemplo, uma imagem e seus metadados). Uma abordagem comum, de novo, são os
_embeddings_ ou a combinação das features em uma entrada só.

Representar o mesmo dado de maneiras diferentes para o modelo pode fazer com
que ele consiga identificar padrões diferentes na entrada.

# Problem Representation Design Patterns

## Design Pattern #5: Reframing
Esse padrão se refere à mudança da representação da saída de um algoritmo.
Um problema de regressão sendo visto como um problema de classificação e vice-versa.

Um dos exemplos citados é predição do volume de chuva. Determinar um número
específico pode ser muito difícil, porque o mesmo conjunto de features pode
gerar um resultado diferente. Como esse modelo é probabilístico, o melhor a fazer
em vez de tentar predizer o valor exato do volume de chuva, é predizer a probabilidade
do volume. Dessa forma, em vez de um problema de regressão, temos um problema de
classificação multi-classe.

Uma distribuição ser multimodal (tem vários picos) é um forte indício de aplicar
o reframing para um problema de classificação.

O reframing de regressão para classificação por meio da criação
de buckets (intervalos). Dessa forma, quanto maior o número de intervalos,
maior a precisão do modelo, já que os intervalos são menores, e, por isso,
também faz sentido pensar que se você precisa de intervalos de dado muito
pequenos é melhor usar a regressão mesmo.

Independente do reframing feito é importante considerar as limitações dos dados
e o risco de introduzir viés de rótulos. Além disso, é importante considerar
que problemas de regressão geralmente precisam de mais amostras de treinamento
do que problemas de classificação.

Uma alternativa ao reframing é o _multitask learning_. Em vez de escolher entre
a regressão e a classificação, a ideia é fazer ambos. No contexto de uma rede
neural, por exemplo, isso pode ser feito ao compartilhar o modelo ou ao compartilhar
algumas camadas do modelo ou mesmo ao ter modelos diferentes que são "forçados" a
ter parâmetros parecidos, aplicando alguma função de perda e de regularização igual.

## Design Pattern #6: Multilabel
Um padrão de _multilabel_ ou multi-rótulo se refere a problemas que podemos
atribuir mais de um rótulo para o mesmo exemplo de treinamento. Esse padrão
trata, principalmente, de redes neurais e problemas de, por exemplo, _tagging_.

A solução para esse problema é basicamente usar a sigmoide em vez da softmax
como a função de ativação para a saída do modelo. Como os rótulos tem que ser
multi-hot encoded, a saída será um vetor de probabilidades entre 0 e 1, onde
cada uma das posições se refere a um dos rótulos do problema.

Ao contrário da sigmoide, a softmax não é indicada nesses casos porque sempre
retorna um array com uma distribuição das probabilidades, somando sempre 1. Já a
sigmoide retorna um array com a probabilidade pra cada uma das saídas. Nesse
caso, devemos ter um threshold de probabilidade e então considerar como uma
predição toda probabilidade que está acima desse valor.

Ao usarmos sigmoide para uma classificação binária ou multi-rótulo, o ideal é
usar a função de perda `binary_crossentropy`. No fim, o problema multi-rótulo é
entendido como vários pequenos problemas binários e por isso essa função
funciona bem.

Sistemas multi-rótulo devem ser usados quando:
* Um único exemplo pode ser associado a mais de um rótulo
* Um único exemplo pode ter vários rótulos hierárquicos
* Rotuladores descrevem o mesmo item de maneiras diferentes, sendo que todas as
  interpretações são precisas (rótulos sobrepostos)


## Design Pattern #7: Ensembles
Há três tipos de erro que o modelo pode apresentar:
* erros irredutíveis: causados por ruído nos dados, na maneira como enquadramos
  o problema ou exemplos de treinamento ruim.
* erros de viés: o modelo não consegue aprender a relação entre os atributos e a
  saída do modelo e por isso erra para novos exemplos. É o que causa o
  _underfit_, ou seja, performa mal para os exemplos de treinamento e de teste.
* erro de variância: o modelo fica viciado nas amostras com as quais treinou e
  tem um desempenho quase que perfeito, mas na hora de generalizar isso para
  outros exemplos falha. É o _overfitting_.

Em modelos mais simples e com uma quantidade não tão massiva de dados, há um
trade-off entre variância e viés. Se você aumenta muito a complexidade do seu
modelo, ele provavelmente vai cair em um overfitting e ter muita variância. Se
você simplificar demais aumenta o viés, mas diminui a variância.

A ideia do _ensemble_ é combinar modelos diferentes para diminuir tanto a
variância quanto o viés.

1. Bagging: processamento paralelo dos dados pra cada um dos modelos usados.
   Então é tirada a média dos modelos e esse é a saída final. Modelos como
   _Random Forest_ usam esse tipo de abordagem. Esse método ajuda a reduzir a
   variância do modelo. O bagging no pior caso vai performar tão bem quanto
   qualquer um de seus modelos e, no melhor caso, muito melhor. O segredo é a
   diversidade dos modelos. Em modelos mais estáveis, como kNN, modelos
   lineares, SVMs e etc, o bagging é menos efetivo.
2. Boosting: ao contrário do bagging, a ideia do boosting é construir um modelo
   que tenha mais capacidade que os modelos individuais. Cada novo modelo tenta
   aprender com os exemplos em que o modelo anterior errou.
3. Stacking: nesse caso, modelos diferentes rodam no conjunto de dados inteiro e
   depois disso um segundo modelo é treinado usando as saídas dos modelos
   iniciais como features, aprendendo a combinar essas saídas pra diminuir o erro
   de treinamento.

O problema de usar ensembles é o aumento da complexidade (agora em vez de um só
modelo, estamos usando `k` modelos), a escolha dos modelos e a diminuição da
interpretabilidade. Além disso, a escolha da técnica de ensemble depende do
problema, por exemplo ao combinar dois modelos com erros muito correlacionados
em bagging não vai adiantar anda.

| Problema                       | Método Ensemble   |
| ------------------------------ | ----------------- |
| Alto viés (underfitting)       | Boosting          |
| Alta variância (overfitting)   | Bagging           |


## Design Pattern #8: Cascade
