trainer_file = open('../data/trainers.csv')
file = open('../data/teams.csv')
Lines = file.readlines()
Trainers = trainer_file.readlines()

trainers = dict()

for line in Trainers:
    words = line.strip().split(',')
    if len(words) > 2:
        name = words[1] + ',' + words[2]
        trainers[name] = words[0]

for line in Lines:
    words = line.strip().split(',')
    name = words[0] + ',' + words[1]
    trainer_num = trainers.get(name)
    if trainer_num == None:
        print('{},{}'.format(name,words[2]))
    else:
        print('{},{}'.format(trainer_num,words[2]))
