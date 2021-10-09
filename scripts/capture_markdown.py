import sys

file = open(sys.argv[1],'r')
Lines = file.readlines();

in_text_area=False

for line in Lines:
    if '<textarea' in line:
        in_text_area = True
        continue
    if '</textarea' in line:
        in_text_area = False
        continue
    if in_text_area:
        print(line.strip())
