#!/bin/bash

torch=${1:-"2.2.1"}
cuda=${2:-"11.8"}
cudnn=${3:-"8"}

ubuntu_mirror=${4:-""}
pypi_mirror=${5:-""}

docker_username=${6:-"qqlzfmn"}

if [[ -n $ubuntu_mirror ]]; then
    prefix="cn-"
fi

tag=${prefix}torch${torch}-cuda${cuda}-cudnn${cudnn}-devel
echo Buliding image with tag: $tag

docker build \
    -t ${docker_username}/vscode-cuda:$tag \
    --build-arg TORCH_VERSION=$torch \
    --build-arg CUDA_VERSION=$cuda \
    --build-arg CUDNN_VERSION=$cudnn \
    --build-arg UBUNTU_MIRROR="$ubuntu_mirror" \
    --build-arg PYPI_MIRROR="$pypi_mirror" \
    .

echo Successfully built image: ${docker_username}/vscode-cuda:$tag