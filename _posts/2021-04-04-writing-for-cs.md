---
title: "Writing for Computer Science"
layout: post
date: 2021-04-04
headerImage: false
tag:
- escrita
- pesquisa
author: giovanamorais
category: leituras
---

Autor: Justin Zobel

# Sumário
- [Getting Started](#getting-started)
- [Reading and Reviewing](#reading-and-reviewing)

# Getting Started

## Checklist
- O seu tópico é claramente uma atividade de pesquisa? É consistente com o
  objetivo da pesquisa?
- Como o projeto é diferente de, por exemplo, desenvolvimento de software,
  escrita de tese ou análise de dados?
- No contexto do seu projeto, qual a área, tópico e questão de pesquisa?
  (Como esses conceitos se diferenciam uns dos outros?)
- O projeto é de escala apropriada, com desafios que combinam com suas
  habilidades e interesses? A questão é específica o suficiente pra te dar a
confiança de que é factível?
- O projeto difere de outros projetos do grupo de pesquisa? É claro que os
  possíveis retornos são interessantes o suficiente pra justificar o trabalho?
- É claro quais as habilidade e contribuições você traz para o projeto e o
  que a pessoa que te orienta vai contribuir? Quais habilidades você precisa
  desenvolver?
- Que recursos são necessários e como você os vai obter?
- Quais são os possíveis obstáculos ou as maiores dificuldades para
  completar o projeto? Você sabe como abordar isso?
- Você consegue escrever um roadmap, com metas, que mostra um caminho claro
  para os possíveis resultados da pesquisa?
- Você e quem te orienta tem um método acordada para trabalhar juntos, com
  uma agenda definida de reuniões?

# Reading and Reviewing

Manter o ceticismo é importante porque é com isso que a gente faz ciência. Por
isso a leitura que deve ser feita é uma leitura crítica do conteúdo. Idealmente,
as leituras devem ser divididas em duas fases: exploratória e crítica. 

A fase de leitura exploratória é quando você sai lendo de tudo, mas sem se 
aprofundar. É uma leitura superficial para entender a proposta do artigo, a
metodologia e quais os resultados são apresentados. É quando você define quais
os artigos de fato você tem interesse em se aprofundar. 

A leitura crítica envolve analisar melhor e tentar entender os detalhes do texto
apresentado, de forma a conseguir criticar o conteúdo (não de uma maneira
ruim!). Isso requer mais tempo e mais estudo, uma vez que você vai ter que
mergulhar naquele conteúdo.

> não aceite algo como verdade só porque foi publicado


## Checklist
- Existe alguma contribuição? Ela é significante?
- A contribuição é de interesse?
- Os resultados estão corretos?
- A literatura apropriada é discutida?
- A metodologia realmente responde a pergunta inicial? 
- As propostas e os resultados são criticamente analisados?
- As conclusões apropriadas são feitas a partir do resultado ou existem
  possíveis interpretações?
- Todos os detalhes técnicos estão corretos?
- Os resultados podem ser verificados?
- Existem ambiguidades séries ou inconsistências?


# Hypotheses, Questions and Evidences

> The great tragedy of Science, the slaying of a beautiful hypothesis by an ugly
> fact.

## Hipóteses
Hipóteses não podem ser vagas porque, dessa forma, não é possível confirmá-las
ou desprová-las. Uma hipótese deve, acima de tudo, ser testável e capaz de
falsificação (ou seja, deve ser possível encontrar um contra-exemplo). 

Uma hipótese vaga:
* Q-lists são melhores que P-lists.

Uma hipótese testável:
* Como uma estrutura de busca em memória, a performance de uma Q-list é mais
  rápida e mais compacta que uma P-list.
Se for preciso mais especificações sobre o que foi assumido:
* Foi assumido que os dados tem um padrão de acesso desbalanceado, ou seja, a
  maioria dos acessos é feita em uma porção pequena dos dados.

Hipótese vagas:
* A performance da Q-list e da P-list são comparáveis.
* Essa linguagem criada é fácil de aprender.

Durante a construção da hipótese, pode ser interessante tentar defender a sua
hipótese como se estivesse defendendo para um colega. Você mesmo tenta achar as
falhas. Esse processo pode te ajudar a juntar material para provar para o leitor
que seus argumentos são convincentes e corretos.

## Evidências e experimentos
Formas de evidência
* **Prova**: demonstrações formais de que sua hipótese está correta (ou errada).
* **Modelos**: uma descrição matemática da hipótese ou de alguns de seus
  componentes, como um algoritmo cujas propriedades estão sendo consideradas.
* **Simulações**: uma implementação (parcial ou não) de uma forma simplificada
  da hipótese, na qual as dificuldades de uma implementação total são deixadas
  de lado por aproximação ou omissão.
* **Experimento**: teste total da hipótese baseado na implementação total da
  proposta e em dados reais.

Evidências experimentais não comprovam nenhuma hipótese, não importa o quão
volumosas são, mas um contra-exemplo é suficiente pra desprovar uma hipótese.

## Checklist
 Sobre hipóteses e questões
- Que fenômenos ou propriedades estão sendo investigados? Por que são 
  interessantes?
- O objetivo da pesquisa foi articulado? Quais são as hipóteses específicas e as
  perguntas de pesquisa? Esses elementos estão conectados de forma convincente
  uns aos outros?
- De que maneira o trabalho é inovador? Ele reflete o que propõe?
- O que desprovaria (?) a hipótese? Isso tem alguma consequência improvável?
- Quais são as assumpções? Elas são sensíveis?
- O trabalho foi criticamente questionado? Você está convencido de que realmente
  é ciência?

Sobre evidência e medição
- Que formas de evidência são usadas? Se for um modelo ou uma simulação, o que
  demonstra que os resultados têm validade prática?
- De que forma a evidência é medida? Os métodos de medição são objetivos,
  apropriados e razoáveis?
- Que compromições ou simplificações são inerentes à sua escolha de medição?
- Os resultados serão preditos? 
- Qual o argumento que conecta a evidência à hipótese?
- Em que extensão os resultados positivos confirmam a hipótese de maneira
  convincente? Os resultados negativos vão desprovar sua hipótese?
- Quais são as prováveis fraquezas ou limitações da sua abordagem?
