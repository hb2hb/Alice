#!/bin/bash

source vars

sudo docker run -d --rm --name ${DB_CONT_NAME} \
-p 5432:5432 \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_DB=postgres \
-v ${DB_PATH}:/var/lib/postgresql/data \
-v ${DB_CFG_PATH}/pg_hba.conf:/var/lib/postgresql/data/pg_hba.conf \
postgres

echo "--- wait to start db container... ---------"
sleep 7

echo "--- list of database: ---------------------"
sudo docker exec -i ${DB_CONT_NAME} su -c "psql -d postgres -U postgres  <<- EOSQL
\list
EOSQL" postgres

echo "--- list of data base users: ---------------"
sudo docker exec -i ${DB_CONT_NAME} su -c "psql -d postgres -U postgres  <<- EOSQL
\du
EOSQL" postgres

sudo docker stop ${DB_CONT_NAME}

