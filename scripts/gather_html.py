import requests
import re
file = open('../other_files/learnset_urls','r')
Lines = file.readlines()

for url in Lines:
    # Create file name
    url = url.strip()
    try:
        out_file_name = re.search('=(.+?)_', url).group(1)
    except:
        out_file_name = 'failed'
    out_file_name = '../html_sources/' + out_file_name + '.html'

    # open output file
    out_file = open(out_file_name, 'w')

    # Write HTML Source
    contents = requests.get(url)
    out_file.write(contents.text)

    print(out_file_name)
