# Parâmetros
Param(
    [Parameter(Mandatory, HelpMessage = "Informe o caminho do arquivo")] [string]$Path,
    [string]$Type = "File"
)

# Cria o arquivo
try {
    New-Item -Path $Path -ItemType $Type
    Write-Output "Arquivo criado com sucesso no caminho $Path"
} catch {
    Write-Output "Erro ao criar arquivo no caminho $Path"
    Write-Output $_.Exception.Message
}