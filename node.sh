#!/bin/sh

if ! [ -z "$PW" ] && ! [ -z "$USER_NAME" ] && ! [ -z "$EMAIL" ]; then

  echo "###################################################"
  echo "# Found eccenca credentials! Created .npmrc file. #"
  echo "###################################################"

  touch $HOME_DIR/.npmrc

  echo "registry=https://artifactory.eccenca.com/api/npm/npm/" >> $HOME_DIR/.npmrc
  echo "//artifactory.eccenca.com/api/npm/npm/:_password=$PW" >> $HOME_DIR/.npmrc
  echo "//artifactory.eccenca.com/api/npm/npm/:username=$USER_NAME" >> $HOME_DIR/.npmrc
  echo "//artifactory.eccenca.com/api/npm/npm/:email=$EMAIL" >> $HOME_DIR/.npmrc
  echo "//artifactory.eccenca.com/api/npm/npm/:always-auth=true" >> $HOME_DIR/.npmrc
fi

cd $PROJECT

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

  cp ../config.js ./
  cp ../gulpfile.js ./
  cp ../package.json ./
  cp ../webpack.config.js ./

  mkdir dist
  cp ../index.html ./dist/
  mkdir src
  mkdir src/components
  mkdir src/stores

  touch src/App.jsx
  cp ../.eslintrc ./src/

  npm install
fi

npm start
