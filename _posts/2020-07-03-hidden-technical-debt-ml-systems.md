---
title: "Hidden Technical Debt in Machine Learning Systems"
layout: post
date: 2020-07-03
headerImage: false
tag:
- machine learning
author: giovanamorais
category: leituras
---

Autores: D. Sculley, Gary Holt, Daniel Golovin, Eugene Davydov, Todd Phillips, Dietmar Ebner, Vinay Chaudhary,
Michael Young, Jean-Fraçois Crespo, Dan Dennison

Disponível em: [NIPS](https://papers.nips.cc/paper/5656-hidden-technical-debt-in-machine-learning-systems.pdf)


Uma das grandes diferenças entre o desenvolvimento de software e de sistemas de aprendizado de máquina
é que ao desenvolver software nós explicitamente sabemos e programamos e validamos o comportamento que desejamos.
Conseguimos testar e até usar metodologias pra desenvolver de acordo com o que esperamos, como é o caso do TDD.
O problema do desenvolvimento de sistemas de AM é que o comportamento que desejamos não depende **apenas** da lógica
de programação, dependendo também dos **dados**, que vêm do fontes externas e, por isso, são sempre passíveis de
mudanças.

Tipos de dívidas técnicas que podem surgir ao desenvolver sistemas de AM:

* Dependências de data
	- **Dados instáveis**: quando os dados acaba mudando em função do tempo. Se esses dados são "melhorados"
	ou mesmo atualizados, o modelo provavelmente vai começar a cometer erros pois foi treinado com dados
	diferentes.
	- **Dados sub-utilizados**: dados que acrescentam pouca melhora em relação ao desempenho do modelo, mas que
	podem acrescentar muitos problemas em relação a qualquer mudança. Esses dados podem ser atributos que estavam
	em modelos legados, atributos com alta correlação com outros atributos ou atributos que melhoram muito pouco
	o modelo.
* Feeback loops
	- **Loops diretos**: um modelo influenciando diretamente os atributos usados no treinamento.
	- **Loops indiretos**: um modelo acaba influenciando o comportamento de outro modelo.
* Anti-padrões de sistemas de AM:
	- **Glue code**: ferramentas e pacotes genéricos, que podem acabar inibindo o desenvolviemento e
	o aproveitamento de um problema de domínio-específico.
	- **Selva de pipelines**: geralmente aparecem na preparação dos dados, onde vários passos acabam encadeados.
	O problema de toda essa bagunça de passos é que testar, debugar e validar se torna um inferno.
	- **Branches de experimentação**: vários experimentos que são baseados em modelos em produção que dificultam
	a manutenção e acabam aumentando a complexidade ciclomática do projeto.
	- **Abstração**
* Dívidas de configuração
	- Configurações dos modelos precisam ser simples de serem lidas e comparadas umas com as outras. Além disso,
	precisam ser simples de automaticamente conferir fatos básicos sobre as configurações, como número de
	atributos.
* Outros tipos de dívidas:
	- **Testagem de dados**: "Se os dados substituem o código em sistemas de AM e o código deve ser testado,
	então parece claro que testar os dados de entrada é crítico para um bom funcionamento do sistema."
	- **Reprodutibilidade**: É importante manter a reprodutibilidade dos experimentos, contudo os sistemas
	de mundo real dificultam bastante a tarefa por conta de não-determinismos.
	- **Gerenciamento de processo**: A tarefa de manter muitos modelos rodando em paralelo pode se tornar
	bastante complicada, ainda mais se o processo tem muitos passos manuais.
	- **Cultura**: É importante criar uma cultura de time que incentive a redução de complexidade dos modelos,
	a remoção de features, melhoras na reprodutibilidade, estabilidade e monitoramento da mesma forma que
	melhoras na acurácia do modelo são valorizadas.
