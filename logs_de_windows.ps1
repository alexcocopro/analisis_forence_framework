# Log de Seguridad (Eventos de inicio de sesión)
Get-WinEvent -LogName Security -MaxEvents 1000 | Where-Object {$_.Id -eq 4624 -or $_.Id -eq 4625} | Select-Object TimeCreated, Id, Message | Export-Csv -Path "C:\Auditoria\Log_Seguridad.csv" -NoTypeInformation

# Log del Sistema
Get-WinEvent -LogName System -MaxEvents 1000 | Select-Object TimeCreated, Id, Message | Export-Csv -Path "C:\Auditoria\Log_Sistema.csv" -NoTypeInformation

# Log de Aplicaciones
Get-WinEvent -LogName Application -MaxEvents 1000 | Select-Object TimeCreated, Id, Message | Export-Csv -Path "C:\Auditoria\Log_Aplicaciones.csv" -NoTypeInformation

# Elaborado por Alex Cabello AlexCocoPro

Write-Host "Script elaborado por Alex Cabello Leiva - AlexCocoPro"
Write-Host "Los logs han sido exportados a la carpeta C:\Auditoria"