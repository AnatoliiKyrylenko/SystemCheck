#!/bin/bash
for service in sshd apache2 nginx mysql mariadb httpd crond firewalld ufw; 
do
systemctl status $service | grep --quiet "loaded"
	if [ $? -eq 0 ]; then
		echo -en $service "\033[0;32m active (exited) \033[0m\n"
	else
		echo -en $service "\033[0;31m inactive (dead) \033[0m\n"
	fi
done
