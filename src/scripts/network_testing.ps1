# Pegando parâmetros
Param(
    [string] $Domain = "www.google.com"
)

# Validando parâmetros
if ($Domain) {
    <# 
    Validação do domínio:
    "^(?:www\.)?(?!-)([a-zA-Z0-9-]{1,63}(?<!-)\.)+[a-zA-Z]{2,}$"
        Grupo 1: ^(?:www\.)
            + "www." é um começo opcional para a string

        Grupo 2: ([a-zA-Z0-9-]{1,63}(?<!-)\.)+
            + [a-zA-Z0-9-]{1,63}: Nome do domínio é composto de letras minúsculas ou maiúsculas ou números, e pode ter de 1 a 63 caracteres
            + (?<!-): Nome não pode terminar com hífen
            + +: Grupo tem que dar match ao menos 1 vez, o máximo de vezes possível

        Grupo 3: [a-zA-Z]{2,}$
            + TLD tem, no mínimo, 2 caracteres
    #>

    try {
        $Result = $Domain -Match "^(?:(www)|(wiki)\.)?(?!-)([a-zA-Z0-9-]{1,63}(?<!-)\.)+[a-zA-Z]{2,}$"
        if (-Not $Result) {
            Throw "Insira um dominio valido"
        }
    } catch {
        Write-Error "$($_.Exception.Message)"
        exit 1
    }
}

# Imprimir banner
Write-Output "----- network_testing -----"
Write-Output "Iniciando testes...`n"

# Verificar se máquina usa Linux ou Windows
$IsOSWindows = $True # Presumir, por padrão, que máquina usa Windows
try {
    Write-Output "Verificando se maquina utiliza Windows ou Linux..."

    $HostInfo = hostnamectl -ErrorAction Continue
    if ($HostInfo) {
        $IsOSWindows = $False
        Write-Output "Maquina esta utilizando Linux.`n"
    }
}
catch {

    Write-Output "Maquina esta utilizando Windows.`n"
}

# Testar DNS
try {
    Write-Output "Testando se ha problemas na resolução de DNS..."

    if ($IsOSWindows) {
        $DNS = Resolve-DnsName -Name $Domain -ErrorAction Stop
    }
    else {
        <# 
        Resolve-DnsName, por padrão, não funciona no Linux.
        Para tornar o script mais fácil de rodar, optei por utilizar um comando similar, menos detalhado, 
        mas que, para os propósitos deste código, funciona perfeitamente.
        É possível fazê-lo funcionar, entretanto, baixando o módulo DnsClient na sua máquina.
        #>

        $DNS = [System.Net.Dns]::GetHostAddresses($Domain) 
    }

    if (-Not $DNS) {
        Throw "Erro ao resolver DNS"
    }

    # Informar se o DNS foi resolvido com sucesso
    if ($DNS) {
        Write-Output "DNS resolvido com sucesso.`n"
    } 
} catch {
    Write-Error "$($_.Exception.Message)"
}

# Testar velocidade utilizando CLI da Ookla
# Atenção: Instalar CLI do Speedtest da Ookla antes de rodar
try {
    Write-Output "Testando velocidade da conexao..."
    #speedtest
} catch {
    Write-Output "Erro ao rodar Ookla Speedtest: $($_.Exception.Message)" 
}