# check_serviceaut


Plugin for nagios to check service status and autostart if service is stopped

1.- Define command in /usr/local/nagios/etc/objects/commands.cfg

define command{ <br/>
	command_name	check_serviceaut <br/>
	command_line	$USER1$/check_nrpe -H $HOSTADDRESS$ -t 30 -p 5666 -c check_serviceaut $ARG1$ <br/>
}

2.-Define Service in Host.cfg 

define service{<br/>
	use						        generic-service<br/>
	host_name				      YOUR_HOST<br/>
	service_description		WinRM Service<br/>
	check_command			    check_serviceaut! -a WinRM <br/>
	
}

3.- Put check_service.ps1 in C:\Program Files\NSClient++\scripts<br/>

4.- Edit nsclient.ini in your Host and add the following lines<br/>

[/settings/external scripts/wrapped scripts]<br/>
check_serviceaut = check_service.ps1  $ARG1$ 
