#!/usr/bin/env bash
set -eu

REPOSITORY="authelia/debpackager"

for ARCH in armhf arm64; do
cat << EOF
  - label: ":docker: Build and Deploy Image [${ARCH}]"
    commands:
      - "docker build -f Dockerfile.${ARCH} --tag ${REPOSITORY}:${ARCH} --no-cache=true --pull=true --push ."
    concurrency: 2
    concurrency_group: "debpackager-deployments"
    agents:
      upload: "fast"
EOF
done