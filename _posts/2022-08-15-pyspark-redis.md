---
title: "a maneira certa de se conectar um dataframe a um banco de dados"
layout: post
date: 2022-08-15
category: blog
author: giovanamorais
---

# O problema
Embora o Spark tenha uma biblioteca que ajude a conectar e salvar os dados de
um dataframe no Redis de forma distribuída[^1][^2], essa solução não contempla todas as
estruturas de dados do Redis que estão disponíveis. Principalmente para o
PySpark, uma vez que você consegue salvar os dados do seu DataFrame apenas como
HashMaps.

Portanto, pra conseguir salvar os campos como um OrderedSet ou como GeoSpatial
data, é necessário usar o client de Python[^3] mesmo e fazer umas adequações.

Se você tentar criar uma variável global com a conexão do banco, vai receber o
famoso erro de que a variável não é serializável. Algo como

```python
TypeError: can't pickle _thread.lock objects
```

# A solução ruim

A solução mais simples pra resolver isso é criar uma User Defined Function (UDF)
que conecta no Redis e então faz a operação desejada.


```python
# criamos a função
def zadd(key, list_column):
	import redis

	address = "<insira-aqui-seu-endereço>"
	db = redis.Redis(address)
	value = {i[0]: i[1] for i in list_column}

	return db.zadd(key, value, ch=True)

# criamos a udf
zadd_udf = F.udf(zadd, Array(StringType()))

# aplicamos a udf
df = df.withColumn("zadd_result", zadd_udf(F.col("key"), F.col("list_column")))

# forçamos uma ação
df.count()
```

O problema dessa solução é que ela não é escalável e é muito custosa.
O que você está fazendo de fato é abrindo uma conexão com o Redis
por **linha** do seu DataFrame e à medida
que ele for crescendo as conexões vão começar a ser recusadas.

# A solução boa
Bom, a solução ideal seria fazer apenas uma conexão com o banco, mas no caso do
PySpark eu não consegui achar nada que permitisse implementar algo como
ConnectionPool[^7]. Criar algo como uma variável global com a conexão ou
mesmo um ConnectionPool não funciona, assim como tentar fazer o broadcast da
conexão também não[^8].

A melhor solução é então conectar ao banco de dados dentro de uma função de map
e, pra isso, temos as funções de `mapPartition` e `foreachPartition`[^6]. As duas
funções são funções de RDD e não de DataFrames, mas a conversão de um para o
outro é bem simples. O `foreachPartition` tem ainda uma versão que pode ser
aplicada direto em DataFrames[^4].

```python
def zadd(iter):
	# esse trecho será inicializado apenas uma vez por partição
	import redis

	address = "<insira-aqui-seu-endereço>"
	db = redis.Redis(address)

	# e então iteramos pelas partições, reaproveitando a conexão
	for row in iter:
		value = {i[0]: i[1] for i in row.list_column}
		db.zadd(row.key, value, ch=True)

	return

# aplicação direto no dataframe
df.foreachPartition(zadd)

# ou podemos transformar em rdd primeiro
df.rdd.foreachPartition(zadd)
```

A função `foreachPartition` é uma **ação** e, portanto, ela é aplicada
imediatamente ao RDD sem que ele mude de valor. Por isso, ela pode ser usada
quando não temos interesse em recuperar nenhum dado. Se quiséssemos salvar algum
resultado, o ideal seria usar o `mapPartition` que retorna um novo RDD[^5]. Ao
contrário do `foreachPartition`, o `mapPartition` é uma **transformação** e por
isso temos que usar alguma outra ação para que as mudanças sejam de fato
aplicadas.

> Transformações criam sempre um novo RDD a partir do original. Ações não criam
nenhum RDD novo[^9].

---
{: data-content="₮₵Ⱨ₳Ʉ" }

[^1]: [https://redis.com/blog/getting-started-redis-apache-spark-python/](https://dwgeek.com/basic-spark-transformations-and-actions-using-pyspark.html/)
[^2]: [https://github.com/RedisLabs/spark-redis](https://github.com/RedisLabs/spark-redis)
[^3]: [https://redis-py.readthedocs.io/en/stable/](https://redis-py.readthedocs.io/en/stable/)
[^4]: [https://spark.apache.org/docs/3.2.1/api/python/reference/api/pyspark.sql.DataFrame.foreachPartition.html](https://spark.apache.org/docs/3.2.1/api/python/reference/api/pyspark.sql.DataFrame.foreachPartition.html)
[^5]: [https://stackoverflow.com/questions/63806467/how-to-use-foreachpartition-on-pyspark-dataframe](https://stackoverflow.com/questions/63806467/how-to-use-foreachpartition-on-pyspark-dataframe)
[^6]: [https://stackoverflow.com/questions/49891686/cant-pickle-thread-lock-objects-pyspark-send-request-to-elasticseach](https://stackoverflow.com/questions/49891686/cant-pickle-thread-lock-objects-pyspark-send-request-to-elasticseach)
[^7]: [https://stackoverflow.com/questions/28142578/spark-cant-pickle-method-descriptor](https://stackoverflow.com/questions/28142578/spark-cant-pickle-method-descriptor)
[^8]: [https://stackoverflow.com/questions/36455624/pyspark-dataframe-foreach-with-happybase-connection-pool-returns-typeerror-c](https://stackoverflow.com/questions/36455624/pyspark-dataframe-foreach-with-happybase-connection-pool-returns-typeerror-c)
[^9]: [https://dwgeek.com/basic-spark-transformations-and-actions-using-pyspark.html/](https://dwgeek.com/basic-spark-transformations-and-actions-using-pyspark.html/)
