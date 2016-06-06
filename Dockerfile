FROM node:5

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

COPY .eslintrc /usr/local/node/.eslintrc
COPY node.sh /usr/local/node/node.sh
COPY config.js /usr/local/node/config.js
COPY gulpfile.js /usr/local/node/gulpfile.js
COPY package.json /usr/local/node/package.json
COPY webpack.config.js /usr/local/node/webpack.config.js
COPY index.html /usr/local/node/index.html

CMD ["/usr/local/node/node.sh"]
