#!/bin/bash
dst_dir="/usr/local/bin/frp"

sudo mkdir -p $dst_dir && sudo chmod 777 $dst_dir
cp -f frpc $dst_dir
cp -f frpc.toml $dst_dir
cp -f frpc.service /etc/systemd/system
systemctl daemon-reload
systemctl enable frpc
systemctl start frpc
