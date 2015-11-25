#!/bin/bash
USER=geisbruch
DOCKER="sudo docker"
ACT_PATH=$(pwd)
if [[ "$(uname)" == "Darwin" ]]; then
  DOCKER="docker"
fi
function build() {
  FOLDER=$1
  IMAGE=$2
  VERSION=$3
	cd $FOLDER
	echo "----------------------------------------"
	echo "Starting building process of: $IMAGE"
	echo "----------------------------------------"

	$DOCKER build -t $USER/$IMAGE:$VERSION .
	if [ $? -ne 0 ]; then
		exit $?
	fi

	$DOCKER push $USER/$IMAGE:$VERSION
	if [ $? -ne 0 ]; then
		exit $?
	fi
	echo " "
	cd $ACT_PATH

}

build java/8 java 8 
