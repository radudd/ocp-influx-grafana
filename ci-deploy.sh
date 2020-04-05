#!/bin/bash

oc patch grafanadashboard baby-room-current -p '{"spec": `cat grafana-dashboard.json`}"

openssl aes-256-cbc -K $encrypted_c25bfdc08df8_key -iv $encrypted_c25bfdc08df8_iv -in kubeconfig.enc -out kubeconfig -d
oc apply -f oc-grafana-dashboard.yaml --config=kubeconfig
