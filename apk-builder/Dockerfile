FROM alpine:edge

RUN apk update \
    && apk add --no-cache alpine-sdk doas

ENV USER=builder

RUN adduser -G abuild -s /bin/sh -h /home/${USER} -S -D ${USER} \
    && echo "permit nopass ${USER}" >> /etc/doas.d/doas.conf \
    && mkdir -p /home/${USER}/packages/${USER} \
    && chown ${USER}:abuild /home/${USER}/packages /home/${USER}/packages/${USER}

USER ${USER}
WORKDIR /home/${USER}/apk

CMD [ "sh", "-c", "abuild-keygen -naiq && abuild -r" ]
