#!/bin/bash
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt

zip -9 ~/figshare-worker.zip

cd $VIRTUAL_ENV
cd ..
mv ~/figshare-worker.zip figshare-worker.zip

zip -g figshare-worker.zip figshare-worker.py


