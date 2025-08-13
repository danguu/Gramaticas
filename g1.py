import re

pattern = re.compile(r'^(00|11|0|1)$')

with open("g-1.txt") as f:
    for line in f:
        cadena = line.strip()
        if pattern.fullmatch(cadena):
            print(f"{cadena} -> acepta")
        else:
            print(f"{cadena} -> NO acepta")

