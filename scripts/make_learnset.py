file = open('data/learnsets')
Lines = file.readlines()

dexNum = 0
for line in Lines:
    line = line.strip()
    if line.startswith('learnset:'):
        dexNum += 1
    elif not line.endswith('},') and not line.endswith('{'):
        print('{},{}'.format(dexNum,line))
