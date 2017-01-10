FROM node:5

MAINTAINER Georges Alkhouri <georges.alkhouri@stud.htwk-leipzig.de>

RUN apt-get update
RUN apt-get install -y nano

ENV TERM xterm

ENV APP_DIR /app
ENV CONFIG_DIR /config

ENV PW ""
ENV USER_NAME ""
ENV EMAIL ""

VOLUME $APP_DIR
VOLUME $CONFIG_DIR

COPY node.sh node.sh

COPY gulpfile.js gulpfile.js
COPY webpack.config.js webpack.config.js

COPY .eslintrc .eslintrc
COPY index.html index.html
COPY package.json package.json

RUN npm -g install babel-core \
    babel-eslint \
    babel-eslint \
    babel-loader \
    babel-preset-es2015 \
    babel-preset-react \
    eslint \
    eslint-plugin-react \
    eslint-loader \
    gulp \
    gulp-babel \
    gulp-util \
    webpack \
    webpack-dev-server

RUN npm link babel-core \
    babel-eslint \
    babel-loader \
    babel-preset-es2015 \
    babel-preset-react \
    eslint \
    eslint-plugin-react \
    eslint-loader \
    gulp \
    gulp-babel \
    gulp-util \
    webpack \
    webpack-dev-server

CMD ["/node.sh"]
