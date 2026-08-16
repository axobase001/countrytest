#!/usr/bin/env bash
set +e
rm -rf out
mkdir -p out
{
  echo "DATE=$(date -u)"
  echo "PWD=$(pwd)"
  echo "VERCEL=$VERCEL"
  echo "VERCEL_ENV=$VERCEL_ENV"
  echo "VERCEL_PROJECT_PRODUCTION_URL=$VERCEL_PROJECT_PRODUCTION_URL"
  echo "--- python ---"
  which python3
  python3 --version
  python3 -m pip --version
  echo "--- git ---"
  which git
  git --version
  echo "--- curl github ---"
  curl -I -L --max-time 15 https://github.com/axobase001/test.git 2>&1 | head -30
  echo "--- disk ---"
  df -h .
} > out/diag.txt 2>&1
cp out/diag.txt out/index.html
exit 0
