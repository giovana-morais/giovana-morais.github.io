---
title: "usando LibreOffice Impress"
layout: post
date: 2025-06-09
headerImage: false
category: blog
author: giovanamorais
---

eu queria começar esse texto dizendo que eu testei o LibreOffice Impress porque
sou a maior fã de open-source que existe (o que é meio verdade, veja bem), mas a
motivação na verdade foi completamente diferente. como uma pesquisadora da área
de áudio, eu frequentemente tenho que fazer apresentações que toquem sons. você
deve se perguntar "mas o Google Slides não permite que você coloque sons em todo
lugar?" e a resposta é "sim". PORÉM, o Google Slides depende de internet e só
quem foi em uma conferência sabe o terror que é depender de internet.

motivada pela falta de internet e necessidade de tocar áudios, comecei a buscar
alternativas para fazer minha apresentação.


### alternativa 1: Google Slides e contar com a sorte
obviamente isso não ia dar certo. pra adicionar sons no Google Slides, você
primeiro subir os áudios pro Google Drive e então adicionar. o processo não me
agrada muito, mas funciona. meu primeiro teste pra fugir da maldição da conexão
e da Lei de Murphy foi fazer um rascunho da apresentação e baixar ela em algum
formato que talvez viesse com sons.

o pdf obviamente veio sem som, pra minha tristeza. tentei então baixar em odp e
notei que veio sem som também. outros formatos requeriam que eu tivesse acesso a
softwares que não tenho, então descartei o Google Slides como opção e fui pra
próxima alternativa.

### alternativa 2: PowerPoint e Keynote
o PowerPoint é uma alternativa sólida. existe há um bilhão de anos e pessoas
fazem apresentações absolutamente fantásticas. da mesma forma, tenho visto um
boom no uso do Keynote pra apresentações. parece funcionar de maneira
espetacular, mas não tenho um Mac e não sei se pretendo ter. dado isso,
descartei as duas alternativas também.

### alternativa 3: reveal.js
eu fiquei obcecada com essa opção e cogitei fortemente. o
[`reveal.js`](revealjs.com) é um
framework em javascript que permite que você faça as suas apresentações em html
e, honestamente, fica lindo. você roda localmente e fica muito legal. o meu
grande problema com essa alternativa era o meu tempo disponível e o quão
disposta eu estava em ter que aprender como ele funciona do zero. guardei no meu
coração, mas talvez fique pra uma próxima apresentação. vamos aguardar os
próximos capítulos.

### alternativa 4: canva
esse eu descartei rapidinho porque sou muito ruim de design.


### alternativa vencedora: LibreOffice Impress
eu já tinha o [LibreOffice
Impress](https://www.libreoffice.org/discover/impress/) instalado no meu computador. tudo estava lá,
era só uma questão de usar. respirei fundo e decidi dar uma chance. a
minha apresentação tem duração máxima de 5 minutos, então não deveria ser
difícil usar isso de desculpa pra testar o programa.

---

# usando o LibreOffice Impress
![exemplo_interface](../../assets/images/2025/exemplo_interface.png)

fiquei positivamente impressionada com o LibreOffice
Impress. demorou pouco pra entender o ambiente e logo eu já estava
editando meus slides sem problemas[^1].


## layout e design
embora eu tenha selecionado uma fonte (Roboto Mono) para todos os slides, o
programa toda hora voltava para a fonte inicial e eu não fiquei muito tempo
tentnado consertar. acredito que devam ter formas mais espertas de criar um
template "seu" que pode ser usado. fica pra uma próxima aventura. além disso,

existe uma [galeria de templates](https://extensions.libreoffice.org/) que você pode usar.
eu geralmente evito essas
galerias porque fico mais tempo zanzando do que de fato fazendo a apresentação.

## sons
confesso que apanhei um pouco pra entender como adicionar os sons. eu queria

1. adicionar o som a um objeto
2. ter controle de começar e pausar o áudio (infelizmente esse eu ainda não
  descobri como faz)

pro item 1. existem diversas maneiras. gastei alguns bons minutos na internet
e acabei escolhendo por usar a abordagem da "interação". basicamente, você
escolhe uma imagem e adiciona uma interação que pode ser um áudio. as outras
alternativas não me davam o controle sobre quando iniciar ou pausar o som,
embora me dessem controle sobre outros aspectos como a duração e o volume do
áudio. pra resolver isso, editei manualmente a duração e volume no
[Audacity](https://www.audacityteam.org/download/).

eu decidi deixar um gif aqui porque achar essa opção demorou mais tempo do que
eu estava esperando.

![adicionando_sons](../../assets/images/2025/adiciona_som.gif)

## animações
as animações pra mim foram a parte mais fácil de entender. no geral é bem
intuitivo e você tem opções como ativar uma animação no clique, ativar com o
anterior, remover algo no clique e etc.

## problemas e dificuldades

### fórmulas
eu queria apresentar algumas fórmulas nos meus slides. minha primeira abordagem
foi tentar usar um editor de LaTeX e então dar um jeito de copiar a fórmula.
depois de quebrar a cabeça com isso, decidi testar as fórmulas nativas do
LibreOffice Impress. pra minha surpresa, foi relativamente fácil e deu pra
inserir todas as minhas fórmulas e variáveis.

### gráficos
os gráficos que eu gostaria de apresentar eram só ilustrativos, no sentido de
que eu não tinha uma série de dados efetivamente. eu queria:
1. um gráfico hipotético
2. pintar a área debaixo da curva do gráfico

o item 1 foi possível fazendo umas continhas de cabeça e colocando os valores
numa tabela.
o item 2 foi um pesadelo. não consegui achar de maneira nenhuma como pintar a
área debaixo da curva e tive que fazer manualmente tanto a área quanto as
barras. ficou bonitinho? sim. mas foi um trabalhão. além do trabalhão, descobri
de uma maneira desagradável que toda vez que eu reabro a apresentação, o
LibreOffice Impress dá um reset na configuração do meu gráfico e readiciona o
título e o eixo x, que eu explicitamente removi. aí fica essa coisa horrorosa
que eu tenho que desfazer toda vez:

![area_errada](../../assets/images/2025/area_errada.png)

### notas de apresentação
esse definitivamente foi o ponto que me deixou mais frustrada no começo. embora seja
possível visualizar as suas notas de apresentação mudando o tipo de visualização
dos slides, você não consegue editar suas notas ao mesmo tempo que edita os seus
slides (você precisa ficar trocando o tipo de visualização) e também não é
possível ver as suas notas enquanto apresenta se estiver usando
apenas um monitor. no Google Slides, duas abas diferentes são abertas e você
meio que consegue controlar o que vai pra qual lado. gostaria de algo similar.

fui um pouco atrapalhada pela necessidade de dois monitores enquanto estava
tentando ensaiar.
contudo, quando consegui o segundo monitor, foi bem
tranquilo de usar as minhas notas e medir quanto tempo eu estava levando pra
terminar minha apresentação.

![exemplo_notas](../../assets/images/2025/exemplo_notas.png)

# vale a pena?
bom, eu quis compartilhar essa minha experiência com o LibreOffice Impress pra
dizer que, sim, vale a pena. não é perfeito, mas é gratuito, construído pela
comunidade e funciona tão bem quanto o Google Slides. eu tenho um sentimento de
que às vezes ficamos com preguiça de usar alguns produtos de código aberto
porque "é bugado e ninguém dá manutenção direito". isso é em parte verdade,
porque as pessoas que dão manutenção ou criando novas features não estão
necessariamente recebendo pra isso.

eu ainda quero testar o reveal.js, mas o LibreOffice Impress
se tornou minha primeira opção.
achei que minha apresentação ficou bonitinha (dada minha limitação com design)
e fiquei satisfeita com o resultado. com certeza usarei mais vezes.

---

[^1]: um disclaimer importante que devo fazer é que eu gosto das minhas apresentações bem minimalistas. não sei como seria o fluxo de trabalho de colegas que preferem algo mais rebuscado ou templates mais complexos.
