#!/bin/bash
service_type=$1
if [ -z "$service_type" ];then
    echo "service_type is null. can be 'frpc' or 'frps'"
    exit 1
fi

echo "service_type is $service_type"

dst_dir="/usr/local/frp"
mkdir -p $dst_dir

sudo cp -rf $service_type $dst_dir

cp -f $service_type/$service_type.service /etc/systemd/system
systemctl daemon-reload
systemctl enable $service_type
systemctl start $service_type
