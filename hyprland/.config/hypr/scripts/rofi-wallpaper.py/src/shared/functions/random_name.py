import logging,string,random,os
log = logging.getLogger(name= __name__)

def random_name(lenght:int = 25):
    '''
    Produce a random string of `lenght` characters
    '''
    alphabet = string.ascii_lowercase
    out = "".join(
        random.choice(alphabet) for i in range(lenght)
    )

    log.debug(f"{random_name.__name__}: {out}")
    return out
