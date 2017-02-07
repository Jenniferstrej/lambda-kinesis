#!/bin/bash
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt

zip -9 figshare-worker.zip

cd $VIRTUAL_ENV/lib/python2.7/site-packages

zip -r9 figshare-worker.zip

cd $VIRTUAL_ENV/..

zip -g figshare-worker.zip figshare-worker.py


