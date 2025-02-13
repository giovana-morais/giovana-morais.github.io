---
title: "pythonzitos"
layout: post
date: 2025-02-12
headerImage: false
category: blog
author: giovanamorais
---

lista desordenada de coisas que sempre preciso fazer mas nunca lembro como fazer

---


# adicionando uma dimensão a um array

```python
import numpy as np

x = np.arange(0,10)
print(x.shape)
# (10,)

x = np.expand_dims(x, 0)
print(x.shape)
# (1,10)
```


# limpando cache do pip

```bash
# remove um pacote específico
pip cache remove <pacote>

# limpa tudo
pip cache purge
```
