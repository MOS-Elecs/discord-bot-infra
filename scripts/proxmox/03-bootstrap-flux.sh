#!/usr/bin/env bash
set -euo pipefail

curl -s https://fluxcd.io/install.sh | sudo bash

# 実行前に以下を環境変数としてexportしておく
#   export GITHUB_TOKEN=<GitHubのPersonal Access Token>
#   export GITHUB_USER=MOS-Elecs

flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=discord-bot-infra \
  --branch=main \
  --path=clusters/prod \
  --components-extra=image-reflector-controller,image-automation-controller
