---
title: "combinando áudios com níveis de altura diferentes"
layout: post
date: 2024-08-19
headerImage: false
category: blog
author: giovanamorais
---


quando combinamos dois áudios, a primeira e mais natural ideia é só carregar os
sinais e somar eles. isso deveria ser suficiente. suponha que queiramos combinar
os seguintes áudios:

<audio src="/assets/audio/2024/ex1.wav" controls preload></audio>

<audio src="/assets/audio/2024/ex2.wav" controls preload></audio>


então, usando Python pra isso, teríamos

```python
import soundfile as sf

x1 = sf.read("ex1.wav", samplerate=16000)
x2 = sf.read("ex2.wav", samplerate=16000)

mixture = x1 + x2
```

o problema é que a diferença de intensidade se reflete no áudio da mistura.
<audio src="/assets/audio/2024/mix_sem_norm.wav" controls preload></audio>

pra corrigir isso, podemos fazer uma normalização a partir do RMS (Root Mean
Square, ou [valor eficaz](https://pt.wikipedia.org/wiki/Valor_eficaz)),
que mensura a magnitude do sinal.

```python
import soundfile as sf

x1 = sf.read("ex1.wav", samplerate=16000)
x2 = sf.read("ex2.wav", samplerate=16000)

rms_x1 = np.sqrt(np.mean(x1)**2)
rms_x2 = np.sqrt(np.mean(x2)**2)

min_rms = min(rms_x1, rms_x2)

norm_x1 = x1*(min_rms/rms_x1)
norm_x2 = x2*(min_rms/rms_x2)

mixture = norm_x1 + norm_x2
```

que resulta em:
<audio src="/assets/audio/2024/mix_com_norm.wav" controls preload></audio>


## código completo
(é necessário ter o numpy e o soundfile instalados)

```python
import numpy as np
import soundfile as sf

# vamos ler e escrever os áudios com a mesma taxa
# de amostragem
sr = 16000

# lê áudios
x1 = sf.read("ex1.wav", samplerate=sr)
x2 = sf.read("ex2.wav", samplerate=sr)

# combina sem normalização
mixture_1 = x1 + x2
sf.write("mix_sem_norm.wav", mixture_1, samplerate=sr)

# combina com normalização
rms_x1 = np.sqrt(np.mean(x1)**2)
rms_x2 = np.sqrt(np.mean(x2)**2)

min_rms = min(rms_x1, rms_x2)

norm_x1 = x1*(min_rms/rms_x1)
norm_x2 = x2*(min_rms/rms_x2)

mixture_2 = norm_x1 + norm_x2
sf.write("mix_com_norm", mixture_2, samplerate=sr)
```
