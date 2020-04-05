#!/bin/bash

openssl aes-256-cbc -K $encrypted_c25bfdc08df8_key -iv $encrypted_c25bfdc08df8_iv -in kubeconfig.enc -out kubeconfig -d
oc patch grafanadashboard baby-room-current -p '{"spec": `cat grafana-dashboard.json`}"'  --config=kubeconfig
