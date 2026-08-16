#!/usr/bin/env bash
set -euo pipefail
rm -rf out
python3 -m pip install --disable-pip-version-check -q requests numpy pandas scipy pyarrow 'honest-backtest[parquet]==0.2.0'
python3 - <<'PY'
import requests,numpy,pandas,scipy,pyarrow
import honest_backtest
print('stack ok')
PY
mkdir -p out
printf 'scientific stack passed\n' > out/index.html
