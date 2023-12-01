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
echo "--- init branch start: --------------------"
if ! [ -d ${BASE_PATH} ]
then
	sudo mkdir ${BASE_PATH}
	echo "${BASE_PATH} was created."
else
	echo "${BASE_PATH} exists."
fi

if ! [ -d "${VENV_PATH}" ]
then
	sudo mkdir "${VENV_PATH}"
	echo "${VENV_PATH} was created."
else
	echo "${VENV_PATH} exists."
fi

if ! [ -d "${PRJ_PATH}" ]
then
	sudo mkdir "${PRJ_PATH}"
	echo "${PRJ_PATH} was created."
else
	echo "${PRJ_PATH} exists."
fi

if ! [ -d "${DOCKER_CFG_PATH}" ]
then
	sudo mkdir "${DOCKER_CFG_PATH}"
	echo "${DOCKER_CFG_PATH} was created."
else
	echo "${DOCKER_CFG_PATH} exists."
fi

# --- nginx: ------------------------------
if ! [ -d "${NGINX_CFG_PATH}" ]
then
	sudo mkdir "${NGINX_CFG_PATH}"
	echo "${NGINX_CFG_PATH} was created."
else
	echo "${NGINX_CFG_PATH} exists."
fi

# --- data base: --------------------------
if ! [ -d "${DB_PATH}" ]
then
	sudo mkdir "${DB_PATH}"
	echo "${DB_PATH} was created."
else
	echo "${DB_PATH} exists."
fi

if ! [ -d "${DB_CFG_PATH}" ]
then
	sudo mkdir "${DB_CFG_PATH}"
	echo "${DB_CFG_PATH} was created."
else
	echo "${DB_CFG_PATH} exists."
fi

# --- set access mode for all folders: ----

sudo chown -R nobody:nobody ${BASE_PATH}
sudo chmod -R a+rw ${BASE_PATH}
echo "access granted."
echo "--- init branch finished ------------------"

