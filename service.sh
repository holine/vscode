#!/bin/sh env
cd /vscode
yarn watchd
yarn watch-webd
yarn web --host 0.0.0.0 --port 80
