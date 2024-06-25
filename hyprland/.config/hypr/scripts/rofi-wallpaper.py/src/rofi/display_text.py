#!/usr/bin/env  python3
import subprocess,logging
log = logging.getLogger(name=__name__)

def display_text(txt:str = "",rofi_args:list = []):
    args = ["rofi", "-markup"]
    args += ["-e", txt]
    args += rofi_args
    args = (str(arg) for arg in args)
    
    log.debug(f"{args= }")
    log.debug(f"{txt= }")
    out = subprocess.run(
        args,
        input=txt,
        stdout=subprocess.PIPE,
        universal_newlines=True
    )

    returncode = out.returncode

    if returncode == 0:
        code = 0
    if returncode == 1:
        code = -1
    if returncode > 9:
        code = returncode - 9
    else:
        code = -1

    log.debug(f"{code= }")
    return code
