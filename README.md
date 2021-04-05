# check_serviceaut


Plugin for nagios to check service status and autostart if service is stopped

1.- Define command in /usr/local/nagios/etc/objects/commands.cfg

define command{
	command_name	check_serviceaut
	command_line	$USER1$/check_nrpe -H $HOSTADDRESS$ -t 30 -p 5666 -c check_serviceaut $ARG1$ 
}

2.-Define Service in Host.cfg 

define service{
	use						        generic-service
	host_name				      YOUR_HOST
	service_description		WinRM Service
	check_command			    check_serviceaut! -a WinRM
	
}

3.- Put check_service.ps1 in C:\Program Files\NSClient++\scripts

4.- Edit nsclient.ini in you Host and add the followin lines

[/settings/external scripts/wrapped scripts]
check_serviceaut = check_service.ps1  $ARG1$ 
