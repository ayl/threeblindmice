#!/bin/sh

rails runner -e production MicroRnaMeta.loadFile

python/buildrna.py
python/buildrna.percent.change.py

rails runner -e production MicroRna.buildIndices

