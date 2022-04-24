---
title: "as maravilhas do `git add --patch`"
layout: post
date: 2022-04-24
category: blog
author: giovanamorais
---

### o que é?
fazer muitas mudanças significativas em um único arquivo e querer separar tudo
depois pra manter um *~commit limpo e com um único objetivo~* pode ser uma
tortura dependendo da sua escolha de comandos.

pra não interromper o seu fluxo de pensamento e ainda permitir que você separe
mudanças relevantes em commits separados, existe o `git add --patch`[^1]. o
`--patch` é uma flag permite que você olhe trechos de código
pra decidir o que entra ou não em um dado commit.

---

### como funciona?

sem muito mistério, em vez de só adicionar o arquivo com `git add`, você
adiciona com `git add --patch`.

```shell
$ git status
Arquivos não monitorados:
  (utilize "git add <arquivo>..." para incluir o que será submetido)
        2022-04-06-git-add-patch.md

nenhuma modificação adicionada à submissão (utilize "git add" e/ou "git commit -a")

$ git add 2022-04-06-git-add-patch.md --patch

diff --git a/_posts/2022-04-06-git-add-patch.md b/_posts/2022-04-06-git-add-patch.md
index f6f9744..c7cdae4 100644
--- a/_posts/2022-04-06-git-add-patch.md
+++ b/_posts/2022-04-06-git-add-patch.md
@@ -5,3 +5,33 @@ date: 2022-04-06
+
+fazer muitas mudanças significativas em um único arquivo e quer separar
+elas pra manter um *~commit limpo e com um único objetivo~* pode ser uma
+tortura dependendo da sua escolha de comandos.

(1/1) Stage this hunk [y,n,q,a,d,e,?]?
```

a partir da pergunta _Stage this hunk [y,n,q,a,d,e,?]?_ temos algumas opções:

* _y[es]_: você adiciona o trecho de código ao commit
* n[o]: você não adiciona o trecho
* q[uit]: você sai da tela e não adiciona nenhum dos trechos remanescentes
* a[ll]: adiciona esse e todos os próximos que tiverem
* d: não adicione esse trecho e nenhum dos próximos
* e[dit]: edita manualmente o trecho
* ? - imprime a ajuda na tela

ao você adicionar ou pular um trecho, o terminal vai te mostrar o próximo trecho de
código e assim até você passar por todos os arquivos que têm mudanças ou
chegar ao fim das alterações do seu arquivo.

além dessas opções, você pode editar[^2] exatamente o que você quer ou não
adicionar, caso o trecho selecionado tenha informação a mais. para isso, você
tem que intercalar entre `-` e `+`, onde `-` significa as linhas que você quer
remover e `+` as linhas que você quer adicionar. se você desistir das edições,
pode só sair do seu editor sem salvar o arquivo e o git vai entender sua
desistência e abortar a operação. no geral, a opção de editar é um pouco
mais complicada, mas vale a pena se você quer fazer uma
edição mais complexa do seu código.

---

eu particularmente estou viciada nessa opção porque sempre esqueço de parar de
fazer o que que quer que eu esteja fazendo pra adicionar e commitar mudanças
relevantes. pra além do `git add --patch` também tem o `git add
--interactive`[^3]
ou `git add -i`, que permite que você adicione e interaja com seus arquivos de forma
interativa. vale a pena olhar.


---
{: data-content="₮₵Ⱨ₳Ʉ" }


[^1]: [https://git-scm.com/docs/git-add](https://git-scm.com/docs/git-add)
[^2]: [https://git-scm.com/docs/git-add#_editing_patches](https://git-scm.com/docs/git-add#_editing_patches)
[^3]: [https://git-scm.com/docs/git-add#_interactive_mode](https://git-scm.com/docs/git-add#_interactive_mode)
