BASE:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SHELL=/bin/sh

.PHONY: fullsetup

fullsetup:
	@echo "Setup cluster with rhoai"
	until oc apply -k 01-gpu-operators; do : ; done
	until oc apply -k 02-gpu-dashboard; do : ; done
	until oc apply -k 03-authorino-operator; do : ; done
	until oc apply -k 04-serverless-operator; do : ; done
	until oc apply -k 05-servicemesh-operator; do : ; done
	until oc apply -k 06-rhoai-operator; do : ; done
	until oc apply -k 07-serving-runtime; do : ; done

