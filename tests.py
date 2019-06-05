#!/usr/bin/env python
# -*- coding: utf-8 -*-

import docker
import time

client = docker.from_env()
time.sleep(10)

# NGINX
nginx = client.containers.get('nginx')
if 'running' not in nginx.status:
    print(nginx.logs())

assert nginx.status == 'running'

# test restart
nginx.restart()
time.sleep(3)
assert nginx.status == 'running'
