# automacao
Alguns projetos de automação de tarefas utilizando Powershell ou Python.

## PowerShell (scripts) 
Para rodar esses scripts, navegue até a pasta onde estão localizados, então rode:

```
./<nome do script>.ps1
```

---

### network_test.ps1
Realiza testes de performance de rede:
1. Resolução de DNS
2. Velocidade da conexão utilizando a API do Ookla Speedtest

Certifique-se de que tem a CLI do Ookla Speedtest antes de rodá-lo.

#### Instalando Speedtest CLI
1. Windows

```
winget --id=Ookla.Speedtest.Desktop -e
```

2. MacOS, Ubuntu/Debian, Fedora/Centos/RedHat e FreeBSD

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Refira-se aos comandos de instalação ou baixar o binário de [link oficial](https://www.speedtest.net/pt/apps/cli)

3. Arch Linux
Primeiro, instale o yay:

```
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
```

Então, instale o CLI:

```
yay -S ookla-speedtest-bin
```

#### Sintaxe

```
./network_testing.ps1 [[-Domain] <string[]>]
```

---

### network_info.ps1
Imprime informações de rede:
1. Informações do adaptador de rede
2. Configuração de IP

#### Sintaxe

```
./network_info.ps1
```

---

### backup.ps1
Cria arquivo .zip de backup de um diretório especificado e o armazena em um caminho especificado.

Caso caminho não seja especificado, cria uma pasta chamada "backup" no diretório _atual_.

Certifique-se de que está no diretório em que você quer armazenar o backup antes de rodar o script. Para isso, pode rodar um dos seguintes comandos:

```
Get-Location
pwd
```

#### Sintaxe

```
./backup.ps1 [[-Path] <System.IO.DirectoryInfo[]>] [[-DestinationPath] <System.IO.DirectoryInfo[]>]
```

---

### hash.ps1
Computa um valor hash para um arquivo especificado utilizando um algoritmo especificado (padrão: SHA256).

#### Sintaxe

```
./hash.ps1 [[-Path] <System.IO.DirectoryInfo[]>] [[-Algorithm] <string[]>]
```

---

### file_util.ps1
Cria, move/renomeia ou remove arquivos ou diretórios em um caminho especificado.
+ Para renomear, basta mover o item para o mesmo local sob um nome diferente

Cuidado ao remover diretórios.

#### Sintaxe

```
./file_util.ps1 [[-Path] <System.IO.DirectoryInfo[]>] [[-Remove]] [[-Type] <string[]>]
```
