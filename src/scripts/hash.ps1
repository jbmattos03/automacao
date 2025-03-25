# Parâmetros
Param(
    [Parameter(Mandatory, HelpMessage = "Informe o caminho do arquivo")] [System.IO.DirectoryInfo] $Path,
    [string] $Algorithm = "SHA256"
)

# Computar hash do arquivo
try {
    If ($Algorithm) {
        $Hash = Get-FileHash -Path $Path -Algorithm $Algorithm | Format-List
        Write-Output $Hash
    }
    Else {
        $Hash = Get-FileHash -Path $Path | Format-List
        Write-Output $Hash
    }
} catch {
    Write-Output "Erro ao computar hash do arquivo $($Path)"
    Write-Output $_.Exception.Message
}