#!/usr/bin/env python3

##################################################
###########    START of Template     #############
##################################################

#Help pages:
#   argparse -> https://docs.python.org/es/3/library/argparse.html
#   sys -> https://docs.python.org/es/3/library/sys.html
#   os -> https://docs.python.org/es/3/library/os.html
#   logging -> https://docs.python.org/es/3/library/logging.html

import os,sys,argparse,logging
import src.shared.functions as f

parser = argparse.ArgumentParser (
    prog= "rofi-wallapaper",
    description= "shows an interactiave menu to select a wallpaper and apply a colorscheme based on that wallpaper",
    epilog= "si lees esto sos jei"
)

parser.add_argument(
    '-d', '--directory',
    help="wallpapers dir: Overriden by ($WALLPAPER_DIR)",
    required=False
)
parser.add_argument(
    '-t','--theme',
    help="rofi theme",
    required=False
)

group_loglvl = parser.add_mutually_exclusive_group()
group_loglvl.add_argument(
    '-v', '--verbose',                  # on/off flag
    action='store_true'
)
group_loglvl.add_argument(
    '-q', '--quiet',
    action='store_true'
)


args = parser.parse_args()
# args.filename, args.count, args.verbose

log_level= logging.INFO
if args.verbose:
    log_level= logging.DEBUG
if args.quiet:
    log_level= logging.FATAL

logging.basicConfig(
    # format="%(asctime)s [%(levelname)s] %(msg)s",
    format="({asctime}) {name:<30} [{levelname:>8}] --- {message}",
    style="{",
    datefmt="%Y-%m-%d %H:%M:%S",
    handlers=[
        # handlers.RotatingFileHandler(
        #     'app/logs/run.log',
        #     maxBytes=10*1024*1024,
        #     backupCount=10
        # ),
        logging.StreamHandler(stream=sys.stdout)
    ],
    level=log_level
)

log = logging.getLogger(name=__name__)

##################################################
###########     END of Template      #############
##################################################

import random
import src.rofi as rofi
import src.refresh as rf
import src.wallpapers as wl
import src.setwallpaper as stw
import src.shared.functions.__run as __run
env = os.environ

# code,i,res= rofi.select(prompt="sel",options=["12,123","añsdjf","añsdjf"])
# if i != -1:
#     log.info(res)
#
# rf("dunst")
# wl("/home/kiramanolo/.config/nixos/pics/")
# stw("/home/kiramanolo/.config/nixos/pics/wallpaper.png")

def menu(dir):
    images = [f"{image}\x00icon\x1f{dir}/{image}" for image in wl(dir)]
    images += ["random"]
    return images

def rofi_theme(theme:str = args.theme):

    try:
        theme = f"/home/{env['USER']}/.config/rofi/themes/wallpaper-select.rasi"
    except KeyError: ...
    try:
        theme = f"{env['HOME']}/.config/rofi/themes/wallpaper-select.rasi"
    except KeyError: ...

    out = ["-theme",theme]
    log.debug(f"{out= }")

    return out

def get_dir(dir:str = args.directory):

    try:
        dir = f"{env['NIXOS_CONFIG_DIR']}pics"
    except KeyError: ...
    try:
        dir = env["WALLPAPERS_DIR"]
    except KeyError: ...

    log.debug(f"{dir= }")
    return dir


selection = rofi.select(
    prompt="Select Wallpaper",
    options=menu(dir=get_dir()),
    rofi_args=rofi_theme())
log.debug(f"{selection= }")

if __run(["pidof","hyprpaper"]).returncode != 0:
    __run(["hyprpaper"],daemon=True)

if selection[1] == -1:
    log.critical("selection is not valid")
    exit(1)
    
if selection[2] == "random":
    stw(f"{get_dir()}/{random.choice(wl(get_dir()))}")

elif selection[2]: stw(f"{get_dir()}/{selection[2]}")

rf(process="dunst")
