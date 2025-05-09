#!/bin/bash
VERSION=5.15.0

TG=https://github.com/telegramdesktop/tdesktop/releases/download/v$VERSION/tsetup.${VERSION}.tar.xz

sed -r "s#https://github.com/telegramdesktop/tdesktop/releases/download.*tar.xz(.*)#$TG\1#g" Dockerfile

docker build -t sassv/telegram:$VERSION .

docker build -t sassv/telegram:latest .

docker push sassv/telegram:$VERSION
docker push sassv/telegram:latest
