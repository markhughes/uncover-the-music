import re
import os

directory_path = '.'
pattern = re.compile(r'h_[a-z]+_[a-z]+')

unique_values = set()

for filename in os.listdir(directory_path):
    match = pattern.search(filename)
    if match:
        unique_values.add(match.group(0))


print(unique_values)
