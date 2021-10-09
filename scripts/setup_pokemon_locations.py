file = open('../data/pokemon_locations')
Lines = file.readlines();

current_location = ''
for line in Lines:
    line = line.strip()
    if line.startswith('"'):
        current_location = line
    elif line == '':
        pass
    else:
        print('{},{}'.format(current_location,line))
