#!/usr/bin/env bash
set -euo pipefail
python3 --version
python3 -m pip --version
git --version
curl -fsSIL --max-time 20 https://github.com/axobase001/test.git >/dev/null
python3 -m pip install --disable-pip-version-check -q requests numpy pandas scipy pyarrow 'honest-backtest[parquet]==0.2.0'
mkdir -p out
printf 'runtime prerequisites passed\n' > out/index.html
