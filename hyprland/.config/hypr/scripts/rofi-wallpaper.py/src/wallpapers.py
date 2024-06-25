import logging
import os
import re
log = logging.getLogger(__name__)

def wallpapers(directory:str):
    log.debug(f"{directory= }")

    valid_formats = (".jpg$",".jpeg$",".png$",".webp$")

    files = os.listdir(path=directory)
    valid_formats_re = "|".join(valid_formats)
    wallpapers = [file for file in files if re.search(valid_formats_re,file)]

    log.debug(f"{wallpapers= }")
    return wallpapers
    # for file in os.listdir(path=directory):
    #     for vformat in valid_formats:
    #         if vformat in file:
    #             images += path 
