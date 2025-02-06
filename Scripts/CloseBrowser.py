#!/usr/bin/python

from dataclasses import dataclass
import subprocess
import rofi

pkill_path = "/usr/bin/pkill"

@dataclass
class NamedProcess:
    display: str
    name: str

def get_named_processes() -> list[NamedProcess]:
    return [
        NamedProcess(display="Firefox", name="firefox"),
        NamedProcess(display="Zen", name="zen"),
        NamedProcess(display="Chromium", name="chromium")
    ]

def get_languages_dmenu_stdin(named_processes: list[NamedProcess]) -> str:
    input = ""
    for named_process in named_processes:
        input = f"{input}{named_process.display}\n"
    return input

def run_pkill(named_process: NamedProcess):
    global pkill_path
    subprocess.run([ pkill_path, named_process.name ])

def main():
    named_processes = get_named_processes()
    dmenu_stdin = get_languages_dmenu_stdin(named_processes)
    dmenu_stdout = rofi.run_rofi(dmenu_stdin)

    if dmenu_stdout == None:
        return

    output_language_display = dmenu_stdout.strip()
    for named_process in named_processes:
        if named_process.display == output_language_display:
            run_pkill(named_process)
            break

if __name__ == "__main__":
    main()

