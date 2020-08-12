---
title: Mapas com muitos pontos? O folium pode ser a solução.
layout: post
date: 2019-11-04 14:42
headerImage: false
tag: 
- folium
- visualização
category: blog
author: giovanamorais
---

O [folium](https://github.com/python-visualization/folium) é uma biblioteca de visualização
de mapas em Python. Ele gera um html que é interativo e você consegue configurar um milhão
de coisas, como mensagens, cores, tooltips etc. 

O único problema da visualização padrão do folium é que às vezes é necessário inserir 
uma quantidade muito 
massiva de pontos, fazendo com que a visualização fique muito poluída. Contudo, há
algo que pode salvar a sua vida, assim como salvou a minha: o `MarkerCluster`.
Essa função permite fazer um mapa com clusters deixando a visualização bem mais 
simples e, principalmente, mais limpa. Coloquei aqui duas imagens de exemplo
a partir do mapa gerado. Uma visão mais macro

![outer_map](../../assets/images/outer_map.png)

E uma visão mais micro (que é o zoom no mapa)

![inner_map](../../assets/images/inner_map.png)

Tudo isso em um arquivinho que você tranquilamente pode salvar como html.
