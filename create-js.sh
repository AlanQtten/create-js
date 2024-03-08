#!/bin/bash

if [ -z "$1" ]; 
then
  echo "please give me a name of your project"
else 
  pnpm create vite $1 --template vanilla-ts
  cd $1
  rm -rf ./src
  pnpm install @types/node vitest eslint eslint-config-airbnb eslint-config-airbnb-typescript eslint-config-prettier eslint-plugin-prettier -D
  cp $CREATE_JS_HOME/.eslintrc.cjs .eslintrc.cjs
  cp $CREATE_JS_HOME/tsconfig.eslint.json tsconfig.eslint.json
  cp $CREATE_JS_HOME/tsconfig.json tsconfig.json
  cp $CREATE_JS_HOME/vite.config.ts vite.config.ts
  cp $CREATE_JS_HOME/prettier.config.js prettier.config.js
  cp -r $CREATE_JS_HOME/src src
  code ./
fi