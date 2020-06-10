#!/bin/bash

##################################################################
# Function: pull images from aliyun before installing kubernetes
# Usage: bash images_prepull.sh
# Create Day: 2020-06-10
# Modify Time: 
# Author: echohelloyang@gmail.com 
# Github: https://github.com/PoplarYang
# Version: v1
##################################################################

images=(
    kube-apiserver:v1.12.1
    kube-controller-manager:v1.12.1
    kube-scheduler:v1.12.1
    kube-proxy:v1.12.1
    pause:3.1
    etcd:3.2.24
    coredns:1.2.2
)

for imageName in ${images[@]} ; do
    docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
    docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
    docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
done
