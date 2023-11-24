#!/bin/bash

source ./vars

if ! [ -d "${PG_DB_PATH}" ] || ! [ -d ${PG_CFG_PATH} ]
then
	echo "Invalid folder structure. Job is impossible, sorry."
	set -e	# set error code;
	exit 1	# exit with error code unless data folder not exist;
fi

# you must to edit pg_hba.conf file for permitted access networks;
su cp ./pg_hba.conf ${PG_CFG_PATH}
sudo chmod a+r -R ${PG_CFG_PATH}

sudo docker pull postgres

# cat << "END1" | sudo docker run -d -i --rm --name ${PG_CONT_NAME} --ip ${PG_IP} -p 5432:5432 \
#     -e POSTGRES_PASSWORD=${PG_PSW} \
#     -v ${PG_DB_PATH}:/var/lib/postgresql/data \
#     postgres
#     initdb
#END1

# sudo docker stop ${PG_CONT_NAME}

sudo docker run -d --rm --name ${PG_CONT_NAME} --ip ${PG_IP} -p 5432:5432 \
     -e POSTGRES_PASSWORD=${PG_PSW} \
     -e PGPASSWORD=${PG_PSW} \
     -v ${PG_DB_PATH}:/var/lib/postgresql/data \
     -v ${PG_CFG_PATH}/pg_hba.conf:/var/lib/postgresql/data/pg_hba.conf \
     postgres

# sudo docker exec ${PG_CONT_NAME} cat /var/lib/postgresql/data/pg_hba.conf

sudo docker exec ${PG_CONT_NAME} psql -d ${PG_DB_NAME} -U ${PG_USER}  <<- EOSQL
SELECT VERSION();
EOSQL

#psql << EOSQL2
#CREATE DATABASE ${PG_DB_NAME};
#CREATE USER ${PG_USER};
#GRANT ALL PRIVILEGES ON DATABASE ${PG_DB_NAME} TO ${PG_USER};
#ALTER USER ${PG_USER} PASSWORD '${PG_PSW}';
#EOSQL2
#END2

sudo docker stop ${PG_CONT_NAME}



