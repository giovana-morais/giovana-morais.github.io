---
title: "A Tutorial on Onset Detection in Music Signals"
layout: post
date: 2020-09-07
headerImage: false
tag:
- mir
category: leituras
author: giovanamorais
---

Autores: Juan Pablo Bello, Laurent Daudet, Samer Abdallah, Chris Duxbury, Mike Davies, and
Mark B. Sandler

---

## Definições básicas:

* **Ataque da nota:** intervalo no qual a amplitude do envelope espectral 
aumenta
* **Transiente da nota:** intervalos curtos no qual o sinal 
evoluí rapidamente de alguma maneira não-trivial ou imprevisível. 
* **Onset da nota:** um instante único escolhido para marcar o transiente. 
Pode ser usado o ínicio do transiente ou o primeiro momento em que o 
transiente pode ser corretamente detectado.
* **Novelty function:** é um sinal intermediário que reflete de maneira 
simplificada a estrutura local do sinal original.
* **Sinal residual:** é um sinal que resulta da subtração da forma de onda 
original e um sinal modelado. Quando uma modelagem senoidal ou harmônica é 
usada, é assumido que o sinal residual contém a maioria dos componentes 
ruidosos e "impulsivos" do sinal original, como os transientes


## Esquema geral de um algoritmo de detecção de onset

### 1. Pré-processamento

O pré-processamento do sinal deve ressaltar características úteis para 
a tarefa almejada, nesse caso a detecção de onsets

* **Múltiplas faixas de frequência:** criação de bancos de filtros para 
analisar os transientes em diversas faixas de frequências. Goto, por exemplo, ser usados para "fatiar" o espectrograma em "tiras de 
espectro" e, a partir disso, reconhecer onsets a partir de mudanças na 
energia. Outro exemplo de aplicação é o método proposto por Duxbury et al que
separa o sinal em 5 sub-bandas e propõe um esquema híbrido, considerando a 
energia para detecção nas frequências mais altas e o espctro nas bandas mais 
baixas.

* **Separação de transiente** 

### 2. Redução

O objetivo da redução é transformar o sinal em uma função de detecção (ou 
*novelty function*), que contenha as ocorrências de transientes do sinal 
original.

* **Redução baseada em atributos do sinal**
	- *atributos temporais:* em sinais temporais simples é notável que a 
	ocorrência de um onset geralmente está associada a um aumento da amplitude
	do sinal. Uma melhora para essa técnica e olhar para a energia local em vez
	de olhar para a amplitude. Outro refinamento, baseado em psicoacústca, é usar
	uma compressão logarítmica no sinal para simular a percepção do ouvido de 
	"altura".
	- *atributos espectrais:* O fluxo espectral, por exemplo, que é calculado a 
	como a distância entre espectros sucessivos do STFT, tem um efeito de levar
	em conta aenas as frequẽncias onde há um aumento de energia, enfatizando
	onsets em vez de offsets.
	- *atributos espectrais usando fase:* levar a fase em consideração pode 
	também ser importante uma vez que a estrutura temporal do sinal está 
	codificada na fase. Em regiões de transiente, a frequência instantânea não é
	bem definida e portanto a variação da fase tende a ser grande.
	- *análise de tempo-frequência e tempo-escala*

* **Redução baseada em modelos probabilísticos**
	- *métodos de detecção de mudança de pontos*
	- *métodos baseados em "sinais surpresa"*

#### Comparação dos métodos
	
* Métodos temporais são simples e computacionalmente eficientes. Seu 
funcionamento depende da existência de aumentos claros de amplitude. Esse tipo 
de método perde eficiência quando ocorrem modulações de amplitude (como é o 
caso de um vibrato) ou quando há uma sobreposição de energia produzida por 
sons simultâneos.
* Para sons não triviais, a detecção de onset se beneficia de métodos mais 
complexos, como a representação em tempo-frequência.
* Alguns métodos espectrais como o HFC conseguem enfatizar a percussividade do
sinal, mas são menos robustos para detectar os onsets de tons baixos e de 
eventos não percussivos, onde a energia varia em frequências baixas e, por 
isso, não são enfatizadas pelo método.
* Métodos baseados em fase conseguem detectar mudanças em frequências altas e
baixas, independente da intensidade. Contudo, sofre com variações introduzidas
pelas fases de componentes ruidosos de baixa frequência.
* Métodos com representação tempo-frequência do sinal ou tempo-escala tem um 
custo computacional mais elevado. Esse tipo de representação não suaviza tanto
o sinal, necessitanto de algum pós-processamento.

### 3. Peak-Picking

O processo de encontrar picos deve estar envolvido em um algoritmo robusto, de
modo que os atributos que desejamos encontrar (geralmente o máximo local, ou 
pico) não seja mascarado por ruídos ou por outros eventos que não 
necessariamente sejam relacionados a onsets, como o vibrato. Por isso, o 
algoritmo tem que seguir alguns passos:

* **Pós-processamento:** o objetivo desse passo é facilitar o thresholding e 
a observação dos picos. Para isso, é necessário removar os ruídos com técnicas
como a suavização do sinal.
* **Thresholding:** mesmo após o pós-processamento ainda existirão picos que 
não são relacionados aos onsets e, por isso, é necessária a definição de um 
threshold que efetivamente separe eventos de onset de eventos que não são 
relacionados.
* **Pick-Picking**: após os passos anteriores, a identificação dos picos se 
resume a achar o máximo local acima do threshold.


### 4. Como escolher o melhor método

Os métodos são dependentes do tipo de sinal no qual vão ser aplicados. Dado
isso, os autores fazem as seguintes considerações:

* Se o sinal é muito percussivo (ex, bateria), então métodos de domínio do 
tempo são adequados;
* Por outro lado, métodos espectrais como os baseados em distribuição de fase
e diferença espectral performam muito bem em transientes com tons;
* A diferença espectral no domínio complexo parece ser uma boa escolha em 
geral, mascom uma pequena adição de custo computacional;
* Se for necessária precisão temporal, métodos baseados em wavelets podem ser
úteis, ainda mais se combinados com outros métodos;
* Se for aceitável um alto custo computacional e um conjunto de treinamento 
estiver disponível, métodos estatísticos têm os melhores resultados gerais e
são menos dependentes em um conjunto particular de parâmetros.
