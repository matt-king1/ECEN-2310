D = diag(0:2.5:10); D(1:4,5)=1
E = 1:10; E = 2 .^ E
G = [-2 3 9; -9 -8 -20; 1 3 -2]; G(G<0) = G(G<0) .* 2
H = [1 1 0; 0 1 1; 0 1 0]; all(all(H == H'))