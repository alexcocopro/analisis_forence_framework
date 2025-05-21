Get-Process | Select-Object Id, ProcessName, CPU, Path, Description | Export-Csv -Path "C:\Auditoria\Procesos.csv" -NoTypeInformation

# Elaborado por Alex Cabello AlexCocoPro

Write-Host "Script elaborado por Alex Cabello Leiva - AlexCocoPro"
Write-Host "Los logs han sido exportados a la carpeta C:\Auditoria"