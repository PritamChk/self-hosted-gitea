# Use the Alpine base image
FROM alpine:3.21.3 AS base

LABEL   author="Pritam Chakraborty" \
    date_created="06-MAR-2025" \
    container_type="gitea-app"\
    app_version="1.23.5" 

ARG VERSION=1.23.5

ENV VERSION=${VERSION} \
    APP_HEADER='Gitea:Github for Self' \
    GITEA_DOMAIN=localhost \
    GITEA_PORT=3000 \
    DBHOST=localhost \
    DBPORT=5432 \
    DBNAME=giteadb \
    DBUSER=giteadb \
    DBPASSWD=abcd1234 


RUN apk update && \
    apk add --no-cache shadow git envsubst postgresql-client

EXPOSE ${GITEA_PORT}

# create user for gitea
RUN addgroup -S gitea && \
    adduser -S -G gitea -h /gitea gitea


ADD https://dl.gitea.com/gitea/${VERSION}/gitea-${VERSION}-linux-amd64 /gitea/

WORKDIR /gitea

VOLUME [ "/gitea" ]
COPY . .
# ADD app.ini.template /gitea/


RUN cd /gitea && \
    chmod +x * && \
    mv gitea-${VERSION}-linux-amd64 giteabin && \
    chown -R gitea:gitea /gitea &&\
    chmod -R 755 /gitea


USER gitea
WORKDIR /gitea

# ENTRYPOINT [ "sleep", "600" ]
ENTRYPOINT [ "./entrypoint.sh" ]