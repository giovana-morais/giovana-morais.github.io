---
title: Compute Capability Mismatch, ou `cudaErrorNoKernelImageForDevice`
layout: post
date: 2026-01-13
headerImage: false
category: blog
author: giovanamorais
---

# Compute Capability Mismatch

tudo começou com esse erro

```bash
torch.AcceleratorError: CUDA error: no kernel image is available for execution on the device 
Search for cudaErrorNoKernelImageForDevice' in https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__TYPES.html for more information. Compile with TORCH_USE_CUDA_DSA to enable device-side assertions.
```

o meu ambiente era:
Python 3.12, PyTorch 2.9, GPU Driver Version: 580.119.02 e CUDA Version: 13.0

chequei usando `nvidia-smi -q | grep "Compute Capability"`, que retornou nulo. então fui ler a documentação e descobri o comando certo

```bash
nvidia-smi --query-gpu=name,compute_cap 
name, compute_cap
NVIDIA GeForce MX330, 6.1
```
o que significa que a compute capability da minha GPU é `sm_61`.

então fui conferir o que a minha versão do torch suportava:
```python
In [1]: import torch

In [2]: torch?
Type:        module
String form: <module 'torch' from '/home/gigibs/.pyenv/versions/venv312/lib/python3.12/site-packages/torch/__init__.py'>
File:        ~/.pyenv/versions/venv312/lib/python3.12/site-packages/torch/__init__.py
Docstring:
The torch package contains data structures for multi-dimensional
tensors and defines mathematical operations over these tensors.
Additionally, it provides many utilities for efficient serialization of
Tensors and arbitrary types, and other useful utilities.

It has a CUDA counterpart, that enables you to run your tensor computations
on an NVIDIA GPU with compute capability >= 3.0.

In [3]: torch.__version__
Out[3]: '2.9.1+cu128'

In [4]: torch.cuda.get_arch_list()
Out[4]: ['sm_70', 'sm_75', 'sm_80', 'sm_86', 'sm_90', 'sm_100', 'sm_120']
```

ou seja: não suporta. depois eu descobri que minha GPU faz parte de uma linda família
que se chama **Pascal** e que portanto tem compute capability `sm_61` e que não
é suportada pelo Torch > 2.0 e CUDA > 11.8. Na verdade eu não sei exatamente
qual o range de versões que suportam essa família de GPU, já que vi que PyTorch
2.4 + CUDA 12.4 talvez funcionassem, mas aí também era detalhe demais pra um
problema que eu não ia resolver, então só decidi ignorar essa info por
enquanto. fica pra próxima.

as minhas opções aqui eram:
1. fazer o downgrade do CUDA + Torch
2. rodar como apenas CPU o meu código
3. arranjar uma GPU foda do nada

escolhi a opção 2 porque o meu ambiente está corretamente configurado no
cluster da universidade e, portanto, não preciso rodar nada local, exceto
pequenas provas de conceito. 

resolvido! fica o aprendizado.

referências
* [CUDA GPU Compute Capability](https://developer.nvidia.com/cuda/gpus)
* [CUDA Programming Guide - 5.1. Compute Capabilities](https://docs.nvidia.com/cuda/cuda-programming-guide/05-appendices/compute-capabilities.html)
* [CUDA & PyTorch Compatibility by Compute Capability (CC)](https://llmlaba.com/articles/cuda-pytorch-compatibility.html)
