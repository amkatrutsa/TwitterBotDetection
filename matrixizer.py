f = open("social_graph.txt")
t2i = {}
i2t = {}

for x in f.xreadlines():
    t_ids = map(lambda x: int(x), x.split(" "))
    for t_id in t_ids:
        if t_id in t2i:
            i = t2i[t_id]
        else:
            i = len(t2i) + 1
            t2i[t_id] = i
            i2t[i] = t_id

from scipy.sparse import dok_matrix
import numpy as np

n = len(t2i)
A = dok_matrix((n,n), dtype=np.int8)
print n

f = open("social_graph.txt")
for x in f.xreadlines():
    t_ids = map(lambda x: int(x), x.split(" "))
    source = t_ids[0]
    for t_id in t_ids[1:]:
        dest = t2i[t_id]
        print dest, source
        A[dest, source] = 1
        

import scipy.io as sio
savemat('A.mat', dict(A=A))
