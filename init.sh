#!/bin/bash
# -----------------------------------------
# project name: Alice
# created: 2023/11/15
# authors: H.B. & co.
# target: create folder structure and
# copy config files
# =========================================


source ./vars

# --- common vars: ------------------------
if ! [ -d ${BASE_PATH} ]
then
	sudo mkdir ${BASE_PATH}
	echo "${BASE_PATH} was created."
fi

if ! [ -d "${VENV_PATH}" ]
then
	sudo mkdir "${VENV_PATH}"
	echo "${VENV_PATH} was created."
fi

if ! [ -d "${APP_PATH}" ]
then
	sudo mkdir "${APP_PATH}"
	echo "${APP_PATH} was created."
fi

if ! [ -d "${DOCKER_CFG_PATH}" ]
then
	sudo mkdir "${DOCKER_CFG_PATH}"
	echo "${DOCKER_CFG_PATH} was created."
fi

# --- nginx: ------------------------------
if ! [ -d "${NGINX_CFG_PATH}" ]
then
	sudo mkdir "${NGINX_CFG_PATH}"
	echo "${NGINX_CFG_PATH} was created."
fi

# --- data base: --------------------------
if ! [ -d "${PG_DB_PATH}" ]
then
	sudo mkdir "${PG_DB_PATH}"
	echo "${PG_DB_PATH} was created."
fi

if ! [ -d "${PG_CFG_PATH}" ]
then
	sudo mkdir "${PG_CFG_PATH}"
	echo "${PG_CFG_PATH} was created."
fi

# --- set access mode for all folders: ----
sudo chmod -R a+rw ${BASE_PATH}
echo "access granted."

