file = open('data/evos')
pokedex_file = open('data/pokedex.csv')
Lines = file.readlines()
Pokedex = pokedex_file.readlines()

pokedex = dict()

for line in Pokedex:
    words = line.split(',')
    pokedex[words[1]] = words[0]

for line in Lines:
    words = line.strip().split(',')
    if words[1] == 'NULL':
        print('{},{}'.format(words[0],words[1]))
    else:
        nDexNum = pokedex.get(words[1])
        if nDexNum == None:
            print('{},NULL'.format(words[0]))
        else:
            print('{},{}'.format(words[0],nDexNum))
