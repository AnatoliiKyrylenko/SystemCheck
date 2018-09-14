#!/bin/bash
echo "--------------------------"
# Services list, can be expanded
for service in sshd apache2 nginx mysql mariadb httpd cron crond firewalld ufw; 
do
systemctl status $service | grep --quiet "loaded"
	# If grep detect "loaded", returning 0
        if [ $? -eq 0 ]; then
		# Green notice - active
                echo -en $service "\033[0;32m active (exited) \033[0m\n"
        else
		#Red notice - inactive
                echo -en $service "\033[0;31m inactive (dead) \033[0m\n"
        fi
done
echo "--------------------------"

