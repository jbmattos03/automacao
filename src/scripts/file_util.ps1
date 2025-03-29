# Pegar parâmetros
Param(
    [Parameter (Mandatory, HelpMessage = "Informe o caminho do arquivo")] [System.IO.DirectoryInfo] $Path,
    [switch] $Remove = $False,
    [switch] $Move = $False,
    [System.IO.DirectoryInfo] $DestinationPath,
    [string] $Type = "File"
)

# Verificar parâmetros
if ($Move) {
    try {
        # Verificar se DestinationPath existe
        if (-Not $DestinationPath) {
            Throw "Insira o caminho de destino"
        }

        Move-Item $Path $DestinationPath -ErrorAction Stop
        Write-Output "Item movido com sucesso de $Path para $DestinationPath."
    }
    catch {
        Write-Output "Erro ao mover item do caminho $Path para $($DestinationPath): $($_.Exception.Message)"
    }
}
elseif ($Remove) {
    try {
        # Lembrar o usuário de que ele está tentando deletar todo o conteúdo da pasta
        if (Test-Path -Path $Path -PathType Container) {
            Write-Output "Este comando vai apagar a pasta $Path e TODO o conteúdo.`nTem certeza de que quer prosseguir?`nS/n"

            $ConfirmRemoval = Read-Host

            if ($ConfirmRemoval -eq "N" || $ConfirmRemoval -eq "n") {
                exit 0
            }
        }

        Remove-Item -Path $Path -Recurse -ErrorAction Stop
        Write-Output "Item removido com sucesso."
    } catch {
        Write-Output "Erro ao remover arquivo no caminho $($Path): $($_.Exception.Message)"
    }
}
else { # Padrão: Criar item
    try {
        New-Item -Path $Path -ItemType $Type -ErrorAction Stop
        Write-Output "Item criado com sucesso no caminho $Path."
    } catch {
        Write-Output "Erro ao criar arquivo no caminho $($Path): $($_.Exception.Message)"
    }
}