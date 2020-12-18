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


