---
title: "folhas de dica do matplotlib e reflexões"
layout: post
date: 2023-07-13
tag:
- open source
- reflexões
category: blog
author: giovanamorais
---

entre os entreveros da minha rotina doida, estive passeando pela documentação do
`matplotlib` pra conseguir ajustar uma imagem que necessitava de um conhecimento
mais avançado do que aquele que eu tenho. no meio desse passeio, esbarrei com
essa [lista de dicas](https://github.com/matplotlib/cheatsheets) e decidi
iniciar um mini-projeto: traduzir e deixar disponível no repositório oficial da
PyLadies Brasil.

juntou eu e a [Rita](https://github.com/R-it-a) na missão e traduzimos o
negócio.
as folhas de dicas (ou _cheatsheets_, se você quiser ser gringão) variam desde iniciante até
avançado. foi um trabalho iniciado pelo [Nicolas Rougier](https://github.com/rougier)
que foi trazido para o repositório oficial depois do sucesso.
e agora finalmente traduzido pra língua mais importante para os programadores
e programadoras do Brasil: a que a gente fala.

queria discutir e refletir sobre algumas coisas.

## tradução de "termos-chave"
existem alguns termos que são importantes porque são termos-chave. por
exemplo, dentro do matplotlib existe o conceito de `ticks` e `axis`. vale a
pena traduzir? ou isso pode dificultar uma pesquisa futura que precisará ser
feita em inglês, dado que a maioria da documentação está em inglês?

acho que é normal consumir muito material em inglês sendo da área de computação,
afinal é a língua em que a maioria esmagadora dos artigos técnicos estão escritos.
mas na hora em que vamos repassar esse conhecimento em português, como a gente
fala? eu, pessoalmente, tenho um pouco de aversão aos anglicismos.
entre _machine learning_ e aprendizado de máquina, eu sempre opto pela
segunda opção, tentando ao meu
máximo evitar ser como os _brothers_ e as _sisters_ ali da Faria Lima. mas tem
coisa que é difícil mesmo e, ao ser responsável pela tradução de um documento,
você se depara com essas questões toda hora. termo a termo você tem que sentar e
se perguntar "será que eu traduzo isso?".

no caso desse projeto do matplotlib, acabamos indo pela versão mais fácil de
manter o nome em inglês pra _ticks_ e _axis_, mas se alguém algum dia ler
esse texto e souber uma tradução boa pra um ou os dois termos, me avisa
que a gente corrige. melhor ainda: abre um PR (<- olha aqui um anglicismo
safado) lá com a correção e me marca pra revisão.
eu ia amar.

## envolvimento da comunidade em projetos para a comunidade
quando eu dei a ideia desse projeto de tradução no grupo da PyLadies Brasil,
várias pessoas acharam a ideia ótima e só.

não me entenda mal, eu mais do que ninguém sei que tempo é uma coisa difícil de
ter pra dispor assim. todo mundo tem uma vida e todo mundo quer ter um hobby.
isso aqui não é uma cobrança, é mais um... desabafo?

explico melhor: há um tempo atrás, eu participei de um projeto chamado
"[Papo Entre PyLadies](https://www.youtube.com/playlist?list=PL0tfcsij9geEE-4MhGViTgeiRBIBUnlAP)", que consistia em uma série de entrevistas nas quais chamávamos
representantes de todos os capítulos locais do Brasil e trocávamos uma ideia. eu
apareci em uma reunião e de repente eu estava na organização, junto das
talentosíssimas (e agora minhas amigas!) [Ana Cecília](https://cecivieira.com/) e
[Dandara](https://twitter.com/dandaramcsousa). o projeto foi todo muito legal e,
logo que chegou ao fim, recebemos pedidos de uma segunda temporada, mas a gente
tava cansada porque deu um trabalho danado organizar tudo, montar roteiro,
cuidar das lives, cuidar da plataforma, conversar com todas as pessoas que iam
participar etc etc etc. então sugerimos que outras pessoas se voluntariassem pra
organizar e nós ajudaríamos com o que fosse preciso.

e assim o projeto acabou.

fico pensando em *como* envolver mais pessoas no processo de forma orgânica?
ou como iniciar mais desses projetos
de uma maneira a não me tornar "liderança". liderança entre aspas porque não
lidero ninguém de fato, óbvio, mas a minha experiência com trabalho em
comunidade é que todo mundo quer ajudar _um pouco_, mas ninguém quer
organizar as pessoas que estão se disponibilizando a ajudar. e aí sempre uma
pessoa trabalha muito mais.

perguntas sem respostas. só tô tergiversando por aqui.

## enfim
o projeto caminha mais do que lentamente para o fim porque a defesa da
minha tese está cada vez mais próxima e o meu tempo cada vez mais curto,
mas agora a ideia é fazer o `Makefile` pra conseguir gerar os documentos
automaticamente e disponibilizar no site.

eis aqui o [link do PR](https://github.com/matplotlib/cheatsheets/pull/132) e
qualquer sugestão é mais do que bem-vinda.

tchau!

---

# updates

## 30/10/2023
fechei o PR antes aberto e movi as mudanças pro repositório da
[PyLadies Brasil](https://github.com/pyladies-brazil/matplotlib-dicas).
o motivo é que a gente precisa ter liberdade pra mudar o README principal e
disponibilizar os pdfs de uma maneira independente. fora isso, o PR não era
aprovado nunca.

agora pra encerrar de vez, vou gerar os pdfs traduzidos e corrigir os links do
README.
