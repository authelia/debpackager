#!/usr/bin/env bash
set -u

REPOSITORY="authelia/debpackager"
TAG="latest"

cat << EOF
steps:
  - label: ":docker: Build and Deploy"
    command: "docker build --tag ${REPOSITORY}:${TAG} --platform linux/amd64,linux/arm/v7,linux/arm64 --provenance mode=max,reproducible=true --sbom true --builder buildx --progress plain --pull --push ."
    concurrency: 1
    concurrency_group: "debpackager-deployments"
    agents:
      upload: "fast"

  - wait

  - label: ":docker: Update README.md"
    command: "curl \"https://ci.nerv.com.au/readmesync/update?github_repo=${REPOSITORY}&dockerhub_repo=${REPOSITORY}\""
    agents:
      upload: "fast"
EOF