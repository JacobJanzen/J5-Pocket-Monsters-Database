file = open('../data/teams.csv')
Lines = file.readlines()
team_nums = dict()

for line in Lines:
    words = line.strip().split(',')
    curr_team = team_nums.get(words[0])
    if curr_team == None:
        team_nums[words[0]] = 0
    else:
        team_nums[words[0]] = int(curr_team) + 1

    print('{},{},{}'.format(words[0],words[1],team_nums[words[0]]))
