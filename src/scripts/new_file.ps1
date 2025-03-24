# Parâmetros
Param(
    [Parameter(Mandatory, HelpMessage = "Informe o caminho do arquivo")] [string]$path,
    [string]$type = "File"
)

# Cria o arquivo
try {
    New-Item -Path $path -ItemType $type
    Write-Output "Arquivo criado com sucesso no caminho $path"
} catch {
    Write-Output "Erro ao criar arquivo no caminho $path"
    Write-Output $_.Exception.Message
}