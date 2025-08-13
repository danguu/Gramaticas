import re

pattern = re.compile(r'^(abb|ab)$')

with open("g-4.txt") as f:
    for line in f:
        cadena = line.strip()
        if pattern.fullmatch(cadena):
            print(f"{cadena} -> acepta")
        else:
            print(f"{cadena} -> NO acepta")

