# Parâmetros
Param(
    [Parameter(Mandatory, HelpMessage = "Informe o caminho do arquivo")] [string]$Path
)

# Remove o arquivo
try {
    Remove-Item -Path $Path -Recurse  # Remover arquivos e pastas recursivamente
    Write-Output "Arquivo removido com sucesso no caminho $Path"
} catch {
    Write-Output "Erro ao remover arquivo no caminho $Path"
    Write-Output $_.Exception.Message
}