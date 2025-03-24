# Parâmetros
Param(
    [Parameter(Mandatory, HelpMessage = "Informe o caminho do arquivo")] [System.IO.DirectoryInfo] $Path,
    [System.IO.DirectoryInfo] $DestinationPath = "./backup"
)

# Pegar data atual
$date = Get-Date -Format "dd-MM-yyyy"

# Criar uma pasta de backup
if (-not (Test-Path -Path $DestinationPath)) {
    New-Item -Path $DestinationPath -ItemType Directory
}

# Criar arquivo de backup
try {
    Compress-Archive -Path $Path -CompressionLevel Fastest -DestinationPath "$DestinationPath/backup_$date.zip"
    Write-Output "Backup criado com sucesso no caminho $DestinationPath/backup_$date.zip"
} catch {
    Write-Output "Erro ao criar backup no caminho $DestinationPath/backup_$date.zip"
    Write-Output $_.Exception.Message
}
