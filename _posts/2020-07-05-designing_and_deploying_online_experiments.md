---
title: "Designing and Deploying Online Field Experiments"
layout: post
date: 2020-07-06
headerImage: false
tag:
- experimentos online
category: leituras
author: giovanamorais
---

Autores: Eytan Bakshy, Dean Eckles, Michael S. Bernstein

Disponível em: [ArXiV](https://arxiv.org/pdf/1409.3174v1.pdf)


O Teste A/B típico compara os valores de um parâmetro em duas variações (o grupo de teste e o grupo
de controle), tentando identificar qual delas representa uma oportunidade de melhora de serviço.
Ele é facilitado pela criação da internet.

O deploy desse tipo de experimento faz com que a avaliação possa se tornar complexa. Ao interromper
um experimento no meio, você acaba assumindo coisas estatisticamente incorretas.
Outro aspecto que pode complicar os experimentos são times diferentes rodando experimentos
simultaneamente, de modo que um experimento afete a saída do outro.

Linguagem desenvolvida para facilitar os testes: [PlanOut](https://facebook.github.io/planout/)

