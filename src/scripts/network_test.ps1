# Testar DNS
try {
    $DNS = Resolve-DnsName -Name "www.google.com" -ErrorAction Stop | Out-Null

    # Informar se o DNS foi resolvido com sucesso
    if ($DNS) {
        Write-Output "DNS resolvido com sucesso."
    } 
} catch {
    Write-Output "Erro ao resolver DNS: $($_.Exception.Message)"
    exit 1
}

# Testar velocidade


