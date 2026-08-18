#!/usr/bin/env bash
set -euo pipefail

curl -s https://fluxcd.io/install.sh | sudo bash

export GITHUB_TOKEN=<PAT>
export GITHUB_USER=<your-github-user>

flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=infra-repository \
  --branch=main \
  --path=clusters/prod \
  --personal
