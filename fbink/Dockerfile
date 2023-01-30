FROM itsemast/apk-builder:latest as fbink_apk_builder

ENV USER=builder

COPY /apk /home/${USER}/apk

RUN doas chown -R ${USER}:abuild ~/apk
RUN abuild-keygen -naiq && abuild -r

FROM alpine:edge

COPY --from=fbink_apk_builder /home/builder/packages/builder /tmp/repo
COPY --from=fbink_apk_builder /etc/apk/keys /etc/apk/keys

RUN apk add --repository /tmp/repo fbink \
    && rm -rf /tmp/repo

ENTRYPOINT [ "fbink" ]
