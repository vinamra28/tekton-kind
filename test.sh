#!/bin/bash

# Based off https://github.com/kind-ci/examples

# standard bash error handling
set -o errexit;
set -o pipefail;
set -o nounset;
# debug commands
set -x;

# cleanup on exit (useful for running locally)
cleanup() {
    kind delete cluster || true
}
trap cleanup EXIT

main() {
  kind create cluster

  # Sample command, replace with your own command.
  kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
}

main 
