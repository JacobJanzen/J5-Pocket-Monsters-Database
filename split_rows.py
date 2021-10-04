# used to turn 3 column CSV into 2 column CSV

file = open('data/egg.csv')
Lines = file.readlines()

for line in Lines:
    line = line.strip()
    if line.endswith(',NULL'):
        line = line.replace(',NULL','')
        print('{}'.format(line))
    else:
        words = line.split(',')
        print('{},{}'.format(words[0],words[1]))
        print('{},{}'.format(words[0],words[2]))
