import re

pattern = re.compile(r'^(a*)(b+)$')

with open("g-2.txt") as f:
    for line in f:
        cadena = line.strip()
        if pattern.fullmatch(cadena):
            print(f"{cadena} -> acepta")
        else:
            print(f"{cadena} -> NO acepta")


