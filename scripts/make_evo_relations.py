file = open('data/pokedex.ts')
line1 = file.readline()
line2 = file.readline()
while True:
    print('{}'.format(line1.strip()))
    if not line2:
        print('NULL')
        break
    elif not line2.startswith('"'):
        print('NULL')
        line1 = line2 
    else:
        print('{}'.format(line2.strip()))
        line1 = file.readline()
    line2 = file.readline()
