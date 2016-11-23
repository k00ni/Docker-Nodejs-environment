FROM node:5

MAINTAINER Georges Alkhouri <georges.alkhouri@stud.htwk-leipzig.de>

RUN apt-get update
RUN apt-get install -y nano

ENV TERM xterm

ENV APP_DIR /app

ENV PW ""
ENV USER_NAME ""
ENV EMAIL ""

VOLUME $APP_DIR

COPY node.sh node.sh

COPY gulpfile.js gulpfile.js
COPY webpack.config.js webpack.config.js

COPY .eslintrc .eslintrc
COPY index.html index.html
COPY package.json package.json

RUN npm -g install babel-core
RUN npm -g install babel-eslint
RUN npm -g install babel-loader
RUN npm -g install babel-preset-es2015
RUN npm -g install babel-preset-react
RUN npm -g install eslint
RUN npm -g install eslint-plugin-react
RUN npm -g install eslint-loader
RUN npm -g install gulp
RUN npm -g install gulp-babel
RUN npm -g install gulp-util
RUN npm -g install webpack
RUN npm -g install webpack-dev-server

RUN npm link babel-core
RUN npm link babel-eslint
RUN npm link babel-loader
RUN npm link babel-preset-es2015
RUN npm link babel-preset-react
RUN npm link eslint
RUN npm link eslint-plugin-react
RUN npm link eslint-loader
RUN npm link gulp
RUN npm link gulp-babel
RUN npm link gulp-util
RUN npm link webpack
RUN npm link webpack-dev-server

CMD ["/node.sh"]
