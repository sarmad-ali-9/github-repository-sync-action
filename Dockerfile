FROM alpine:3.17

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | bash

RUN apk update && apk upgrade && \
    apk add --no-cache git openssh-client git-lfs && \
    echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

RUN git lfs install

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
