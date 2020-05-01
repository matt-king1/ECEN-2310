clc
clearvars

alpha = 0:0.001:1;
beta = 0:0.001:1;

[A,B] = meshgrid(alpha, beta);

zeta = A + B - (A.^3 + B.^3);

[M, c] = contourf(A,B,zeta);
axis equal
hold on
clabel(M, c)
colorbar;

[zmax, idx] = max(zeta(:));
[row, col] = ind2sub(size(zeta), idx);
row = row / 1000;
col = col / 1000;
text(row, col, ['\bullet', num2str(zmax)])