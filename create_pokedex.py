file = open('./pokedex.ts', 'r')
Lines = file.readlines()

for line in Lines:
    line = line.strip()
    if line.startswith('num:'):
        line = line.replace('num: ','')
        print("{}".format(line),end='')
    if line.startswith('name:'):
        line = line.replace('name: ','')
        print("{}".format(line),end='')
    if line.startswith('baseStats:'):
        line = line.rstrip(line[-1])
        line = line.rstrip(line[-1])
        line = line.replace('baseStats: {hp: ','')
        line = line.replace(' atk: ','')
        line = line.replace(' def: ','')
        line = line.replace(' spa: ','')
        line = line.replace(' spd: ','')
        line = line.replace(' spe: ','')
        words = line.split(',')
        for word in words:
            print("{},".format(word),end='')
    if line.startswith('heightm:'):
        line = line.replace('heightm: ','')
        print("{}".format(line),end='')
    if line.startswith('weightkg:'):
        line = line.rstrip(line[-1])
        line = line.replace('weightkg: ','')
        print("{}".format(line))
