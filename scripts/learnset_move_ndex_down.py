file = open('../data/new_learnsets')
Lines = file.readlines()

current_num = -1
for line in Lines:
    line = line.strip()
    if line.startswith('|'):
        current_num = int(line[1:])
    elif line.startswith('{'):
        print('{},{}'.format(current_num,line))
