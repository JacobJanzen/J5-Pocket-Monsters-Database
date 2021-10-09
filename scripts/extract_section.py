import sys

section = '==' + sys.argv[1].strip() + '==' 
file = open(sys.argv[2],'r')
Lines = file.readlines()

in_section=True

for line in Lines:
    line = line.strip()

    if section == line: # Enter section
        in_section = True
    elif line.startswith('==') and not line.startswith('==='): # Exit section
        in_section = False
    elif in_section and (line.startswith('|') or line.startswith('{')):
        print(line)
