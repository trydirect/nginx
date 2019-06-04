#!/usr/bin/env python
# -*- coding: utf-8 -*-

import time
import docker

client = docker.from_env()

# NGINX
nginx = client.containers.get('nginx')
nginx_cfg = nginx.exec_run("/usr/sbin/nginx -T")
assert nginx.status == 'running'
assert 'the configuration file /etc/nginx/nginx.conf syntax is ok' in nginx_cfg.output.decode()

# test restart
nginx.restart()
time.sleep(3)
assert nginx.status == 'running'
