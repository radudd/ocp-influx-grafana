#!/bin/bash
set -x

# Generate OCP manifest
pip3 install requirements.txt 
python3 ci-deploy-gen-manifest.py

# Decrypt kubeconfig
openssl aes-256-cbc -K $encrypted_c25bfdc08df8_key -iv $encrypted_c25bfdc08df8_iv -in kubeconfig.enc -out kubeconfig -d

# Update manifest
oc apply -f grafana.json --config=kubeconfig
