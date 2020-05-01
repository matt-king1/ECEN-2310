clc

P = (1/5)*ones(6,6);
for i = 1:6
    P(i,i) = 0;
end

A = sym(P);
[V, D] = eig(A);

fprintf("Eigenvalues: ")
diag(D)

fprintf("Eigenvectors: ")
for i = 1:6
    V(:,i)
end