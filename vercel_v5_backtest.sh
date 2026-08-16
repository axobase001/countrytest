#!/usr/bin/env bash
set -euo pipefail
rm -rf src out
git --version
git clone --depth 1 --branch main-sequence-v5-symmetric-stop-1h-20260816 https://github.com/axobase001/test.git src
test -f src/main_sequence/v5_hourly_symmetric_stop.py
mkdir -p out
printf 'git clone passed\n' > out/index.html
