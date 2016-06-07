FROM node:5

MAINTAINER Georges Alkhouri <georges.alkhouri@stud.htwk-leipzig.de> 

RUN apt-get update
RUN apt-get install -y nano

ENV TERM xterm

ENV HOME_DIR /usr/local/node
ENV PROJECT $HOME_DIR/project

ENV PW ""
ENV USER_NAME ""
ENV EMAIL ""

VOLUME $PROJECT

WORKDIR /usr/local/node

COPY node.sh /usr/local/node/node.sh

COPY gulpfile.js /usr/local/node/gulpfile.js
COPY webpack.config.js /usr/local/node/webpack.config.js

COPY .eslintrc /usr/local/node/.eslintrc
COPY index.html /usr/local/node/index.html
COPY package.json /usr/local/node/package.json

RUN npm -g install babel-core@6.9.0
RUN npm -g install babel-eslint@6.0.4
RUN npm -g install babel-loader@6.2.4
RUN npm -g install babel-preset-es2015@6.9.0
RUN npm -g install babel-preset-react@6.5.0
RUN npm -g install eslint@2.10.2
RUN npm -g install eslint-plugin-react@5.1.1
RUN npm -g install eslint-loader@1.3.0
RUN npm -g install gulp@3.9.1
RUN npm -g install gulp-babel@6.1.2
RUN npm -g install gulp-util@3.0.7
RUN npm -g install webpack@1.13.1
RUN npm -g install webpack-dev-server@1.14.1

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

CMD ["/usr/local/node/node.sh"]
