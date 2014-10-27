% cross-validation of spam labelling

clear;

load('A.mat');
y = load('spam_or_ham.mat');
y = y.t;

val = 0.9;

sl = find(y==-1);
sn = size(sl, 1);
ss = round(sn*val);
se = sn - ss;
sp = randperm(sn);
sstudy = sl(sp(1:ss));
scheck = sl(sp(ss+1:sn));
y(scheck) = 0;

ul = find(y==1);
un = size(ul, 1);
us = round(un*val);
ue = un - us;
up = randperm(un);
ustudy = ul(up(1:us));
ucheck = ul(up(us+1:un));
y(ucheck) = 0;

n = max(size(A)); 
D = sum(A, 2);
Ds = spdiags(1./max(D,ones(n,1)), 0, n,n);
AAD = Ds*A;

S = gmres(speye(size(A)) - 0.9*AAD,y , 20, 1e-2);
disp('These are y for users labeled as spamers:');
S(scheck)
disp('These are y for users labeled as non-spamers:');
S(ucheck)
