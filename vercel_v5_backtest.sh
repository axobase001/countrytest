#!/usr/bin/env bash
set -euo pipefail
mkdir -p out
python3 - <<'PY'
import time
now=time.time()
target=((int(now)//60)+1)*60+30
wait=max(0,target-now)
print('CAL_TARGET', target, 'WAIT', wait, flush=True)
time.sleep(wait)
PY
printf 'timing calibration complete\n' > out/index.html
