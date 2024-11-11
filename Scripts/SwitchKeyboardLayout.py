#!/usr/bin/python

import subprocess
from dataclasses import dataclass
from typing import Tuple

rofi_path = "/usr/bin/rofi"
rofi_config_path = "~/.config/rofi/rofimenu.rasi"

cache_file_path = "/home/joe/.cache/prevkeyboardlayout"

@dataclass
class Language:
    name: str
    language_code: str
    variant: str | None = None

default_language = Language(name = "English", language_code = "gb")

def get_languages() -> list[Language]:
    return [
        default_language,
        Language(name = "Greek Modern", language_code = "gr"),
        Language(name = "Greek Polytonic", language_code = "gr", variant="polytonic")
    ]

def get_languages_dmenu_stdin(languages: list[Language]) -> str:
    input = ""
    for language in languages:
        input = f"{input}{language.name}\n"
    return input

def get_prev_keyboard_layout(languages: list[Language]) -> Language | None:
    global cache_file_path
    cache_file = open(cache_file_path, "r")
    if cache_file.closed:
        return None

    language_code_source = cache_file.readline().strip()
    if language_code_source == "":
        return None
    language_code = language_code_source

    variant_source = cache_file.readline().strip()
    variant = None
    if variant_source != "":
        variant = variant_source

    for language in languages:
        if language.language_code == language_code and language.variant == variant:
            return language

    return None

def set_keyboard_layout(language: Language):
    global cache_file_path
    cache_file = open(cache_file_path, "w")

    args = [ "setxkbmap" ]
    args.append(language.language_code)
    cache_file.write(language.language_code)

    if language.variant is not None:
        args.append("-variant")
        args.append(language.variant)

        cache_file.write("\n")
        cache_file.write(language.variant)

    subprocess.run(args)
    cache_file.close()

def main():
    global default_language
    global rofi_path, rofi_config_path

    languages = get_languages()

    prev_keyboard_language = get_prev_keyboard_layout(languages)
    set_keyboard_layout(default_language)

    dmenu_stdin = get_languages_dmenu_stdin(languages)
    rofi_args = [ rofi_path, "-dmenu", "-config", rofi_config_path ]
    proc = subprocess.run(rofi_args, input=dmenu_stdin, capture_output=True, text=True)
    
    if proc.returncode != 0:
        if prev_keyboard_language is not None:
            set_keyboard_layout(prev_keyboard_language)
        return

    output_language_name = proc.stdout.strip()

    for language in languages:
        if language.name == output_language_name:
            set_keyboard_layout(language)
            return


    if prev_keyboard_language is not None:
        set_keyboard_layout(prev_keyboard_language)

if __name__ == "__main__":
    main()

