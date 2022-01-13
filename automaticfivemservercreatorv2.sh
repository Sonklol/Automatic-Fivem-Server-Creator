#!/bin/bash
# AUTHOR: AIRGOLD3#7008 & https://github.com/Airgold3
# This file is part of Automatic Fivem Server Creator
# Copyright (C) 2021, Airgold3#7008
#    Automatic Fivem Server Creator ( is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#    Automatic Fivem Server Creator ( is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#    You should have received a copy of the GNU General Public License
#    along with Automatic Fivem Server Creator.  If not, see <https://www.gnu.org/licenses/>.

    #COLORS
    Color_Off='\033[0m'       # Text Reset

    # Regular Colors
    Red='\033[0;31m'          # Red
    Green='\033[0;32m'        # Green
    Yellow='\033[0;33m'       # Yellow
    Purple='\033[0;35m'       # Purple
    Cyan='\033[0;36m'         # Cyan
   
    if [ $(id -u) = 0 ]; then
         echo -e "$Yellow

                       .'''''''.                   
                       okkkkkxc;l.                 
                      :xxxxd::dxd.                 
                     'xxxd::dxd,  .                
                    .xkd::dxo'  ,:.                
                    co:cxxo'  ;:.  ;               
                   .;:xko'  ';. .:dkc              
                  .cxxl.  ,   .:xxxxx'             
                  oxc. .;:.  ,xxxxxxxd             
                 cc. .:;.     dxxxxxxxl            
                 . .:;  .     'xxxxxxxx,           
                 .:,  .l;      lxxxxxxxd.          
               .:'  'oxd       .xxxkxxxxc          
              .'  ,oxxx'        :xxkxxxxx,         
                ;dxxxxc          oxxxxxxxx.        
              ;dxxxkkx.          ,xxxxxxxxo        
            ,dxxxxxxx:            oxxxxxxxx:       
           .kkxxxxxxd             .xxxxxxxxx'      
           oxxxxxxkx'              :xxxxxxxxo      
          lxxxxxxxxc                dxxxxxxxxl     
         ,xxxxxxxxx.                ,xxxxkkxxx,    
        .xxxxxxxxx;                  lxxxxxxxxd.   
        ..........                    ..........  

        Automatic fivem server creator is a script 
        that automates and speeds up the process of 
        creating a fivem server for linux.

        --------------------------------------------
        By Airgold3#7008 & 
        https://github.com/Airgold3 $Color_Off";
   
        echo -e "\n      $Green 1) Full Installation of apache2, MYSQL Database (with phpmyadmin) and Fivem Server";
        echo -e "       2) Installation only of fivem server";
        echo -e "       3) Installation only of MYSQL Database";
        echo -e "       4) Exit";
        echo -e "      $Color_Off Select an option: ";
        read value;

            function createserver(){
                echo -e "$Yellow\n [INSTALLING FIVEM SERVER] $Color_OFF"
    
                echo -e "$Cyan\n Creating a new folder $Color_Off" 
                mkdir -p /home/$USER/FXServer/server

                echo -e "$Cyan\n Downloading the artifacts server... $Color_Off"
                wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5181-9eba8dcc91ee4c6ab009fcf7a47837edf81efd1a/fx.tar.xz

                echo -e "$Cyan\n Moving fx.tar to the folder server... $Color_Off"
                mv fx.tar.xz /home/$USER/FXServer/server

                echo -e "$Cyan\n Enter in the folder /home/username/FXServer/server and descompress the files... $Color_Off"
                cd /home/$USER/FXServer/server && tar xf fx.tar.xz

                echo -e "$Cyan\n Downloading repository of github... $Color_Off"
                git clone https://github.com/citizenfx/cfx-server-data.git /home/$USER/FXServer/server-data

                cd /home/$USER/FXServer/server-data
                echo -e "$Yellow\n Put the steam_webApiKey (Optional):  $Color_Off"
                read steamapikey
                echo -e "$Yellow\n Put the sv_licenseKey (Optional): $Color_Off"
                read licensekey

                echo -e "$Yellow \n Are you going to install esx-framework? (Y/n) $Color_Off"
                read frameworkinstall
                if [ $frameworkinstall = "S" -o $frameworkinstall = "s" ]; then
                        echo -e "$Yellow \n Are you going to install version reborn or legacy? (reborn/legacy/other) $Color_Off"
                        read frameworkinstallopcional
                        if [ $frameworkinstallopcional = "reborn" -o $frameworkinstallopcional = "Reborn" -o $frameworkinstallopcional = "REBORN" ]; then
                            echo -e "$Cyan\n Installing server.cfg of esx-reborn... $Color_Off"
                            # https://github.com/esx-framework/esx-reborn
                            echo "# minimum resources and config to get it working

                            set mysql_connection_string "mysql://user:password@localhost/esx-reborn?charset=utf8mb4&multipleStatements=true"

                            stop webadmin

                            ensure mapmanager
                            ensure chat
                            ensure spawnmanager
                            ensure sessionmanager
                            ensure hardcap
                            ensure rconlog
                            ensure baseevents

                            ensure yarn

                            ensure ghmattimysql
                            ensure cron

                            ensure esx-reborn # Will now auto-generate fxmanifest.lua to prevent platform-dependant behavior, will prompt you to type ensure esx-reborn in console when fxmanifest has changed. To save some typing, uncomment below lines

                            # stop esx-reborn
                            # start esx-reborn

                            # REQUIRED
                            # Add permission for esx-reborn to execute ACL commands
                            add_ace resource.esx-reborn command.add_ace allow
                            add_ace resource.esx-reborn command.remove_principal allow
                            add_ace resource.esx-reborn command.add_principal allow
                            add_ace resource.esx-reborn command.remove_ace allow
                            add_ace resource.esx-reborn command.list_aces allow
                            add_ace resource.esx-reborn command.list_principals allow
                            add_ace resource.esx-reborn command.remove_aces_for_object allow" > server.cfg
                        elif [ $frameworkinstallopcional = "legacy" -o $frameworkinstallopcional = "Legacy" -o $frameworkinstallopcional = "LEGACY" ]; then
                            echo -e "$Cyan\n Installing server.cfg of esx-legacy... $Color_Off"
                            # https://github.com/esx-framework/esx-legacy/blob/main/server.cfg
                            echo "# Development Discord: https://discord.gg/cNx6HF9P5J
                            # Support Discord: https://discord.gg/J6VqFPwvVp

                            # Only change the IP if you're using a server with multiple network interfaces, otherwise change the port only.
                            endpoint_add_tcp "0.0.0.0:30120"
                            endpoint_add_udp "0.0.0.0:30120"


                            sv_hostname "Unconfigured ESX Server"
                            set steam_webApiKey "$steamapikey"
                            sv_licenseKey "$licensekey"
                            sv_maxclients 10   # Allow access to features usually locked behind a FiveM patreon key

                            sets sv_projectName "ESX Legacy"
                            sets sv_projectDesc ""
                            sets locale "root-AQ"
                            sets tags "default, esx"
                            sv_scriptHookAllowed 0

                            set onesync legacy   # Infinity is not recommended for ESX
                            set mysql_connection_string "mysql://user:password@localhost/es_extended?waitForConnections=true&charset=utf8mb4"


                            ## These resources will start by default.
                            ensure mapmanager
                            ensure chat
                            ensure spawnmanager
                            ensure sessionmanager

                            ## Add system admins
                            add_ace group.admin command allow # allow all commands
                            add_ace group.admin command.quit deny # but don't allow quit
                            add_ace resource.es_extended command.add_ace allow
                            add_ace resource.es_extended command.add_principal allow
                            add_ace resource.es_extended command.remove_principal allow
                            add_ace resource.es_extended command.stop allow

                            ## ESX Legacy
                            ensure mysql-async
                            ensure cron
                            ensure skinchanger
                            ensure es_extended
                            ensure esx_menu_default
                            ensure esx_menu_dialog
                            ensure esx_menu_list
                            ensure esx_identity
                            ensure esx_skin

                            ## ESX Addons
                            #ensure esx_multicharacter   # es_extended requires Config.Multichar = true
                            ensure instance
                            ensure esx_rpchat
                            ensure esx_phone
                            ensure esx_voice
                            ensure esx_sit
                            ensure esx_animations
                            ensure esx_addonaccount
                            ensure esx_addoninventory
                            ensure esx_datastore
                            ensure esx_property
                            ensure esx_garage
                            ensure esx_society
                            ensure esx_service
                            ensure esx_billing
                            ensure esx_license
                            ensure esx_dmvschool
                            ensure esx_status
                            ensure esx_basicneeds
                            ensure esx_optionalneeds
                            ensure esx_shops
                            ensure esx_weaponshop
                            ensure esx_clotheshop
                            ensure esx_barbershop
                            ensure esx_accessories
                            ensure esx_vehicleshop
                            ensure esx_boat
                            ensure esx_jobs
                            ensure esx_joblisting
                            ensure esx_cruisecontrol
                            ensure esx_atm
                            ensure esx_drugs
                            ensure esx_holdup
                            ensure esx_lscustom
                            ensure esx_ambulancejob
                            ensure esx_mechanicjob
                            ensure esx_ambulancejob
                            ensure esx_policejob
                            ensure esx_bankerjob
                            ensure esx_realestateagentjob
                            ensure esx_taxijob" > server.cfg
                        else
                            echo "# Only change the IP if you're using a server with multiple network interfaces, otherwise change the port only.
                            endpoint_add_tcp "0.0.0.0:30120"
                            endpoint_add_udp "0.0.0.0:30120"
                            # These resources will start by default.
                            ensure mapmanager
                            ensure chat
                            ensure spawnmanager
                            ensure sessionmanager
                            ensure basic-gamemode
                            ensure hardcap
                            ensure rconlog
                            # This allows players to use scripthook-based plugins such as the legacy Lambda Menu.
                            # Set this to 1 to allow scripthook. Do note that this does _not_ guarantee players won't be able to use external plugins.
                            sv_scriptHookAllowed 0
                            # Uncomment this and set a password to enable RCON. Make sure to change the password - it should look like rcon_password "YOURPASSWORD"
                            #rcon_password ""
                            # A comma-separated list of tags for your server.
                            # For example:
                            # - sets tags "drifting, cars, racing"
                            # Or:
                            # - sets tags "roleplay, military, tanks"
                            sets tags "default"
                            # A valid locale identifier for your server's primary language.
                            # For example "en-US", "fr-CA", "nl-NL", "de-DE", "en-GB", "pt-BR"
                            sets locale "root-AQ" 
                            # please DO replace root-AQ on the line ABOVE with a real language! :)
                            # Set an optional server info and connecting banner image url.
                            # Size doesn't matter, any banner sized image will be fine.
                            #sets banner_detail "https://url.to/image.png"
                            #sets banner_connecting "https://url.to/image.png"
                            # Set your server's hostname
                            sv_hostname "FXServer, but unconfigured"
                            # Set your server's Project Name
                            sets sv_projectName "My FXServer Project"
                            # Set your server's Project Description
                            sets sv_projectDesc "Default FXServer requiring configuration"
                            # Nested configs!
                            #exec server_internal.cfg
                            # Loading a server icon (96x96 PNG file)
                            #load_server_icon myLogo.png
                            # convars which can be used in scripts
                            set temp_convar "hey world!"
                            # Remove the `#` from the below line if you do not want your server to be listed in the server browser.
                            # Do not edit it if you *do* want your server listed.
                            #sv_master1 ""
                            # Add system admins
                            add_ace group.admin command allow # allow all commands
                            add_ace group.admin command.quit deny # but don't allow quit
                            add_principal identifier.fivem:1 group.admin # add the admin to the group
                            # enable OneSync (required for server-side state awareness)
                            set onesync on
                            # Server player slot limit (see https://fivem.net/server-hosting for limits)
                            sv_maxclients 48
                            # Steam Web API key, if you want to use Steam authentication (https://steamcommunity.com/dev/apikey)
                            # -> replace "" with the key
                            set steam_webApiKey "$steamapikey"
                            # License key for your server (https://keymaster.fivem.net)
                            sv_licenseKey "$licensekey"
                            " > server.cfg
                        fi

                echo -e "$Green\n Starting the server... $Color_Off"
                bash /home/$USER/FXServer/server/run.sh +exec /home/$USER/FXServer/server-data/server.cfg
            }
            case $value in

            1)
                echo -e "$Cyan\n Update packages and Upgrade system... $Color_Off"
                apt update -y && sudo apt upgrade -y
            
                echo -e "$Cyan\n Downloading wget... $Color_Off"
                apt install wget -y
            
                echo -e "$Cyan\n Downloading xz-utils... $Color_Off"
                apt install xz-utils -y
            
                echo -e "$Cyan\n Downloading git-clone... $Color_Off"
                apt install git -y
            
                echo -e "$Cyan\n Downloading screen... $Color_Off"
                apt install screen -y
    
                echo -e "$Cyan\n Installing database... $Color_Off"
    
                apt-get install apache2 -y

                echo -e "$Yellow \n ¿Qué base de datos quieres? (mysql/mariadb) $Color_Off"
                read mariadbomysql
                if [ $mariadbomysql = "mysql" -o $mariadbomysql = "MYSQL" ]; then
                        apt -y install xz-utils apache2 mysql-server
                        apt -y install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
                        apt -y install libapache2-mod-php
                        a2enmod php7.4
                        
                        systemctl restart apache2
                else
                        apt -y install xz-utils apache2 mariadb-server
                        mysql_secure_installation
                        apt -y install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
                        apt -y install libapache2-mod-php
                        a2enmod php7.4
                        
                        systemctl restart apache2
                fi

                apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y 
                apt install libapache2-mod-php -y
                a2enmod php7.4
                systemctl restart apache2
                echo -e "$Yellow\n Tell me the password for the phpmyadmin: $Color_Off"
                read pwd
                mysql -u root -p $pwd mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$pwd';"
                
                #Calling the function createserver
                createserver
            ;;
    
            2)
                echo -e "$Cyan\n Update packages and Upgrade system... $Color_Off"
                apt update -y && sudo apt upgrade -y
            
                echo -e "$Cyan\n Downloading wget... $Color_Off"
                apt install wget -y
            
                echo -e "$Cyan\n Downloading xz-utils... $Color_Off"
                apt install xz-utils -y
            
                echo -e "$Cyan\n Downloading git-clone... $Color_Off"
                apt install git -y
            
                echo -e "$Cyan\n Downloading screen... $Color_Off"
                apt install screen -y

                #Calling the function createserver
                createserver
            ;;

            3)
                echo -e "$Cyan\n Update packages and Upgrade system... $Color_Off"
                apt update -y && sudo apt upgrade -y
            
                echo -e "$Cyan\n Downloading xz-utils... $Color_Off"
                apt install xz-utils -y
    
                echo -e "$Cyan\n Installing database... $Color_Off"
    
                apt-get install apache2 -y

                echo -e "$Yellow \n ¿Qué base de datos quieres? (mysql/mariadb) $Color_Off"
                read mariadbomysql
                if [ $mariadbomysql = "mysql" -o $mariadbomysql = "MYSQL" ]; then
                        apt -y install xz-utils apache2 mysql-server
                        apt -y install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
                        apt -y install libapache2-mod-php
                        a2enmod php7.4
                        
                        systemctl restart apache2
                else
                        apt -y install xz-utils apache2 mariadb-server
                        mysql_secure_installation
                        apt -y install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
                        apt -y install libapache2-mod-php
                        a2enmod php7.4
                        
                        systemctl restart apache2
                fi

                echo -e "$Yellow\n Tell me the password for the phpmyadmin: $Color_Off"
                read pwd
                mysql -u root -p $pwd mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$pwd';"
            ;;
            4)
                echo -e "$Color_OFF Exiting..."
                exit 1
            ;;
    
            *)
                echo -e "$Red\n [ERROR] Invalid option $Color_Off"
            ;;
            esac
    else
       echo -e "$Red\n [ERROR] I am not a root! Please open the file with $Yellow'sudo' $Color_Off \n"
       exit 1
    fi
