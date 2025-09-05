#!/bin/bash
VERSION=6.1.2

OS_TYPE=$(uname)

if [ "$OS_TYPE" == "Linux" ];then
    sed -ri "s#(.*)/v.*/tsetup.*.tar.xz(.*)#\1/v${VERSION}/tsetup.${VERSION}.tar.xz\2#g" Dockerfile
elif [ "$OS_TYPE" == "Darwin" ];then
    sed -i '' -E "s#(.*)/v.*/tsetup.*.tar.xz(.*)#\1/v${VERSION}/tsetup.${VERSION}.tar.xz\2#g" Dockerfile
else
    echo "This is an unsupported operating system"
    exit 1
fi


#docker build -t sassv/telegram:$VERSION .

#docker build -t sassv/telegram:latest .

#docker push sassv/telegram:$VERSION
#docker push sassv/telegram:latest
