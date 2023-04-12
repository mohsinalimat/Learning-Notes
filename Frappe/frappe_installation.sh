############################---Description---###################################
#                                                                              #
# Summary       : Frappe-Framework with ERPNext                                #
# Support       : ranjithks@am.amrita.edu                                      #
# Created date  : Jul 21,2022                                                  #
# Latest Modified date : Jan 05,2022                                           #
#                                                                              #
################################################################################

set -e

# Color variables
#A script can use escape sequences to produce colored text on the terminal. Colors for text are represented by color codes,
#including, reset = 0, black = 30, red = 31, green = 32, yellow = 33, blue = 34, magenta = 35, cyan = 36, and white = 37.

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'
# Clear the color after that
clear='\033[0m'


printf "${white}
############################---Description---####################################
#                                                                               #
# Summary               : Frappe-Framework with ERPNext                         #
# Support               : ${yellow}ranjithks@am.amrita.edu${clear}                               #
# Created date          : Jul 21,2022                                           #
# Latest Modified date  : Jan 05,2022                                           #
# Created by            : ${blue}RANJITHKUMAR SEKAR${clear}                                     #
#                                                                               #
#################################################################################
${clear}
"

############################---Usage---##########################################
#                                                                               #
# Accounting                                                                    #
# Warehouse Management                                                          #
# CRM                                                                           #
# Sales                                                                         #
# Purchase                                                                      #
# HRMS                                                                          #
# Project Management                                                            #
# Support                                                                       #
# Asset Management                                                              #
# Quality Management                                                            #
# Manufacturing                                                                 #
# Website Management                                                            #
# Customize ERPNext                                                             #
# And More                                                                      #
#                                                                               #
#################################################################################

#bold colors
bld_red='\033[1;31m'
bld_green='\033[1;32m'
bld_yellow='\033[2;33m'
bld_blue='\033[1;34m'
bld_magenta='\033[1;35m'
bld_cyan='\033[1;36m'
bld_white='\033[1;37m'
#background colors
bg_red='\033[0;41m'
bg_green='\033[0;42m'
bg_yellow='\033[0;43m'
bg_blue='\033[0;44m'
bg_magenta='\033[0;45m'
bg_cyan='\033[0;46m'
#text bold
bold=`tput bold`
offbold=`tput rmso`
#Frappe, pronounced fra-pay, is a full stack, batteries-included, web framework written in Python and Javascript with MariaDB as the database.
#It is the framework which powers ERPNext. It is pretty generic and can be used to build database driven apps.
#The key difference in Frappe compared to other frameworks is that meta-data is also treated as data and is used to build front-ends very easily.
#We believe in a monolithic architecture, so Frappe comes with almost everything you need to build a modern web application.
#It has a full featured Admin UI called the Desk that handles forms, navigation, lists, menus, permissions, file attachment and much more out of the box.
function entering()
{
    PARAM_PROGRESS=$1;
    PARAM_PHASE=$2;

    if [ $CURRENT_PROGRESS -le 0 -a $PARAM_PROGRESS -ge 0 ]  ; then echo -ne "[..........................] (0%)  $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 5 -a $PARAM_PROGRESS -ge 5 ]  ; then echo -ne "[#.........................] (5%)  $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 10 -a $PARAM_PROGRESS -ge 10 ]; then echo -ne "[##........................] (10%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 15 -a $PARAM_PROGRESS -ge 15 ]; then echo -ne "[###.......................] (15%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 20 -a $PARAM_PROGRESS -ge 20 ]; then echo -ne "[####......................] (20%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 25 -a $PARAM_PROGRESS -ge 25 ]; then echo -ne "[#####.....................] (25%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 30 -a $PARAM_PROGRESS -ge 30 ]; then echo -ne "[######....................] (30%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 35 -a $PARAM_PROGRESS -ge 35 ]; then echo -ne "[#######...................] (35%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 40 -a $PARAM_PROGRESS -ge 40 ]; then echo -ne "[########..................] (40%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 45 -a $PARAM_PROGRESS -ge 45 ]; then echo -ne "[#########.................] (45%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 50 -a $PARAM_PROGRESS -ge 50 ]; then echo -ne "[##########................] (50%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 55 -a $PARAM_PROGRESS -ge 55 ]; then echo -ne "[###########...............] (55%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 60 -a $PARAM_PROGRESS -ge 60 ]; then echo -ne "[############..............] (60%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 65 -a $PARAM_PROGRESS -ge 65 ]; then echo -ne "[#############.............] (65%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 70 -a $PARAM_PROGRESS -ge 70 ]; then echo -ne "[###############...........] (70%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 75 -a $PARAM_PROGRESS -ge 75 ]; then echo -ne "[#################.........] (75%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 80 -a $PARAM_PROGRESS -ge 80 ]; then echo -ne "[####################......] (80%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 85 -a $PARAM_PROGRESS -ge 85 ]; then echo -ne "[#######################...] (85%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 90 -a $PARAM_PROGRESS -ge 90 ]; then echo -ne "[##########################] (100%) $PARAM_PHASE \r" ; delay; fi;
    if [ $CURRENT_PROGRESS -le 100 -a $PARAM_PROGRESS -ge 100 ];then echo -ne ${cyan}'Script Loading!                                 \n'${clear} ; delay; fi;

    CURRENT_PROGRESS=$PARAM_PROGRESS;

}


function delay()
{
    sleep 0.2;
}

printf  "${green}
 ________________________________________________________________________
|                                                                        |
|                           ENTERING SCRIPT                              |
|________________________________________________________________________|
${clear}\n"

CURRENT_PROGRESS=0

entering 10 "  Initialize              "
entering 20
entering 40
entering 60
entering 80
entering 90
entering 100 "Entered                  "


echo

# Step 1: Server Setup
timedatectl set-timezone "Asia/Kolkata"
sudo apt-get update -y
sudo apt-get upgrade -y
# Git is a distributed version control system: tracking changes in any set of files, usually used for coordinating work among programmers collaboratively developing source code during software development.
#Its goals include speed, data integrity, and support for distributed, non-linear workflows.
sudo apt-get install git -y

printf "${bld_yellow}
Installing Resources
${clear}"

#This guide is a comprehensive resource for contributing to Python – for both new and experienced contributors.
#It is maintained by the same community that maintains Python. We welcome your contributions to Python!
sudo apt-get install python3-dev -y
#Python Package Manager is a Python utility intended to simplify the tasks of locating, installing, upgrading and removing Python packages.
#It can determine if the most recent version of a software package is installed on a system, and can install or upgrade that package from a local or remote host.
sudo apt-get -y install python3-setuptools python3-pip virtualenv
#MariaDB is a database. MariaDB is very similar to MySQL (a database management system) and, in fact, a fork to MySQL.
#The MariaDB database is used for various purposes such as data warehousing, e-commerce, enterprise-level features, and logging applications.
sudo apt-get install software-properties-common
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] https://ftp.icm.edu.pl/pub/unix/database/mariadb/repo/10.3/ubuntu focal main'
sudo apt update
sudo apt install mariadb-server

printf "${bold}${green}
Resources Installed...!
${offblod}${clear}\n"

#mysql_secure_installation is a shell script available on Unix systems, and enables you to improve the security of your MariaDB installation in the following ways: You can set a password for root accounts.
#You can remove root accounts that are accessible from outside the local host.

echo "[mysqld]
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci
[mysql]
default-character-set = utf8mb4" >> /etc/mysql/my.cnf


printf "${red}
                     ##################        #########          ############
If You already using # Mysql/Maria DB # Please # Enter # Existing # Password #
                     ##################        #########          ############
${clear}"
printf "${green} 
OR
 _____________________________
|                             |
|       ---------             |
| Press | ENTER | to continue |
|       ---------             |
|_____________________________|
${clear}"

sudo mysql -uroot -p << EOF
flush privileges;
alter user root@localhost identified by 'Erp@123';
flush privileges;
EOF

sudo service mysql restart

printf "${yellow}
 __________________________
$                          $
$     Mysql root user      $
$ Password is ${clear}${green}| Erp@123 | ${clear}${yellow} $
$ _________________________$ ${clear}
"

# Redis is an in-memory data structure store, used as a distributed, in-memory key–value database, cache and message broker, with optional durability.
#Redis supports different kinds of a bstract data structures, such as strings, lists, maps, sets, sorted sets, HyperLogLogs, bitmaps, streams, and spatial indices.
#url is a tool to transfer data from or to a server, using one of the supported protocols 
#(DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMB, SMBS, SMTP, SMTPS, TELNET and TFTP).
#The command is designed to work without user interaction.
sudo apt-get install redis-server curl
#  Node.js is a cross-platform, open-source server environment that can run on Windows, Linux, Unix, macOS, and more.
#Node.js is a back-end JavaScript runtime environment, runs on the V8 JavaScript Engine, and executes JavaScript code outside a web browser.
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
# Yarn is a software packaging system developed in 2016 by Facebook for the Node.js JavaScript runtime environment.
#An alternative to the npm package manager, Yarn was created as a collaboration of Facebook, Exponent, Google, and Tilde to solve consistency, security, and performance problems with large codebases
sudo npm install -g yarn
#wkhtmltopdf and wkhtmltoimage are open source (LGPLv3) command line tools to render HTML into PDF and various image formats using the Qt WebKit rendering engine.
#These run entirely "headless" and do not require a display or display service.
sudo apt-get install xvfb libfontconfig wkhtmltopdf
# Bench is a CLI tool to manage Frappe Deployments. It provides an easy interface to help you setup and manage multiple sites and apps based on Frappe Framework.
sudo -H pip3 install frappe-bench
#The iced drink is generally made up of water, espresso, sugar, milk, ice and is shaken, blended or beaten to combine the ingredients.
#It tends to be served with whipped cream and toppings such as sweet sauces and presented in a tall glass. Traditionally a Frappé is made with coffee, but it doesn't have to be!
bench init frappe-framework --frappe-branch version-14
cd frappe-framework/
#Frappe Framework Tutorial. Install and Setup Bench. Create an App. Create a Site. Create a DocType. DocType Features
#Frappe Apps. Contribute Translations. Frappe Ajax Call. How to Enable Backup Encryption. App Development. Custom Action in Link Field.
bench new-site frappe-site.com
#Users can rapidly search for Website Items or Item Groups on all Product Listing pages using the Search bar. Furthermore, it saves recently performed searches you can access and use again.
#By default, ERPNext performs a simple DB search, but you can optionally choose to use RediSearch for a super fast search instead.
# The Standard Buying cycle was used until version 13 to control the subcontracting feature. In contrast, a new module called Subcontracting was added in version 14 to maintain the functionality.
#Subcontracting Order and Subcontracting Receipt are two additional papers added to the workflow.
# set current site
bench use erp_next.com

printf "
${bld_green}
(Project Strating-:)...)
${clear}
"

printf "${yellow}
####################---Project Details---###################
${clear}
 _____________________________________________________________________________
|                                                                             |
| ${green}# Project Path:${clear}${red} /home/frappe-framework${clear}                                      |
|                                                                             |
| ${green}# Site Path: ${clear}${red} /home/frappe-framework/sites/ ${clear}                                  |
|                                                                             |
| ${green}# MySQL root user Password: ${clear}${red} Erp@123 ${clear}                                         |
|                                                                             |
| ${green}# Application URL: ${clear}${red}http://localhost:8000${clear}                                      |
|                                                                             |
| ${green}# Application Username: ${clear}${red} Administrator${clear}                                |
|_____________________________________________________________________________|
${red}Notes:${clear} ${blue}[Please check the ${clear} ${magenta}'/home/frappe-framework/Project_Details.txt'${clear}${blue} file for above Project Details]${clear}\n
"


printf "
####################---Project Details---###################
 _____________________________________________________________________________
|                                                                             |
| # Project Path: /home/frappe-framework                                      |
|                                                                             |
| # Site Path:  /home/frappe-framework/sites/                                 |
|                                                                             |
| # MySQL root user Password:  Erp@123                                        |
|                                                                             |
| # Application URL: http://localhost:8000                                    |
|                                                                             |
| # Application Username:  Administrator                                      |
|                                                                             |
| # Any Query mailto: ranjithks@am.amrita.edu                                 |
|_____________________________________________________________________________|\n
" > Project_Details.txt

CURRENT_PROGRESS=0

progress 10 Initialize
progress 20 "Resources Setup...     "
progress 40 "Database Setup...      "
progress 60 "Bench Setup            "
progress 80 "Processing...          "
progress 90 "Finalizing...          "
progress 100 "Done                  "

echo

# project start
bench start