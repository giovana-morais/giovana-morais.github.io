---
title: "Spark NA PORRADA: Container released on a *lost* node"
layout: post
date: 2021-04-05
headerImage: false
tag:
- spark
author: giovanamorais
category: blog
---

Tem muito erro que o Spark dá que simplesmente não tem uma mensagem decente
e aí você que se vire pra entender. Pois bem, o erro de hoje é o nosso querido:

# "Exit status: -100. Diagnostics: Container released on a *lost* node"
Essa PORRA desse erro muito provavelmente significa que você tá tendo problemas
com a memória do seu cluster. Pode ser memória do driver, pode ser memória dos
executors, pode ser ambos. Também pode significar que você tá com problema por
causa de um uso intenso e prolongado da CPU. Você nunca vai saber qual é o
problema de verdade porque é assim que a vida funciona.

Como eu uso os serviços da AWS, encontrei esse [textinho de ajuda](https://aws.amazon.com/pt/premiumsupport/knowledge-center/emr-exit-status-100-lost-node/)
que recomenda você aumentar a EBS (Elastic Block Store) do seu cluster caso o
problema seja a memória.

Se o seu problema for CPU, você pode aumentar o número de task nodes do seu
cluster.

Sobre o problema de memória, também encontrei uma
[postagem](https://dzone.com/articles/some-lessons-of-spark-and-memory-issues-on-emr)
interessante
explicando o que você pode ou não mudar nas configurações do seu cluster pra
evitar isso.


