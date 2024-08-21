#!/bin/bash

set -x

service_type=$1
if [ -z "$service_type" ];then
    echo "service_type is null. can be 'frpc' or 'frps'"
    exit 1
fi

echo "service_type is $service_type"

dst_dir="/usr/local/frp"
sudo mkdir -p $dst_dir

sudo cp -rf $service_type $dst_dir

cp -f $service_type/$service_type.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable $service_type
sudo systemctl start $service_type
