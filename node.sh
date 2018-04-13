#!/bin/sh

cd /usr/src/app

if [ ! "$(ls -A ./)" ]; then
  echo "# Create new Project from Boilerplate"
  cp -a /app/. /usr/src/app/
fi

echo "# Install npm dependencies..."
npm install

echo "# Start webpack server..."
./node_modules/.bin/webpack-dev-server --config webpack.config.js --host 0.0.0.0 --port 8080 --mode development
