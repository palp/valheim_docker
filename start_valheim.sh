#!/bin/bash
mkdir -p "${STEAMAPPDIR}" || true

bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous \
        +force_install_dir "${STEAMAPPDIR}" \
        +app_update "${STEAMAPPID}" validate \
        +exit

cd ${STEAMAPPDIR}

${STEAMAPPDIR}/valheim_server.x86_64 -name $SERVER_NAME -port 2456 -nographics -batchmode -world $WORLD_NAME -password $SERVER_PASSWORD
