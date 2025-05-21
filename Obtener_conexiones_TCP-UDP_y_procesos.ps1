# Obtener conexiones TCP/UDP y procesos
Get-NetTCPConnection -State Listen | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess | ForEach-Object {
    $proc = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue
    [PSCustomObject]@{
        "Protocolo" = "TCP"
        "Dirección Local" = $_.LocalAddress
        "Puerto Local" = $_.LocalPort
        "Dirección Remota" = $_.RemoteAddress
        "Puerto Remoto" = $_.RemotePort
        "Estado" = $_.State
        "PID" = $_.OwningProcess
        "Nombre Proceso" = $proc.Name
        "Ruta Proceso" = $proc.Path
    }
} | Export-Csv -Path "C:\Auditoria\Puertos_Procesos.csv" -NoTypeInformation

Get-NetUDPEndpoint | Select-Object LocalAddress, LocalPort, OwningProcess | ForEach-Object {
    $proc = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue
    [PSCustomObject]@{
        "Protocolo" = "UDP"
        "Dirección Local" = $_.LocalAddress
        "Puerto Local" = $_.LocalPort
        "PID" = $_.OwningProcess
        "Nombre Proceso" = $proc.Name
        "Ruta Proceso" = $proc.Path
    }
} | Export-Csv -Path "C:\Auditoria\Puertos_UDP_Procesos.csv" -NoTypeInformation

# Elaborado por Alex Cabello AlexCocoPro

Write-Host "Script elaborado por Alex Cabello Leiva - AlexCocoPro"
Write-Host "Los logs han sido exportados a la carpeta C:\Auditoria"

