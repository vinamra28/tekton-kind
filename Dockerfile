FROM golang:1.14.2-alpine

WORKDIR /kind

RUN apk add --no-cache \
  bash curl docker

# Install kubectl and make sure it's available in the PATH.
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /bin

RUN curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.10.0/kind-$(uname)-amd64" && chmod +x ./kind && mv ./kind /bin

