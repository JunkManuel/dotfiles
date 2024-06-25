import logging
import src.shared.functions.__run as __run

log = logging.getLogger(__name__)

def setwallpaper(wallpaper:str, display:str= "eDP-1"):
    args_preload = ["hyprctl", "hyprpaper", "preload", wallpaper]
    args_wallpaper = ["hyprctl", "hyprpaper", "wallpaper", f"{display},{wallpaper}"]
    args_wallust = ["wallust","run","-s", wallpaper]
    
    __run(args_preload)
    __run(args_wallpaper)
    __run(args_wallust)
