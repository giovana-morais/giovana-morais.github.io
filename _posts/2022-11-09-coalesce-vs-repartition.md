---
title: "PySpark: coalesce vs repartition"
layout: post
date: 2022-11-09
category: blog
author: giovanamorais
---

O `coalesce` e o `repartition` são dois métodos do PySpark (e, consequentemente
do Spark) para particionar os dados em memória. A diferença entre os métodos
está principalmente no shuffle de dados que ocorre.

No caso do `coalesce`, não há shuffle, ou seja, os dados não são redistribuídos
entre as partições. Isso significa que ao final da aplicação do `coalesce` as
partições poderão ser desiguais e poderão resultar em uma performance ruim
dependendo do que será feito desses dados.

Já no `repartition`, os dados são redistribuídos igualmente de acordo com o
número de partições selecionadas. Devido à redistribuição dos dados, o
`repartition` pode ser um pouco mais lento, mas há a certeza de que as partições
terão valores uniformes entre si.


# Quando usar cada uma das operações?

Se você quiser apenas reduzir o número de partições de um dataset que não foi
filtrado ou que não teve seu número de linhas mudado de alguma forma, o
`coalesce` é a melhor opção. Como não há a redistribuição dos dados, é uma
operação mais rápida. Contudo, a própria documentação do Spark não indica[^1]
que o `coalesce` seja usado quando você deseja reduzir o número de partições pra
apenas 1. Isso porque a operação vai concentrar tudo em um único nó e deixar a
execução muito lenta.

Se você aplicou uma série de filtros no seu dataset, altrando o número total de
linhas, e deixando suas partições com tamanhos desiguais[^2]
`repartition` é a opção melhor. 

# Referências

* [https://kontext.tech/article/296/data-partitioning-in-spark-pyspark-in-depth-walkthrough](https://kontext.tech/article/296/data-partitioning-in-spark-pyspark-in-depth-walkthrough)
* [https://stackoverflow.com/questions/31610971/spark-repartition-vs-coalesce](https://stackoverflow.com/questions/31610971/spark-repartition-vs-coalesce)


---
{: data-content="tchaaau" }

[^1]: https://spark.apache.org/docs/3.1.1/api/python/reference/api/pyspark.sql.DataFrame.coalesce.html
[^2]: https://mungingdata.com/apache-spark/filter-where/
