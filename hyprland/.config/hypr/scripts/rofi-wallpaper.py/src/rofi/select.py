import subprocess,logging,os
log = logging.getLogger(name=__name__)

def select(prompt:str, options:list, rofi_args:list = [], fuzzy:bool = True):
    options_str = "\n".join(option.replace("\n", " ") for option in options)
    
    args = ["rofi", "-markup"]
    if fuzzy:
        args += ["-matching", "fuzzy"]
    args += ["-dmenu", "-p", prompt, "-i"]
    args += rofi_args
    args += [str(arg) for arg in args]

    log.debug(f"{args= }")
    log.debug(f"{options= }")
    out = subprocess.run(
        args, input=options_str, universal_newlines=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
    )
    tee = subprocess.run(
            ["tee", f"{os.path.dirname(os.path.realpath(__file__))}/../../.logs/{__name__}.log"],
            universal_newlines=True,
            input= out.stderr,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
    )

    returncode = out.returncode
    stdout = out.stdout.strip()
    selected = stdout.strip()


    try:
        options = [opt.strip() for opt in options]
        index = [selected in opt for opt in options].index(True)
    except ValueError:
        log.error(f"{selected} is not an option")
        index = -1

    if returncode == 0:
        code = 0
    if returncode == 1:
        code = -1
    if returncode > 9:
        code = returncode - 9
    else:
        code = -1

    log.debug(f"{code= :<10}{index= :<10}")
    log.debug(f"{selected= }")
    return code, index, selected
