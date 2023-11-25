#!/bin/bash

source ./vars

echo "--- db branch start: ----------------------"
if ! [ -d "${DB_PATH}" ] || ! [ -d ${DB_CFG_PATH} ]
then
	echo "Invalid folder structure. Job is impossible, sorry."
	echo "-------------------------------------------"
	set -e	# set error code;
	exit 1	# exit with error code unless data folder not exist;
fi
# test folder must be empty:
if ! [ -z "$(sudo ls -A ${DB_PATH})" ]; then
	echo "Db data folder is not empty. Job is impossible, sorry."
	echo "-------------------------------------------"
	exit 1
fi

# you must to edit pg_hba.conf file for permitted access networks;
sudo cp ./pg_hba.conf ${DB_CFG_PATH}
sudo chown -R nobody:nobody "${DB_CFG_PATH}/pg_hba.conf"
sudo chmod a+r "${DB_CFG_PATH}/pg_hba.conf"

sudo docker pull postgres

# create database:
echo "--- try to create data base ---------------"

sudo docker run -d --rm --name ${DB_CONT_NAME} \
-p 5432:5432 \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_DB=postgres \
-v ${DB_PATH}:/var/lib/postgresql/data \
postgres

echo "--- wait to start db container... ---------"
sleep 7
echo "--- try to create: DB:${DB_NAME} USER:${DB_USER}"
sudo docker exec -i ${DB_CONT_NAME} su -c "psql -d postgres -U postgres  <<- EOSQL
CREATE USER ${DB_USER};
CREATE DATABASE ${DB_NAME};
GRANT ALL PRIVILEGES ON DATABASE ${DB_NAME} TO ${DB_USER};
ALTER USER ${DB_USER} PASSWORD '${DB_PSW}';
EOSQL" postgres

sudo docker stop ${DB_CONT_NAME}
sudo docker wait ${DB_CONT_NAME}
echo "--- db branch finished --------------------"
exit 0

