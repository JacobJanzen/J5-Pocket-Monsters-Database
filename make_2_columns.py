# Used to convert consecutive lines into 2 columns of CSV
file = open('data/catch_rate','r')
while True:
    line1 = file.readline()
    line2 = file.readline()
    if not line2: break

    print('{},'.format(line1.strip()),end='')
    print('{}'.format(line2.strip()))
