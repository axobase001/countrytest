#!/usr/bin/env bash
set -euo pipefail
rm -rf out .venv
python3 -m venv .venv
. .venv/bin/activate
python -m pip install --disable-pip-version-check -q --upgrade pip
python -m pip install --disable-pip-version-check -q requests numpy pandas scipy pyarrow 'honest-backtest[parquet]==0.2.0'
python - <<'PY'
import requests,numpy,pandas,scipy,pyarrow,honest_backtest
print('stack ok')
PY
mkdir -p out
printf 'venv scientific stack passed\n' > out/index.html
