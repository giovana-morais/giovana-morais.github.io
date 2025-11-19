---
title: "Atualizando pro Pop!_OS 24.04 e debugando eventuais erros no caminho"
layout: post
date: 2025-09-29
headerImage: false
category: blog
author: giovanamorais
---

# Atualizando pro Pop!_OS 24.04

Finalmente chegou a hora! Estava muito animada pra começar a usar o COSMIC e o
Pop_OS 24.04. Faz alguns anos já que o popinho é a minha distro do coração e eu
rapidamente decidi atualizar meu computador pessoal. Como é uma versão ainda
instável, vários problemas apareceram pelo caminho (vide lista abaixo), mas no
geral eu estou muuuuito satisfeita. O sistema é rápido, eu AMO o suporte de
janelas no qual você consegue viver muito bem sem um mouse e no geral o ambiente
todo tá incrível.

# Destaques
* As janelas são incríveis e eu sinto que o time responsável fez um excelente
trabalho. Conseguiram aproveitar tudo de bom que o 22.02 oferecia e deram um
grau. Ficou muito mais fácil de empilhar janelas e mover elas de um lado pro
outro. 
* Os workspaces agora podem ser separados por monitor, o que achei muito
prático.
* Eu gosto bastante do COSMIC terminal. Estava acostumada a usar o gnome-shell,
mas a versão do COSMIC não fica pra trás de nenhuma maneira. Esse terminal tá
em progresso ainda mas eles tão atualizando toda hora.
* Suporte rápido: como essa atualização ainda tá em teste, o time da System76
tem pedido pra reportarem os bugs. As respostas de problemas críticos têm sido
bem rápidas. 

# Problemas

## Problema 1: O WiFi "conectava", mas eu não conseguia acessar site nenhum.
Causa: `systemd-resolved` não foi instalado durante a atualização e aí por
causa disso nenhum endereço era resolvido pelo DNS. A solução foi baixar o
arquivo em outro computador, dar um `python -m http.server` e baixar o
arquivo na minha máquina (um pendrive também funcionaria) e instalar
manualmente. Aparentemente, esse problema [não foi só meu](https://github.com/pop-os/cosmic-epoch/issues/2248).

## Problema 2: Touchpad morre de tempos em tempos 
Verdade seja dita, isso já rolava de maneira intermitente na versão
22.04, mas eu ainda não consegui resolver. É um problema bem estranho, porque
ele funciona na maior parte do tempo, mas às vezes ele só para. Nem sempre é
quando o computador suspende ou hiberna, às vezes é só do nada mesmo. Já tentei
[de tudo](https://github.com/pop-os/pop/issues/399), mas ainda não resolvi.
Tenho que andar com um mouse por aí porque nunca sei quando o touchpad vai parar de
funcionar.

Comecei tentando investigar se o meu touchpad era reconhecido pelo sistema
(`xinput`) e nada apareceu. Tentei dar uma olhada mais distante (`cat
/proc/bus/input/devices | grep -i touch`) e ainda assim nada. Descobri que o
touchpad poderia estar desativado direto na BIOS, então fui lá fuçar, mas não
encontrei nada. Seguimos investigando.

## Problema 3: VLC lerdo
Não sei exatamente a causa, mas a atualização destruiu o VLC. Também não [foi só
comigo](https://github.com/pop-os/cosmic-epoch/issues/2166) e as pessoas
desenvolvendo o sistema estão tentando nos ajudar a entender o motivo, mas até
então sem sucesso. Tenho usado o Audacity quando tenho que verificar algum
arquivo de áudio, mas isso é longe do ideal.
