import sys
import webbrowser
matrix_id = int(sys.argv[1])

file_in = open('matrix_indices.txt' ,'r')
i = 0

while i < matrix_id:
    string = file_in.readline()
    i += 1

twitter_id = int(string)
url = 'https://twitter.com/intent/user?user_id=%s'%twitter_id
webbrowser.open_new(url)
