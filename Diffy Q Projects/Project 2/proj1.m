% A = importdata('mariana_depth.csv')
% lon = importdata('mariana_longitude.csv')
% lat = importdata('mariana_latitude.csv')


count = 0;
guess = ones(1440, 1)

newguess = A' * A * guess
mag = norm(newguess)
newguess = newguess / mag

ng2 = A' * A * newguess
mag2 = norm(ng2)
ng2 = ng2 / mag2

ng3 = A' * A * ng2
mag3 = norm(ng3)
ng3 = ng3/mag3

diffMag = norm(ng3 - ng2)

[U,S,V] = svd(A);

A * V(:,1)  

S(1) * V(:,1)