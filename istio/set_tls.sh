#!/bin/bash

kubectl label namespace default istio-injection=enabled
#kubectl create secret tls istio-ingressgateway-certs --key domain.key --cert chained.pem -n istio-system
kubectl create secret tls shileizcc-tls --key domain.key --cert chained.pem -n istio-system
kubectl edit svc -n istio-system istio-ingressgateway