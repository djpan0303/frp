#!/bin/bash
dst_dir="/usr/local/bin"

service_type=$1

sudo cp $service_type $dst_dir

cp -f $service_type/frpc.service /etc/systemd/system
systemctl daemon-reload
systemctl enable $service_type
systemctl start $service_type
