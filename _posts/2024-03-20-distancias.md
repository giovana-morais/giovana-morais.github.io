---
title: "distâncias e similaridades"
layout: post
date: 2024-03-20
headerImage: false
category: blog
author: giovanamorais
---

# similaridade de Jaccard

$$
J(A, B) = \frac{A \cap B}{A \cup B}
$$

importante: no caso dos vetores binários, intersecção = "e" lógico e união =
"ou" lógico. ou seja, a gente tem que lembrar das tabelas verdades
(tabela-verdades? tabelas-verdades? tabelas-verdade? enfim, você entendeu).

"ou"

|   | 0 | 1 |
|:-:|:-:|:-:|
| 0 | 0 | 1 |
| 1 | 1 | 1 |

"e"

|   | 0 | 1 |
|:-:|:-:|:-:|
| 0 | 0 | 0 |
| 1 | 0 | 1 |

### exemplo

considerando os vetores A = 1111000000 e B = 0100100101 e C = 0000011110, temos

$$J(A,B) = \frac{A \cap B}{A \cup B} = \frac{1}{7}$$

$$J(A,C) = \frac{A \cap C}{A \cup C} = \frac{0}{8} = 0$$

$$J(B,C) = \frac{B \cap C}{B \cup C} = \frac{1}{7}$$

finalmente, a **distância** de Jaccard é dada por

$$d(x,y) = 1 - s_J(x,y)$$.

no caso dos exemplos acima, temos

$$d(A,B) = 1 - J(A,B) = 1 - \frac{1}{7} = \frac{6}{7}$$

$$d(A,C) = 1 - J(A,C) = 1$$

$$d(B,C) = 1 - J(B,C) = \frac{6}{7}$$



# similaridade do Cosseno

$$
\cos(p_1, p_2) = \frac{p_1\cdot p_2}{||p_1||_1 \cdot ||p_2||_2}
$$

### exemplo

dados os vetores u = [1, 0.24, 0, 0, 0.5, 0]$, v = [0.75, 0, 0, 0.2,
0.4, 0] e w = [0, 0.1, 0.75, 0, 1], temos as seguintes similaridades

$$
\begin{align*}
	\cos(u,v) &= \frac{1\times 0.75 + 0.5\times0.4}{\sqrt{1^2 + 0.25^2 +
	0.5^2}\sqrt{0.75^2+0.2^2+0.4^2}} \\
			  &= 0.9496
\end{align*}
$$

e seguindo a mesma fórmula, $$\cos(v, w) = 0$$, $$\cos(u,w) = 0.01740$$ e
$$\cos(v,w) = 0$$.

consideramos agora os vetores binários A, B e C do exemplo anterior.

$$\cos(A,B) = \frac{1}{\sqrt{4}\sqrt{4}} = \frac{1}{4}$$

$$\cos(A,C) = \frac{0}{\sqrt{4}\sqrt{4}} = 0$$

$$\cos(B,C) = \frac{0}{\sqrt{4}\sqrt{4}} = 0$$


aqui, igual a distância de Jaccard, temos que $$d(x,y) = 1 - \cos(x,y)$$.

# distância de edição
métrica para comparar a distância entre strings. é também conhecida como
distância de Levenshtein. a ideia é mensurar quantas
remoções e quantas adições são necessárias para converter uma string em outra.

por exemplo, queremos converter ele -> além
* remove `e` (`le`)
* insere `a` (`ale`)
* insere `m` (`alem`)

a distância então é 3.

uma forma mais direta de fazer essa medida é olhando para a LCS (longest common
subsequence), ou subsequência comum mais longa. a LCS é a maior subsequência que
os dois termos têm em comum. a fórmula então se torna

$$
d(x,y) = |x| + |y| - 2|LCS(x,y)|
$$

### exemplo
no nosso exemplo, temos |x| = |ele| = 3, |y| = |além| = 4 e LCS(x,y) = |le| = 2,
uma vez que a maior subsequência é `le`. substituindo, temos

$$
d(x,y) = 3 + 4 - 2*2 = 3
$$
