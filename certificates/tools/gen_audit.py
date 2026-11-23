#!/usr/bin/env python3
"""Kernel-certificate helper: list this repository's built Lean modules and write
one Lean file per module that runs `collectAxioms` (the function behind
`#print axioms`) on every theorem declared in that module.

Modules are audited in isolation so files that share declaration names with
the root import (Derived, ParentRule, Scenes, TerrasDensity) are still
checked.  There is no skip list: every built module with an .olean is
audited and listed in MODULES.txt.

Usage: python3 certificates/tools/gen_audit.py OUT_DIR MODULES.txt
"""
import os, subprocess, sys

out_dir, modlist = sys.argv[1], sys.argv[2]
os.makedirs(out_dir, exist_ok=True)
files = subprocess.check_output(['git', 'ls-files', '*.lean']).decode().split()
roots = [next(r for r in ['.lake/build/lib/lean', '.lake/build/lib', 'build/lib'] if os.path.isdir(r))]
mods = []
for f in files:
    if f.startswith(('.lake/', 'lake-packages/')) or os.path.basename(f) in ('lakefile.lean',):
        continue
    rel = f[:-5]
    if any(os.path.exists(os.path.join(r, rel + '.olean')) for r in roots):
        mods.append(rel.replace('/', '.'))
mods.sort()
open(modlist, 'w').write('\n'.join(mods) + '\n')

def lean_name(m):
    return '.'.join('«' + p + '»' for p in m.split('.'))

for m in mods:
    path = os.path.join(out_dir, m + '.lean')
    open(path, 'w').write(f"""import Lean
import {lean_name(m)}

open Lean Elab Command

/-- Prints `#print axioms`-style lines for every theorem declared in this module. -/
elab "#kernel_certificate_audit" : command => do
  let env ← getEnv
  let mname : Name := `{lean_name(m)}
  match env.getModuleIdx? mname with
  | none => IO.println s!"MODULE NOT LOADED {{mname}}"
  | some i =>
    for n in (env.header.moduleData[i.toNat]!).constNames do
      match env.find? n with
      | some (.thmInfo _) =>
        if !n.isInternal then
          let ax ← collectAxioms n
          let axs := ", ".intercalate (ax.toList.map toString)
          if ax.isEmpty then IO.println s!"'{{n}}' does not depend on any axioms [module {{mname}}]"
          else IO.println s!"'{{n}}' depends on axioms: [{{axs}}] [module {{mname}}]"
      | _ => pure ()

#kernel_certificate_audit
""")
print(f'{len(mods)} modules')
