syms x y z
eq1 = 2*x - 4*y + 4*z == -3;
eq2 = x - 2*y + z == 5;
eq3 = x - 4*y + 6*z == 10;

[A,B] = equationsToMatrix([eq1, eq2, eq3], [x,y,z]);

sols = linsolve(A,B)
if abs((2*sols(1)-4*sols(2)+4*sols(3)-(-3))) < 10E-9
    fprintf('Solution is accurate\n')
end