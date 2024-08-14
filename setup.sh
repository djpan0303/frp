#!/bin/bash
dst_dir="/usr/local/frp"
mkdir -p $dst_dir

service_type=$1

sudo cp -rf $service_type $dst_dir

cp -f $service_type/$service_type.service /etc/systemd/system
systemctl daemon-reload
systemctl enable $service_type
systemctl start $service_type
