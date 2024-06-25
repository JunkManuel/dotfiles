# import subprocess
import logging
import src.shared.functions.__run as __run

log = logging.getLogger(name=__name__)

# def __run(args:list or str):
#     out = subprocess.run(
#         args= args,
#         universal_newlines=True,
#         capture_output=True
#     )
#     error= bool(out.returncode)
#     if error:
#         log.error(f"{outk.stderr}")
#         return None
#
#     return out

def refresh(process:str, daemon:str = None, daemon_opts:list = []):
    # Assert daemon as the process if not provided
    if daemon is None:
        daemon = process
    
    log.debug(f"{process= :<10}{daemon= :<10}")
    log.debug(f"{daemon_opts= }")

    # Build arguments
    args_pgrep = ["pgrep", process]
    args_pkill = ["pkill","-9", process]
    args_daemon = [daemon]
    args_daemon += daemon_opts

    pgrep = [str(arg) for arg in args_pgrep]
    pkill = [str(arg) for arg in args_pkill]
    daemon = [str(arg) for arg in args_daemon]

    code = __run(pgrep).returncode
    if code == 0:
        __run(pkill)
    __run(daemon,daemon=True)

    # try:
    #     __run(args_kill)
    # except RuntimeError:
    #     exit(1)
    # else:
    #     __run(args_daemon,background=True)
