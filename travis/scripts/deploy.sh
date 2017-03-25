#!/bin/bash
set -e

BUILD_DIR=$1
BUILD_TAG=$2

echo $BUILD_DIR
echo $BUILD_TAG

cd $BUILD_DIR

java -version
./mvnw -version
node --version

cd $BUILD_DIR/jdl/io.github.jhipster.jdl.vscode 
npm install && vsce package