---
title: "Multi-Armed Bandits and the Stitch Fix Experimentation Platform"
layout: post
date: 2020-08-11
headerImage: false
tag:
- experimentos online
category: leituras
author: giovanamorais
---

Autores: Brian Amadio

Disponível em: [MultiThreaded](https://multithreaded.stitchfix.com/blog/2020/08/05/bandits/)

O modelo de multi-armed bandit é uma simplificação de modelos de aprendizado por reforço, no qua um
agente interage com o ambiente ao escolher de um conjunto finito de ações e coletar uma recompensa
não-determinística dependendo da ação tomada. O objetivo é maximizar a recompensa.

Cada ação é mapeada para uma recompensa por meio de uma função chamada de função de recompensa.
Claro que nesse caso a função é desconhecida. A ideia é que o agente interaja com o ambiente e
colete evidências das recompensas pra cada ação tomada. Como as informações são incompletas,
o agente precisa, ao menos no início do processo, testar todas as possibilidade de ação para
que consiga calcular um tipo de "recompensa média" por ação e, a partir disso, começar a tentar
maximizar a recompensa.


Esse dilema entre testar todas as variações do experimento vs maximizar as recompensas se inicia
quando de imediato algumas opções são melhores que outras. Ainda não há informação o suficente para
considerarmos uma opção como a melhor, mas ao mesmo tempo não queremos continuar insistindo em
recompensas que não são a recompensa máxima entre as opções. Existem alguns algoritmos que propõem
uma maneira balanceada de se encontrar a melhor opção, como algoritmos gulosos e amostragem de
Thompson.



