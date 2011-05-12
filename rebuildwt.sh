#!/bin/sh

rails runner -e production WtMeta.loadFile

python/buildwt.py
python/buildwt.percent.change.py

rails runner -e production Wt.buildIndices
