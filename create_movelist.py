# Very rough script to convert a specific json file to CSV.
# Used to convert data about Pokemon in Pokemon Showdown source code into csv file.
file = open('./moves', 'r')
Lines = file.readlines()

for line in Lines:
    line = line.replace('}}','')
    line = line.strip()
    if line == '|-':
        print()
    elif line.startswith('|{{m|'):
        line = line.replace('|{{m|','')
        print('"{}",'.format(line), end='')
    elif line.startswith('{{typetable|'):
        line = line.replace('{{typetable|','')
        print('"{}",'.format(line), end='')
    elif line.startswith('|I'):
        line = line.replace('|','')
        print('{}'.format(line), end='')
    else:
        line = line.replace('|','')
        print('{},'.format(line), end='')
