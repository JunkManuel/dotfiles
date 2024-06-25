import logging,subprocess
log = logging.getLogger(__name__)

def __run(args:list or str,daemon:bool = False):
    if daemon:
        subprocess.Popen(
            args, 
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )
        return

    log.debug(f"{args= }")
    out = subprocess.run(
        args= args,
        universal_newlines=True,
        capture_output=True
    )

    error= bool(out.returncode)
    if error:
        log.error(f"{out.args= }")
        log.error(f"{out.returncode= }")
        log.error(f"{out.stderr}")
        # log.error(f"{out= }")
    else: log.debug(f"{out= }")

    return out
