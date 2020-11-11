---
title: Como conectar ao Bluetooth pelo terminal
layout: post
date: 2019-11-20 10:58
image:
headerImage: false
tag:
- bluetooth
- linha de comando
category: blog
author: giovanamorais
description:
---

## Motivação

Comprei um fone bluetooth! Achei tudo lindo e maravilhoso, rapidinho consegui
conectar no celular. Pensei "ok, agora vamos testar no computador" e foi aí
que a minha odisseia começou.

Eu não uso uma interface gráfica e sim um gerenciador de janelas, no caso o i3,
o que me força a aprender algumas coisas. Eu não fazia ideia de como
conectar o áudio do meu computador no bluetooth e, pior ainda, não sabia nem
como ligar o bluetooth.

Em primeiro lugar, fui olhar na documentação do [LARBS](://larbs.xyz/), que são
os .dotfiles que eu uso pra configurar o i3 e todo o meu ambiente.
Não achei nada lá e tive que usar minhas técnicas hackers (DuckDuckGo).

Bom, o meu sistema operacional é o [Arch Linux](https://www.archlinux-br.org/)
e a maior vantagem disso é que a [Wiki](https://wiki.archlinux.org/) é a
documentação mais incrível de todo o mundo e os fóruns também ajudam demais.
Dito isso, fui lá procurar pelo
[Bluetooth](https://wiki.archlinux.org/index.php/Bluetooth). Outro link útil
que achei, foi o tutorial (em inglês) de como ligar
[o fone no Bluetooth](https://wiki.archlinux.org/index.php/Bluetooth_headset).

Como acessei fontes em inglês, cá está meu pequeno tutorial em português de
como conectar ao bluetooth pelo terminal.

![img](../../assets/images/gifs/girl.gif)

---

## Requisitos

Bom, então pra rodar tudo você precisa em primeiro lugar do `bluetoothctl`
instalado na sua máquina. Por interface gráfica existem várias outras formas,
mas esse não é o objetivo dessa postagem.

Após baixar o `bluetoothctl`, a gente tem que ter certeza de que a componente
de bluetooth está desbloqueada. Pra isso, a gente usa o comando
[`rfkill`](https://linux.die.net/man/1/rfkill).


```shell
[giovana@valefor ~]$ rfkill
ID TYPE      DEVICE         SOFT         HARD
 0 wlan      phy0   desbloqueado desbloqueado
 4 bluetooth hci0   bloqueado desbloqueado
```

Se o bluetooth aparecer como "bloqueado", você deve usar o comando
`sudo rfkill unblock <ID do bluetooth>` ou `sudo rfkill unblock bluetooth`.
Rode novamente o `rfkill` e cheque se tudo aparece como desbloqueado.

---

## Usando o `bluetoothctl`

Se você digitar no seu terminal `bluetoothctl`, você vai entrar em um novo
consolezinho, cujo usuário agora é "bluetooth". Para ver todos os comandos que
são possíveis de serem utilizados, digite `help`.

```shell
[bluetooth]# help
Menu main:
Available commands:
-------------------
advertise                                         Advertise Options Submenu
scan                                              Scan Options Submenu
gatt                                              Generic Attribute Submenu
list                                              List available controllers
show [ctrl]                                       Controller information
select <ctrl>                                     Select default controller
devices                                           List available devices
paired-devices                                    List paired devices
system-alias <name>                               Set controller alias
reset-alias                                       Reset controller alias
power <on/off>                                    Set controller power
pairable <on/off>                                 Set controller pairable mode
discoverable <on/off>                             Set controller discoverable mode
discoverable-timeout [value]                      Set discoverable timeout
agent <on/off/capability>                         Enable/disable agent with given capability
default-agent                                     Set agent as the default one
advertise <on/off/type>                           Enable/disable advertising with given type
set-alias <alias>                                 Set device alias
scan <on/off>                                     Scan for devices
info [dev]                                        Device information
pair [dev]                                        Pair with device
trust [dev]                                       Trust device
untrust [dev]                                     Untrust device
block [dev]                                       Block device
unblock [dev]                                     Unblock device
remove <dev>                                      Remove device
connect <dev>                                     Connect device
disconnect [dev]                                  Disconnect device
menu <name>                                       Select submenu
version                                           Display version
quit                                              Quit program
exit                                              Quit program
help                                              Display help about this program
export                                            Print environment variables
```

A primeira coisa que é preciso fazer pro `bluetoothctl` funcionar é alimentar
a plaquinha com energia, ou seja `power on`.

```shell
[bluetooth]# power on
Changing power on succeeded
```

Após isso, precisamos tornar o nosso dispositivo "descobrível" e pareável.

```shell
[bluetooth]# discoverable on
Changing discoverable on succeeded
[CHG] Controller 34:68:95:DF:29:3E Discoverable: yes

[bluetooth]# pairable on
Changing pairable on succeeded
[CHG] Controller 34:68:95:DF:29:3E Pairable: yes
```

Agora sim podemos procurar por dispositivos:

```shell
[bluetooth]# scan on
Discovery started
[CHG] Controller 34:68:95:DF:29:3E Discovering: yes

[bluetooth]# devices
Device 1C:52:16:DA:8E:2D Redmi AirDots_R

[bluetooth]# agent on
Agent is already registered
```

Tudo que a gente for fazer é usando o endereço MAC do dispositivo encontrado,
então talvez você tenha que digitar isso muitas vezes. Provavelmente tem um
jeito de usar os `alias` mas eu não fui tão a fundo pra descobrir isso. Fica aí
pro leitor o desafio.

Após encontrar o dispositivo desejado, o Redmi AirDots_R, vamos "confiar" nele

```shell
[bluetooth]# trust 1C:52:16:DA:8E:2D
Changing 1C:52:16:DA:8E:2D trust succeeded
```

Antes de conectar, precisamos matar o _daemon_ do `pulseaudio` e daí fazer a
conexão:

```shell
$ pulseaudio -k
[bluetooth]# connect 1C:52:16:DA:8E:2D
Attempting to connect to 1C:52:16:DA:8E:2D
[CHG] Device 1C:52:16:DA:8E:2D Connected: yes
Connection successful
[CHG] Device 1C:52:16:DA:8E:2D ServicesResolved: yes
```

E pronto! Agora o seu fone deve funcionar. :heart:

A ordem completa dos comandos fica:
```shell
[bluetooth]# power on
Changing power on succeeded

[bluetooth]# discoverable on
Changing discoverable on succeeded
[CHG] Controller 34:68:95:DF:29:3E Discoverable: yes

[bluetooth]# pairable on
Changing pairable on succeeded
[CHG] Controller 34:68:95:DF:29:3E Pairable: yes

[bluetooth]# agent on
Agent is already registered

[bluetooth]# devices
Device 1C:52:16:DA:8E:2D Redmi AirDots_R

[bluetooth]# trust 1C:52:16:DA:8E:2D
Changing 1C:52:16:DA:8E:2D trust succeeded
[bluetooth]# exit

$ pulseaudio -k
$ bluetoothctl

[bluetooth]# connect 1C:52:16:DA:8E:2D
Attempting to connect to 1C:52:16:DA:8E:2D
[CHG] Device 1C:52:16:DA:8E:2D Connected: yes
Connection successful
[CHG] Device 1C:52:16:DA:8E:2D ServicesResolved: yes

```

---

## Problemas

Eu conseguia parear o meu dispositivo ao meu fone, mas eu não conseguia
conectar mesmo matando o _daemon_ do pulseaudio. Fui dar uma olhada no meu log
e

```shell
$ systemctl status bluetooth
● bluetooth.service - Bluetooth service
   Loaded: loaded (/usr/lib/systemd/system/bluetooth.service; enabled; vendor p
   Active: active (running) since Thu 2019-11-21 17:37:55 -03; 5 days ago
     Docs: man:bluetoothd(8)
 Main PID: 440 (bluetoothd)
    Tasks: 1 (limit: 4600)
   Memory: 2.2M
   CGroup: /system.slice/bluetooth.service
           └─440 /usr/lib/bluetooth/bluetoothd

nov 27 16:50:18 valefor bluetoothd[440]: a2dp-sink profile connect failed for
1C:52:16:DA:8E:2D: Protocol not available

```

Pra resolver isso, tive que instalar o `pulseaudio-bluetooth` e depois
reiniciar o `pulseaudio`.

Depois disso eu achei que tudo estava bem, mas não estava. Apesar de o log me
mostrar que estava conectando ao fone, o som não saia e eu não estava
entendendo nada. O que eu fiz foi rodar o `bluetoothctl` como root e o som
funcionou a partir disso. Reiniciei o `pulseaudio` (`pulseaudio -k`) e quando
conectei de novo tudo funcionou sem usar o root mesmo. :relaxed:


Bom, acho que é isso. Em último caso, não se esqueça de olhar a
Wiki na seção de [Troubleshooting](https://wiki.archlinux.org/index.php/Bluetooth_headset#Troubleshooting!)
ou mesmo o seu log por meio de `journalctl -u <nomeservico>.service`.
