file = open('../data/new_parties')
Lines = file.readlines()

for line in Lines:
    words = line.strip().split('|')

    rest = ''
    for i in range(2,len(words)):
        rest += words[i] + '|'

    print('{}|{}'.format(words[0],rest))
