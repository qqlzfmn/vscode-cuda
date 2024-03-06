#!/bin/bash

torch=${1:-"2.2.1"}
cuda=${2:-"11.8"}
cudnn=${3:-"8"}

ubuntu_mirror="mirrors.bfsu.edu.cn"
pypi_mirror="https://mirrors.bfsu.edu.cn/pypi/web/simple/"

./build.sh $torch $cuda $cudnn $ubuntu_mirror $pypi_mirror

retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error occured building image."
    exit $retVal
fi

docker push sidecus/vscode-cuda:$tag
