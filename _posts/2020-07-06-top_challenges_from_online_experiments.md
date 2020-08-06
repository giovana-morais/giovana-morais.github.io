---
title: "Top Challenges from the first Practical Online Controlled Experiments Summit"
layout: post
date: 2019-07-05
headerImage: false
tag:
- experimentos online
category: estudos
author: giovanamorais
---

OCE: Online Controlled Experiments
OEC: Overall Evaluation Criterion Metric

Os experimentos controlados online (ou teste A/B, fica a seu critério) conseguem estabelecer uma
relação causal entre determinada feature e o comportamento do usuário.


Os desafios:
1. Análise: como saber quando parar um experimento? Como conseguir avaliar de maneira precisa os
efeitos a longo prazo sem rodar o experimento por muito tempo? Qual é o critério geral de avaliação?
Como ter certeza que coisas como clickbait estão sendo corretamente penalizados?
2. Engenharia e Cultura: quais são as boas práticas e padrões de logging e de engenharia de dados que
garantem que nosso teste é confiável?
3. Desvios do teste A/B tradicional
4. Qualidade de dados: como assegurar dados bons? Quais são os testes críticos de qualidade de data?

Nem sempre soluções que são boas a curto prazo funcionam a longo prazo. Se um site inclui vários
clickbaits, haverá um aumento nos cliques, mas a longo prazo os usuários estarão insatisfeitos e
começarão a ignorar os links. É sempre mais interessante focar na retenção do usuário e na
satisfação dele a longo prazo.

Não é viável rodar experimentos por muito tempo, uma vez que acabaria ferindo a agilidade do
processo das empresas. Os testes, normalmente, duram de 2 a 4 semanas.

Algumas maneiras de conseguir "simular" o resultado a longo prazo são:
* Experimentos de a longo prazo ou holdouts: nesse caso, uma parte dos grupo de controle segue utilizando
o sistema antigo durante mais um tempo, enquanto o resto dos usuários já têm acesso a features novas. Isso
geralmente implica um alto custo de engenharia pra manter ambos os sistemas
* Proxies
* Modelagem do aprendizado do usuário: ao modelar o aprendizado do usuário com dados de experimentos de longo
prazo, a empresa passa a conseguir predizer isso usando dados de experimentos de curto prazo. (doido)
* Surrogates


O uso de OEC, ou seja, métricas de avaliação é indicado para que os resultados sejam analisados de forma
objetiva. Existem outras coisas que devem ser avaliadas antes da OEC, como qualidade dos dados, o impacto
do experimento, além de métricas locais etc. Uma OEC deve estar alinhada com os objetivos de produto, o que
pode ser um ponto de dificuldade e divergência. A métrica também deve ser sujeita a avaliação, uma vez que
ela deve conseguir capturar degradações no produto mantendo sua corretude.

Ferramentas de busca usam OEC como métricas HEART (Happiness, Engagement, Adoption, Retention and Task success)
ou métricas PULSE (Page views, Uptime, Latency, Seven-day active users and Earnings). Ainda é complexo
encontrar métricas como HEART para atividades de navegação, como em um site de notícia, porque, pra isso,
deve ser possível conseguir captar a intenção do usuário.


Geralmente os cenários testados têm mais de um tratamento e controle. Por isso, o negócio deve ser
segmentado. Algumas das segmentações mais comuns são
1. Mercado/País
2. Nível de atividade do usuário
3. Dispositivo e plataforma
4. Horário e dia da semana
5. Segmentos de produto


Uma das maiores dificuldades se encontra em criar uma cultura empresarial de experimentação. A gente sabe
que as decisões deveriam ser baseadas em dados, mas muitas empresas ainda confiam no instinto, o que
sabidamente não funciona. Experimentos ruins vão acontecer, mas a falha faz parte do processo de experimentação
e melhora e não podemos entender isso como algo negativo, mas sim como um modo de salvar os usuários e o negócio
de perigo. Essa transição de modo de pensar é o mais difícil.

A cultura de experimentação pode ser aos poucos incluída por meio da riação de ferramentas e plataformas
que facilitem a implementação rápida dos testes e a análise dos resultados. Algumas empresas citadas no
artigo criaram "centros de experimentadores" ou iniciativas similares em que uma parte dos funcionários
são treinados pra ajudar o resto da empresa a inserir os experimentos de maneira eficaz nos times.

A análise dos experimentos depende do gerenciamento dos dados. Geralmente há um padrão de logging que os
times definem. Os mesmos times têm que garantir que suas métricas sejam sensíveis o suficiente para
detectar alterações significativas entre os grupos.
