FROM itsemast/apk-builder:latest as mongo_apk_builder

ENV USER=builder

USER root

RUN echo '@testing https://dl-cdn.alpinelinux.org/alpine/edge/testing/' >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache py3-mongo@testing tcmalloc@testing

COPY /apk /home/${USER}/apk

RUN chown -R ${USER}:abuild /home/${USER}/apk

USER ${USER}

RUN abuild-keygen -naiq && abuild -r

FROM alpine:edge

COPY --from=mongo_apk_builder /home/builder/packages/builder /tmp/repo
COPY --from=mongo_apk_builder /etc/apk/keys /etc/apk/keys

RUN apk add --no-cache --repository /tmp/repo mongodb \
    && rm -rf /tmp/repo

ENTRYPOINT [ "mongod" ]
