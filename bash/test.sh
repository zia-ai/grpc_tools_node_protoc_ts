#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
cd ${BASEDIR}/../

PROTO_DEST=./proto

mkdir -p ${PROTO_DEST}

grpc_tools_node_protoc \
--js_out=import_style=commonjs,binary:${PROTO_DEST} \
--grpc_out=${PROTO_DEST} \
--plugin=protoc-gen-grpc=`which grpc_tools_node_protoc_plugin` \
-I ./proto \
proto/*.proto

protoc \
--plugin=protoc-gen-ts=./bin/protoc-gen-ts \
--ts_out=${PROTO_DEST} \
-I ./proto \
proto/*.proto