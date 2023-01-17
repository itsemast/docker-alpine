#!/bin/sh

docker login

docker pull alpine:edge

docker build -t itsemast/alpine-node:current node-current
docker push itsemast/alpine-node:current

docker build -t itsemast/alpine-node:current-slim node-current-slim
docker push itsemast/alpine-node:current-slim

docker build -t itsemast/alpine-node:lts node-lts
docker push itsemast/alpine-node:lts

docker build -t itsemast/alpine-node:lts-slim node-lts-slim
docker push itsemast/alpine-node:lts-slim

docker build -t itsemast/alpine-node:latest node-current
docker push itsemast/alpine-node:latest
