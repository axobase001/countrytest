#!/usr/bin/env bash
set -euo pipefail
rm -rf src state_3m out
mkdir -p out
python3 -m pip install --disable-pip-version-check -q 'honest-backtest[parquet]==0.2.0' requests scipy pandas pyarrow numpy
git clone --depth 1 --branch main-sequence-v5-symmetric-stop-1h-20260816 https://github.com/axobase001/test.git src
cd src
python3 -m py_compile main_sequence/v5_hourly_symmetric_stop.py
python3 main_sequence/v5_hourly_symmetric_stop.py score --start 2026-05-15 --end 2026-08-15 --out ../state_3m --workers 20
python3 - <<'PY'
import json
from pathlib import Path
import pandas as pd
from main_sequence.v5_hourly_symmetric_stop import simulate_window, PROTOCOL
state = pd.read_csv('../state_3m/state_rows.csv')
inv = pd.read_csv('../state_3m/inventory.csv')
r = simulate_window(state, inv, '2026-05-15', '2026-08-15')
r['protocol_name'] = PROTOCOL['name']
r['source_branch'] = 'main-sequence-v5-symmetric-stop-1h-20260816'
r['vercel_compute'] = True
Path('../out/result.json').write_text(json.dumps(r, indent=2, default=str))
Path('../out/index.html').write_text('<pre id="r"></pre><script>fetch("/result.json").then(x=>x.json()).then(x=>r.textContent=JSON.stringify(x,null,2))</script>')
print(json.dumps(r, indent=2, default=str))
PY
