#!/usr/bin/env python
# -*- coding: utf-8 -*-

import time
import docker

client = docker.from_env()

# NGINX
nginx = client.containers.get('nginx')
assert nginx.status == 'running'

# test restart
nginx.restart()
time.sleep(3)
assert nginx.status == 'running'
