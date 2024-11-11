#!/usr/bin/python

import subprocess
from dataclasses import dataclass

rofi_path = "/usr/bin/rofi"
rofi_config_path = "~/.config/rofi/rofimenu.rasi"

@dataclass
class Language:
    name: str
    language_code: str
    variant: str | None = None

def get_languages() -> list[Language]:
    return [
        Language(name = "English", language_code = "gb"),
        Language(name = "Greek Modern", language_code = "gr"),
        Language(name = "Greek Polytonic", language_code = "gr", variant="polytonic")
    ]

def get_languages_dmenu_stdin(languages: list[Language]) -> str:
    input = ""
    for language in languages:
        input = f"{input}{language.name}\n"
    return input

def set_keyboard_layout(language: Language):
    args = [ "setxkbmap" ]
    args.append(language.language_code)

    if language.variant is not None:
        args.append("-variant")
        args.append(language.variant)

    subprocess.run(args)

def main():
    global rofi_path, rofi_config_path

    languages = get_languages()
    dmenu_stdin = get_languages_dmenu_stdin(languages)
    rofi_args = [ rofi_path, "-dmenu", "-config", rofi_config_path ]
    proc = subprocess.run(rofi_args, input=dmenu_stdin, capture_output=True, text=True)
    
    if proc.returncode != 0:
        return

    output_language_name = proc.stdout.strip()

    for language in languages:
        if language.name == output_language_name:
            set_keyboard_layout(language)

if __name__ == "__main__":
    main()

