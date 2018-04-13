FROM node:9

MAINTAINER Simeon Ackermann <simeon.ackermann.1@stud.htwk-leipzig.de>

# install webpack gobally
RUN npm install -g webpack \
    webpack-cli \
    webpack-dev-server

# app directory
WORKDIR /usr/src/app

# copy default boilerplate
COPY react-boilerplate/ /app

# copy startscript
COPY node.sh /node.sh

EXPOSE 8080

CMD [ "/node.sh" ]