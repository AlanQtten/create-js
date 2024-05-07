#!/bin/bash

if [ -z "$1" ]; 
then
  echo "please give me a name of your project"
else 
  pnpm create vite $1 --template vanilla-ts
  cd $1
  rm -rf ./src
  pnpm install @types/node vitest eslint@8.56.0 eslint-config-airbnb@19 eslint-config-airbnb-typescript@18 eslint-config-prettier@9 eslint-plugin-prettier@5 -D
  cp $CREATE_JS_HOME/.eslintrc.cjs .eslintrc.cjs
  cp $CREATE_JS_HOME/tsconfig.eslint.json tsconfig.eslint.json
  cp $CREATE_JS_HOME/tsconfig.json tsconfig.json
  cp $CREATE_JS_HOME/vite.config.ts vite.config.ts
  cp $CREATE_JS_HOME/prettier.config.js prettier.config.js
  cp -r $CREATE_JS_HOME/src src
  node $CREATE_JS_HOME/script.js $PWD
  code ./
fi