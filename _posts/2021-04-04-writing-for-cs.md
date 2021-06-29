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
- [Hypotheses, Questions and Evidences](#hypotheses-questions-and-evidences)
- [Writing a Paper](#writing-a-paper)

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

# Writing a Paper

A ideia é basicamente escrever o primeiro rascunho o quanto antes. Primeiro
entenda a estrutura do texto e então já comece a escrever dentro dessas
estruturas. Autores que são muito críticos com o primeiro rascunho avançam
pouco. Além disso, a melhor forma de saber se você entendeu um assunto é
tentando escrever sobre ela.

Ao escrever é bom considerar o público. Tenha em mente ao começar: o que você
quer que a pessoa que está lendo aprenda ao final do seu texto? O que você mesmo
estava tentando aprender quando começou a pesquisar aquilo? Isso pode fazer com
que seu texto fique mais interessante e mais focado.

Uma dica dada é escrever em frases curtas tudo que sabe e tem a dizer sobre
aquela seção do texto. Depois edite e arrume o estilo. Exemplo dado de texto
inicial:

> In-memory sorting algorithms require random access to memory. For large files
> stored on disk, random access is impratically slow. These files must be sorted
> in blocks. Each block is loaded into memory and sorted in turn. Sorted blocks
> are written to temporary files. These temporary files are then merged. There
> may be many files, but in practice the merge can be completed in one pass.
> Thus each recorded is read twice and written twice. Temporary space is
> required for a complete copy of the original file.

Em uma tese, cada capítulo tem sua própria estrutura, que varia de acordo com o
objetivo do próprio capítulo. É legal ver outras teses da sua área pra ter uma
ideia de como estruturar a sua própria.

Na hora de fazer uma revisão bibliográfica é legal olhar para os artigos também
de maneira crítica, fazendo anotações de seus acertos e erros. Isso além de
aprimorar o ceticismo, faz com que os artigos não sejam tidos como verdades
absolutas. Além disso, ao escrever a revisão bibliográfica dessa maneira, você
ajuda a pessoa que está entrando em contato com aquela área pela primeira vez a
entender o conteúdo e entender quais as referências são bom ponto de partida.

A revisão bibliográfica é grande parte do texto. Se você terminou de escrever
essa sessão, já deveria entender que terminou boa parte da escrita da sua tese.

> A conclusion is that which concludes, on the end. Conclusions are the
> inferences drawn from a collection of information. Write "Conclusions" not
> "Conclusion". If you have no conclusions to drawn, write "Summary", which is
> often an appropriate way to end a thesis chapter.

### Checklist
Sobre o escopo:
- Em que fórum ou tipo de fórum você pretende publicar seu trabalho?
- O escopo do trabalho está bem definido?
- Existe uma única e clara questão de pesquisa ou objetivo? Você consegue
  identificar qual aspecto do trabalho é de maior interesse ou impacto?
- Como você imagina um trabalho bem-sucedido? E um trabalho que falha? Você
  consegue antecipar a forma da saída em cada um dos casos?
- Quem é o público alvo? Qual tem que ser o conhecimento do público sobre a área
  para que o trabalho consiga ser apreciado?
- Os papéis do participantes estão claros? Quais são as suas atividades e quais
  são dos outros?

Sobre como a escrita é estruturada:
- Que forma a sua escrita vai ter? Que outros artigos ou teses você vai querer
  que lembre?
- Você está escrevendo uma estrutura bem definida e organizada? Quais são as
  seções e como elas se relacionam entre si?
- O título, resumo e introdução definem o contexto para o trabalho?
- Você estabeleceu uma conexão entre a questão, os trabalhos relacionados,
  métodos e resultados? Isto é, você definiu a forma que a narrativa vai tomar?
- Tem algo de incomum na organização da escrita e, se sim, tem uma razão para
  essa outra organização e como ela vai ser explicada ao leitor?
- Se você está escrevendo uma tese, existem requisitos de formatação?

Sobre sua abordagem ao trabalho:
- Você está mantendo um log ou um caderno?
- Você trabalha com uma agenda explícita, com datas e objetivos?
- Seus prazos deixam tempo o suficente para o seu orientador te dar feedback nos
  rascunhos ou para os seus colegas contribuírem com o material?
- Você tem uma abordagem efetiva para rapidamente gerar texto?
- Como os resultados estão sendo selecionados para apresentação? Esses
  resultados se relacionam com seu objetivo inicial? Como os resultados se
  relacionam com o corpo completo de evidência que você está coletando?
- Seus resultados foram criticamente analisados?
- Para uma tese, você sabe como será examinada? Como esse conhecimento molda sua
  escrita?
