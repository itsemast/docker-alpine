FROM alpine:edge

RUN apk update \
    && apk add --no-cache alpine-sdk sudo

ENV USER=builder

RUN adduser -G abuild -s /bin/sh -h /home/${USER} -S -D ${USER} \
    && echo "${USER} ALL=(ALL) ALL" > /etc/sudoers.d/${USER} \
    && echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER} \
    && mkdir -p /home/${USER}/packages/${USER} \
    && chown ${USER}:abuild /home/${USER}/packages /home/${USER}/packages/${USER}

USER ${USER}
WORKDIR /home/${USER}/apk

CMD [ "sh", "-c", "abuild-keygen -naiq && abuild -r" ]
