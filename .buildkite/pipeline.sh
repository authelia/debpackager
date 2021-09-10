#!/usr/bin/env bash
set -u

REPOSITORY="authelia/debpackager"

cat << EOF
steps:
  - label: ":docker: Image Build and Deploys"
    command: ".buildkite/steps/buildanddeploy.sh | buildkite-agent pipeline upload"
    agents:
      upload: "fast"

  - wait

  - label: ":docker: Update README.md"
    command: "curl \"https://ci.nerv.com.au/readmesync/update?github_repo=${REPOSITORY}&dockerhub_repo=${REPOSITORY}\""
    agents:
      upload: "fast"
EOF