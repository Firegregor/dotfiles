import sys
import subprocess

def copy2clip(txt):
    cmd='echo '+txt.strip()+'|clip'
    return subprocess.check_call(cmd, shell=True)

if len(sys.argv) == 2:
    s = sys.argv[1].split("\\")
    if ":" in s[0]:
        s = ["", s[0][:-1], *s[1:]]
    for i, part in enumerate(s):
        if " " in part:
            s[i] = "\\ ".join(part.split())
    tmp = "/".join(s)
    print(tmp)
    copy2clip(tmp)
