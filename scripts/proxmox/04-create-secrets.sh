#!/usr/bin/env bash
set -euo pipefail

kubectl create namespace bot --dry-run=client -o yaml | kubectl apply -f -

kubectl create secret generic discord-bot-secret \
  --namespace bot \
  --from-literal=DISCORD_TOKEN="${DISCORD_TOKEN:?環境変数DISCORD_TOKENを設定してください}" \
  --dry-run=client -o yaml | kubectl apply -f -
