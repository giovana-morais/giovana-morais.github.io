---
title: Mapas com muitos pontos? Mapas agrupados podem ser a solução.
layout: post
date: 2019-11-04 14:42
headerImage: false
tag: 
- folium
- visualização
- python
category: blog
author: giovanamorais
---

O [folium](https://github.com/python-visualization/folium) é uma biblioteca de visualização
de mapas em Python. Ele gera um html que é interativo e você consegue configurar um milhão
de coisas, como mensagens, cores, tooltips etc. Além disso, a criação dos mapas é bastante
simples:

{% highlight python %}

mapa_sem_clusters = folium.Map(
    location= posicionamento_mapa,
    zoom_start=15
)

for linha in dados_topologicos.itertuples():
    folium.Marker([linha.lat, linha.lon]).add_to(mapa_sem_clusters)

mapa_sem_clusters

{% endhighlight %}

O único problema da visualização padrão do folium é que às vezes é necessário inserir 
uma quantidade muito 
massiva de pontos, fazendo com que a visualização fique muito poluída, como no exemplo abaixo. 

![raw_map](../../assets/images/2019/raw_map.png)

Contudo, há algo que pode salvar a sua vida, assim como salvou a minha: o `MarkerCluster`.
Essa função permite fazer um mapa com clusters deixando a visualização bem mais 
simples e, principalmente, mais limpa. 

{% highlight python %}
mc = MarkerCluster()

mapa_clusterizado = folium.Map(location = posicionamento_mapa,
                 title = 'Antenas agrupadas')
    
    
for linha in dados_topologicos.itertuples():
    mc.add_child(folium.Marker([linha.lat, linha.lon]))
    
mapa_clusterizado.add_child(mc)

mapa_clusterizado
{% endhighlight %}

Coloquei aqui duas imagens de exemplo a partir do mapa gerado. Uma visão mais macro

![outer_map](../../assets/images/2019/outer_map.png)

E uma visão mais micro (que é o zoom no mapa)

![inner_map](../../assets/images/2019/inner_map.png)

Tudo isso em um arquivinho que você tranquilamente pode salvar como html. 

O exemplo completo com o dataset usado você encontra aqui nesse [repositório](https://github.com/giovana-morais/blog_code/tree/master/folium).
