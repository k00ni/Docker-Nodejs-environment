# Getting started

## Pull and run

You can pull from Docker hub and get this going with only a few steps.

Pull it:

    docker pull k00ni/docker-nodejs-environment

To start the environment, execute:

    docker run -v /path/to/local/project/folder:/usr/src/app -p 8080:8080 k00ni/docker-nodejs-environment

An existing Webpack-NPM project can be mounted, if the `webpack.config.js` and `package.json` are already created.

## Build and run yourself

To build this container execute:

    docker build -t docker-nodejs-environment .

and run with a mounted **empty** folder to start a new project:

    docker run -v $PWD/your-project:/usr/src/app -p 8080:8080 docker-nodejs-environment

An existing Webpack-NPM project can be mounted, if the `webpack.config.js` and `package.json` are already created.

### Docker Compose

You can also setup your container with Docker Compose and the corresponding `docker-compose.yml` YAML file. See the provided Docker Compose file in the repository for example.

To build the container use the following command:

```
docker-compose build
```

and to start the container use:

```
docker-compose up
```

# Start a new project

After starting your Docker container the mounted folder contains some new config files for NPM, Webpack etc., the index HTML file `./dist/index.html` and the main Javascript file `./src/index.js`.

Open your browser and go to `http://localhost:8080/` should show the static text 'NodeJS-NPM-ECMA6-Stack running. :)' from index.html. To start coding open the App.jsx file and write e.g.:

```
import React from 'react';
import ReactDOM from 'react-dom';

ReactDOM.render(
  <h1>Hello, world!</h1>,
  document.getElementById('react')
);

```

(with empty newline at the end) and save the file. You should see the recompiling process in the console and an automatic reload of the browser because of the hot pulling function of Webpack.

Read the [ReactJS Tutorial](https://facebook.github.io/react/docs/tutorial.html) to learn more.


# Default Components

* Node.js - JavaScript-based platform for server-side applications
* NPM - JavaScript package manager
* Webpack - Module bundler
* RectJS - JavaScript library for building user interfaces
* ECMA6, Babel - Next generation JavaScript
