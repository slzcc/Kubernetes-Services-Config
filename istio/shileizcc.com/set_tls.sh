#!/bin/bash


kubectl create secret tls shileizcc-certs --key domain.key --cert chained.pem -n istio-system

kubectl create secret tls istio-ingressgateway-certs --key domain.key --cert chained.pem -n istio-system
