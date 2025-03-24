# Parâmetros
Param(
    [Parameter(Mandatory, HelpMessage = "Informe o caminho do arquivo")] [System.IO.DirectoryInfo] $path
)

# Pegar data atual
$date = Get-Date -Format "dd-MM-yyyy"

# Criar uma pasta de backup
if (-not (Test-Path -Path "./backup")) {
    New-Item -Path "./backup" -ItemType Directory
}

# Criar arquivo de backup
try {
    Compress-Archive -Path $path -CompressionLevel Fastest -DestinationPath "./backup/backup_$date"
    Write-Output "Backup criado com sucesso no caminho $("./backup" + $date + ".zip")"
} catch {
    Write-Output "Erro ao criar backup no caminho ./backup/backup_$date"
    Write-Output $_.Exception.Message
}
