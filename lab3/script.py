import os

with open('lab.answers.txt', 'r') as file:
    for line in file:
        if 'Suzen' in line:
            name = line.replace('\n', '').replace(' ', '')
            os.mkdir(path='./' + name)
            with open('./'+name+'/script.sh', 'tw', encoding='utf-8') as f:
                pass
