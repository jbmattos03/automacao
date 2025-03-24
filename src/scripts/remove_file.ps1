# Parâmetros
Param(
    [Parameter(Mandatory, HelpMessage = "Informe o caminho do arquivo")] [string]$path
)

# Remove o arquivo
try {
    Remove-Item -Path $path -Recurse  # Remover arquivos e pastas recursivamente
    Write-Output "Arquivo removido com sucesso no caminho $path"
} catch {
    Write-Output "Erro ao remover arquivo no caminho $path"
    Write-Output $_.Exception.Message
}