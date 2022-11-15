# check_serviceaut


Plugin for nagios to check service status and autostart if service is stopped

1.- <b>commands.cfg</b>
```yaml
define command{ 
        command_name    check_serviceaut
        command_line    $USER1$/check_nrpe -H $HOSTADDRESS$ -t 30 -p 5666 -c check_serviceaut -a $ARG1$ 
}
```
2.- <b>Define Service </b>
```yaml
define service{
        use                        generic-service
        host_name                  YOUR_HOST
        service_description        WinRM Service
        check_command              check_serviceaut! WinRM 

}
```
3.- <b>Put check_service.ps1 in C:\Program Files\NSClient++\scripts<br/></b>

4.- <b>nsclient.ini</b>
```yaml
[/settings/external scripts/wrapped scripts]
check_serviceaut = check_service.ps1  $ARG1$ 
```
