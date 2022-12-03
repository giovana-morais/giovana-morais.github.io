---
title: "Refatorando meu projeto horroroso"
layout: post
date: 2022-12-03
category: blog
author: giovanamorais
---

* [Introdução](#introdução)
* [Problema](#problema)
* [Solução](#solução)
	* [03/12/22](#031222)

# Introdução

Desde janeiro eu estou participando de um projeto do IEEE chamado Mentoring Experiences
for Underrepresented Young Researchers
([ME-UYR](https://signalprocessingsociety.org/community-involvement/me-uyr-mentoring-experiences-underrepresented-young-researchers-program)), 
cuja ideia é juntar uma pesquisadora que não tem experiência (eu) com uma pesquisadora 
que tem muita experiência (no meu caso, a incrível [Magdalena
Fuentes](https://magdalenafuentes.github.io/) com a ajuda e suporte dos também
incríveis [Matthew Davies](https://mepdavies.github.io/) e [Marcelo Queiroz](https://www.ime.usp.br/~mqz/)) em um projeto de 9 meses que
deve culminar em uma publicação submetida a uma conferência do IEEE[^3]. Os
projetos selecionados receberiam um valor de até $4.000 dólares pra estar
presencialmente na conferência.

Pois bem, fiquei os 9 meses trabalhando para tentar traduzir um
modelo de self-supervised learning feito para estimação de pitch em um modelo
que funcionasse de maneira semelhante para a estimação de tempo de uma música. O
trabalho foi muito legal e vou seguir com o tema para o meu mestrado. A gente
batizou o projeto de STEME (Self-supervised TEMpo Estimation).

# O problema 

O desenvolvimento do STEME foi feito em paralelo com o meu trabalho e o meu
mestrado, então é de se imaginar que o código tá horroroso porque ele foi feito
durante noites longuíssimas, em um modo multi-tarefas e com uma certa privação de sono. 
Como eu não gosto de código de acadêmico meia-boca e eu não pretendo me tornar uma 
acadêmica com código meia-boca[^1], decidi usar a oportunidade para refatorar tudo e
documentar o processo, atualizando aqui mesmo essa postagem com as coisas que eu
for adicionando. Se eu não adicionar nada nunca mais, fica também documentada a
minha falta de vergonha na cara.

Algumas coisas que quero fazer (sem ordem de preferência) que consigo pensar de
imediato:

* criar testes
* adicionar um linter pra padronizar o código
* criar um README bom, com instruções de instalação
* distribuir melhor as responsabilidades de cada módulo
* documentar melhor as funções
* definir um espaço pra notebooks com exemplos
* separar o código das bibliotecas dos scripts que eu uso pra alguma coisa mais
  específica 

# Solução

Eu ainda tenho um emprego e uma tese pra escrever, então as atualizações do
STEME serão feitas e documentadas em partes. Esse é o 
[repositório](https://github.com/giovana-morais/STEME).

## 03/12/22

* A primeira coisa que eu fiz foi deixar ele público pra que a humilhação também
  seja pública. Inicialmente, ele estava completamente
  [vazio](https://github.com/giovana-morais/steme/tree/b3a05d9dc61c855895939bbed3a90aa2d6dec059).
* O projeto original, que eu desenvolvi no decorrer da mentoria, tem muitos
  diretórios que não cabem estar no repositório do STEME. Pra resolver isso, eu
  pensei em passar o código-fonte, scripts e exemplos principais pro repositório
  do STEME e no repositório da mentoria só usar o STEME como
  [sub-módulo](https://github.blog/2016-02-01-working-with-submodules/)[^2].
  Organizei os diretórios do STEME me baseando um pouco na organização do
  [cookiecutter](https://github.com/drivendata/cookiecutter-data-science), mas
  dando uma personalizada. Por enquanto ficou desse jeito:

  ```
  .
  ├── data
  ├── models
  ├── notebooks
  ├── README.md
  ├── reports
  ├── src
  └── venv

  ```
*  
* O linter que eu usei foi o [`flake8`](https://flake8.pycqa.org/en/latest/) junto do
  [`autopep8`](https://github.com/hhatto/autopep8) pra esse
  início em que eu tive que passar o linter em tudo. O `flake8` não consegue
  forçar as mudanças no código, que é o que o `autopep8` faz.
  * Embora eu tenha adicionado o `flake8`, ainda não fiz todas as mudanças no
	código que eu queria pra ele não reclamar de nada. Vou fazer isso com calma. 

---

[^1]: Ênfase no **pretendo**. A gente nunca sabe o que o futuro aguarda e vai
    que eu entro em uma rotina ainda pior do que a atual. 

[^2]: Aqui o sub-módulo pode ser entendido como uma dependência entre o projeto
	da mentoria e o STEME.

[^3]: No nosso caso, escolhemos o IEEE International Conference on Acoustics,
	Speech, and Signal Processing ([ICASSP](https://2023.ieeeicassp.org/)). E eu
	particularmente achei ótimo, porque vai ser na Grécia!!! 
