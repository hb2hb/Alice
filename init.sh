#!/bin/bash

source vars

if ! [ -f ${BASE_PATH} ]
then
	sudo mkdir ${BASE_PATH}
fi

if ! [ -f "${DB_PATH}" ]
then
	sudo mkdir "${DB_PATH}"
fi

if ! [ -f "${VENV_PATH}" ]
then
	sudo mkdir "${VENV_PATH}"
fi

if ! [ -f "${APP_PATH}" ]
then
	sudo mkdir "${APP_PATH}"
fi

sudo chmod -R a+rw ${BASE_PATH}
