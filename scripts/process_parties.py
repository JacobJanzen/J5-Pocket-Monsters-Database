file = open('../data/parties')
Lines = file.readlines()

for line in Lines:
    words = line.strip().split('|')
    trainer_id = words[0]
    num_pokemon = int(words[1])

    for i in range(0,num_pokemon):
        n_dex_num = words[i*5+2]
        gender = words[i*5+4]
        level = words[i*5+5]
        print('{}|0|{}|{}|{}|{}'.format(trainer_id,n_dex_num,gender,level,i+1))
