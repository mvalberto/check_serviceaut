# Pasar argumentos

Param(
    [Parameter(Mandatory=$false)][string]$serviceName
    )

# Definir codigos de salida

$STATE_OK = 0
$STATE_WARNING = 1
$STATE_CRITICAL = 2
$STATE_UNKNOWN = 3

# Si el servicio no existe Pintar en Nagios Unknown

$ServiceExists = get-service $serviceName -ErrorAction SilentlyContinue
if($ServiceExists -eq $null) {
    echo "El Servicio $serviceName no existe!"
    exit $STATE_UNKNOWN
    }

#verificar estado de Servico

$serviceStatus = (get-service "$serviceName").Status;

#Si iesta arrancado todo ok

if ($serviceStatus -eq "Running") {
    echo "Servicio $serviceName Running"
    exit $STATE_OK
}

#Si esta parado lanzamos arranque automatico

else {
   
    echo "Servicio $serviceName $serviceStatus, lanzando arranque automatizado..."
    Start-Service -Name $serviceName
    exit $STATE_CRITICAL
     
}
