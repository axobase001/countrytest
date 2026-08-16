#!/usr/bin/env bash
set -euo pipefail
python3 --version
python3 -m pip --version
mkdir -p out
printf 'python+pip passed\n' > out/index.html
