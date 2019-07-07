FROM mongo:4.1 as whirlpool-mongodb
MAINTAINER Rihan Pereira <rihen234@gmail.com>

ARG MONGO_INITDB_ROOT_USERNAME
ARG MONGO_INITDB_ROOT_PASSWORD

ARG WHIRLPOOL_MONGODB_CRAWLER_USERNAME
ARG WHIRLPOOL_MONGODB_CRAWLER_PWD

ARG WHIRLPOOL_MONGODB_WEBAPP_USERNAME
ARG WHIRLPOOL_MONGODB_WEBAPP_PWD

ENV MONGO_INITDB_ROOT_USERNAME ${MONGO_INITDB_ROOT_USERNAME}
ENV MONGO_INITDB_ROOT_PASSWORD ${MONGO_INITDB_ROOT_PASSWORD}

ENV WHIRLPOOL_MONGODB_CRAWLER_USERNAME ${WHIRLPOOL_MONGODB_CRAWLER_USERNAME}
ENV WHIRLPOOL_MONGODB_CRAWLER_PWD ${WHIRLPOOL_MONGODB_CRAWLER_PWD}

ENV WHIRLPOOL_MONGODB_WEBAPP_USERNAME ${WHIRLPOOL_MONGODB_WEBAPP_USERNAME}
ENV WHIRLPOOL_MONGODB_WEBAPP_PWD ${WHIRLPOOL_MONGODB_WEBAPP_PWD}

ADD ./scripts/create-secure-user.sh /docker-entrypoint-initdb.d/
