FROM cm2network/steamcmd:root

ENV STEAMAPPID 896660
ENV STEAMAPP valheim
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}_server"
VOLUME ${STEAMAPPDIR}
COPY ./start_valheim.sh ${HOMEDIR}/start_valheim.sh
RUN set -x \
    	&& mkdir -p "${STEAMAPPDIR}" \
	&& { \
		echo '@ShutdownOnFailedCommand 1'; \
		echo '@NoPromptForPassword 1'; \
		echo 'login anonymous'; \
		echo 'force_install_dir '"${STEAMAPPDIR}"''; \
		echo 'app_update '"${STEAMAPPID}"''; \
		echo 'quit'; \
	   } > "${HOMEDIR}/${STEAMAPP}_update.txt" \
	&& chmod +x "${HOMEDIR}/start_valheim.sh" \
	&& chown -R "${USER}:${USER}" "${HOMEDIR}/start_valheim.sh" "${STEAMAPPDIR}" "${HOMEDIR}/${STEAMAPP}_update.txt"  

USER ${USER}
WORKDIR ${HOMEDIR}
ENTRYPOINT [ "bash", "start_valheim.sh" ]

EXPOSE 2456-2458/udp 
