import subprocess

rofi_path = "/usr/bin/rofi"
rofi_config_path = "~/.config/rofi/rofimenu.rasi"

def run_rofi(dmenu_stdin: str) -> str | None:
    global rofi_path, rofi_config_path

    rofi_args = [ rofi_path, "-dmenu", "-config", rofi_config_path ]
    proc = subprocess.run(rofi_args, input=dmenu_stdin, capture_output=True, text=True)

    if proc.returncode == 0:
        return proc.stdout
    else:
        return None

