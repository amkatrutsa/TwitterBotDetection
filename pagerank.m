clear;
load('A.mat');
n = max(size(A)); 
%A = A';
D = sum(A, 2);
Ds = spdiags(1./max(D,ones(n,1)), 0, n,n);
AAD = Ds*A;
<<<<<<< HEAD
sum(AAD(3,:))
y = load('spam_or_ham.mat');
y = y.t;
S1 = gmres(speye(size(A)) - 0.8*AAD,y , 20, 1e-3);

y =ones(max(size(A)),1); 
S2 = gmres(speye(size(A)) - 0.8*AAD,y , 20, 1e-3);%
S3 = S1./S2;
%[U, D] = eigs(A, 1);
[Y, I] = sort(S2, 'descend');
I(1:100)
=======
sum(AAD(3,:));
y =ones(max(size(A)),1); 
S = gmres(speye(size(A)) - 0.8*AAD,y , 20, 1e-2);
%[U, D] = eigs(A, 1);
>>>>>>> c08925d855f65f531ac1f71a6b1affec4b4d3187
