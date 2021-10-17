trainer_file = open('../data/trainers.csv')
file = open('../data/parties')
Lines = file.readlines()
Trainers = trainer_file.readlines()

trainers = dict()

for line in Trainers:
    words = line.strip().split(',')
    name = words[1] + ',' + words[2]
    trainers[name] = words[0]

for line in Lines:
    words = line.strip().split('|')
    name = words[0] + ',' + words[1]
    rest = ''
    for i in range(2,len(words)):
        rest += words[i] + '|'
    trainer_num = trainers.get(name)
    if trainer_num == None:
        print('{}|{}'.format(name,rest))
    else:
        print('{}|{}'.format(trainer_num,rest))
