#!/bin/bash

# We use requirements.txt instead of pipenv directly because we need to replace tensorflow-gpu
# with tensorflow, for web deployment.
pipenv lock --requirements --keep-outdated > api/requirements.txt
sed -i 's/-gpu//g' api/requirements.txt

docker build -t text_recognizer_api -f api/Dockerfile .
