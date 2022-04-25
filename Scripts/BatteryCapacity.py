#!/usr/bin/python

battery_status_path="/sys/class/power_supply/BAT1/status"
battery_capacity_path="/sys/class/power_supply/BAT1/capacity"

def read_file(path: str) -> str:
    file = open(path, "r")
    contents = file.read()
    return contents.strip()

def get_battery_capacity() -> int:
    return int(read_file(battery_capacity_path))

def get_battery_status() -> str:
    return read_file(battery_status_path)

def main():
    capacity = get_battery_capacity()
    status = get_battery_status()

    prefix=""
    symbol=""

    if status == "Charging":
        prefix = ""
    elif status == "Discharging":
        prefix = ""

    if capacity == 100:
        symbol= ''
    elif capacity < 5:
        label = ""
    elif capacity < 45:
        label = ""
    elif capacity < 70:
        label = ""
    elif capacity < 100:
        label = ""

    space = "" # should be "" for i3blocks but " " for console
    print(prefix, symbol, space, capacity, "%", sep="")

if __name__=="__main__":
    main()

