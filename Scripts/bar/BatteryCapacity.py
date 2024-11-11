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
    battery_status = get_battery_status()

    status=""
    symbol=""

    if battery_status == "Charging":
        status = ""
    elif battery_status == "Discharging":
        status = ""

    if capacity == 100:
        symbol= ''
    elif capacity < 5:
        symbol = ""
    elif capacity < 45:
        symbol = ""
    elif capacity < 70:
        symbol = ""
    elif capacity < 100:
        symbol = ""

    space = "" # should be "" for i3blocks but " " for console
    print(symbol, status, space, capacity, "%", sep="")

if __name__=="__main__":
    main()

