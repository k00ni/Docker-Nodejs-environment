#!/bin/sh

if [ -f $CONFIG_DIR/.npmrc ]; then

  echo "######################"
  echo "# Found .npmrc file. #"
  echo "######################"

  cp $CONFIG_DIR/.npmrc $HOME
  
fi

cd $APP_DIR

if [ "$(ls -A ./)" ]; then
  echo "#################################"
  echo "# Already bootstrapped project. #"
  echo "#################################"

  if [ ! -d "./node_modules" ]; then
    echo "##############################################"
    echo "# Could not find node modules. Installing... #"
    echo "##############################################"

    npm install
  fi

else

  cp /gulpfile.js ./
  cp /webpack.config.js ./
  cp /package.json ./

  mkdir dist
  cp /index.html ./dist/
  mkdir src
  mkdir src/components
  mkdir src/stores

  touch src/App.js
  cp /.eslintrc ./src/

  npm install
fi

webpack-dev-server --config webpack.config.js --host 0.0.0.0 --port 8080 --watch-poll 1000 --content-base ./dist
