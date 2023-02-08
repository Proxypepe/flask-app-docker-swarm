#!/bin/bash

pod_name=$1
shell=$2

if [[ -z $shell ]]; then
	shell=/bin/bash
fi

minikube kubectl -- exec --stdin --tty "$pod_name" -- $shell
