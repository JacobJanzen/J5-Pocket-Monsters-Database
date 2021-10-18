file = open('../data/trainer_locations.csv')
Lines = file.readlines()

location = ''
for line in Lines:
    line = line.strip()
    if line.startswith('"'):
        location = line
    elif line == '':
        pass
    else:
        print('{},{}'.format(location,line))
