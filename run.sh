#!/bin/bash
echo "STARTING ...."
MAX_LOOP=30
COUNTER=1
DBHOST=${MYSQL_HOST}
DBUNAME=${MYSQL_ROOT_LOGIN}
DBPASS=${MYSQL_ROOT_PASSWORD}
RED_COLOR="\e[91m"
DEFAULT_COLOR="\033[0m"
GEEN_COLOR="\e[92m"
CYAN_COLOR="\e[96m"
BASENAME="CHECK-DB-ONLINE"
echo -e "${BASENAME} : ${GEEN_COLOR}Retrieve params${DEFAULT_COLOR}"
while true
do
    echo "${BASENAME} : DB TEST #${COUNTER}"
    # Retrieve Mysql UPTIME
    MYSQL_UPTIME=$(/usr/bin/mysql -sN -h ${DBHOST} -u ${DBUNAME} -p${DBPASS} -e 'SELECT value FROM sys.sys_config where variable = "diagnostics.allow_i_s_tables"')
    # Test MySQL respond
    if [ $? -eq 0 ]
    then
        # Test MySQL UPTIME
        if [ ${MYSQL_UPTIME} == 'OFF' ]
        then
            # UPTIME greater than 30 seconds
            # Go out the loop and assume DB is READY
            echo -e "${BASENAME} : ${GEEN_COLOR}DB is READY${DEFAULT_COLOR}"
            break
        fi
    fi
    # Check loop COUNT
    if [ $COUNTER -gt $MAX_LOOP ]
    then
        # We loop more than Allowed Exiting
        echo -e "${BASENAME} : ${RED_COLOR}DB unavailable${DEFAULT_COLOR}"
        exit 1
    fi
    # Wait 4 seconds
    sleep 4
    # increasing loop COUNTER
    COUNTER=$((COUNTER+1))
done
## Run app
echo -e "${BASENAME} : ${GEEN_COLOR}Run the app${DEFAULT_COLOR}"
node .
