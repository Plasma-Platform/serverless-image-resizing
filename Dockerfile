FROM  node:8.10

ADD etc/nodesource.gpg.key /etc

WORKDIR /tmp

RUN npm install -g npm@latest && \
    npm cache clean --force

WORKDIR /build
