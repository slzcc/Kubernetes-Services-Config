#!/bin/bash
kubectl create secret generic kiali --from-literal=username=admin --from-literal=passphrase=admin -n istio-system