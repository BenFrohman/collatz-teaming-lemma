#!/usr/bin/env python3
"""Scan every tracked .lean file (comments and strings stripped) for sorry, admit,
native_decide and axiom declarations.  Also scan any lake build logs passed as
arguments for sorry / admit / native_decide (full log, no skip list).
Prints each hit; exits 1 if any are found."""
import re, subprocess, sys

def strip(s):
    out = []; i = 0; d = 0
    while i < len(s):
        if s.startswith('/-', i): d += 1; i += 2; continue
        if d and s.startswith('-/', i): d -= 1; i += 2; continue
        if d: i += 1; continue
        if s.startswith('--', i):
            j = s.find('\n', i); i = len(s) if j < 0 else j; continue
        if s[i] == '"':
            j = i + 1
            while j < len(s) and s[j] != '"': j += 2 if s[j] == '\\' else 1
            out.append('""'); i = j + 1; continue
        out.append(s[i]); i += 1
    return ''.join(out)

files = subprocess.check_output(['git', 'ls-files', '*.lean']).decode().split()
bad = []
for f in files:
    for n, l in enumerate(strip(open(f, encoding='utf-8').read()).split('\n'), 1):
        if re.search(r'\b(sorry|admit|native_decide)\b', l) or re.match(r'\s*(@\[[^\]]*\]\s*)?((private|protected|noncomputable|public|unsafe)\s+)*axiom\s', l):
            bad.append(f'{f}:{n}: {l.strip()}')
print(f'Scanned {len(files)} tracked .lean files for sorry / admit / native_decide / axiom declarations (comments and strings ignored).')

token = re.compile(r'\b(sorry|admit|native_decide)\b')
logs = sys.argv[1:]
for log in logs:
    text = open(log, encoding='utf-8', errors='replace').read().splitlines()
    print(f'Scanned lake build log {log} ({len(text)} lines) for sorry / admit / native_decide (no skip list).')
    for n, l in enumerate(text, 1):
        if token.search(l):
            bad.append(f'{log}:{n}: {l.strip()}')

print('\n'.join(bad) if bad else 'RESULT: 0 hits')
sys.exit(1 if bad else 0)
