#!/usr/bin/env bash
set -euo pipefail
git rev-parse --is-inside-work-tree
git remote -v
git push --dry-run origin HEAD:refs/heads/vercel-writeback-probe
mkdir -p out
printf 'git writeback dry-run succeeded\n' > out/index.html
