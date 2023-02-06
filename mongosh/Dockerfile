FROM itsemast/apk-builder:3.16 as mongosh_apk_builder

ENV USER=builder

USER root

COPY /apk /home/${USER}/apk

RUN chown -R ${USER}:abuild /home/${USER}/apk

USER ${USER}

RUN abuild-keygen -naiq && abuild -r

FROM alpine:3.16

COPY --from=mongosh_apk_builder /home/builder/packages/builder /tmp/repo
COPY --from=mongosh_apk_builder /etc/apk/keys /etc/apk/keys

RUN apk add --no-cache --repository /tmp/repo mongosh \
    && rm -rf /tmp/repo

ENTRYPOINT [ "mongosh" ]
