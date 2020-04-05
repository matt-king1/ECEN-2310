syms p c a

    %p  a c
A = [-1 0 0;
    0 -1 0;
    0 0 -1;
    0.75 -0.25 -0.25;
    0.4 0.4 -0.6;
    1 1 1];
     
f = -[6 3 4.5];
B = [0 0 0 0 0 100];

[x, fVal, exitFlag] = linprog(f, A, B);

if exitFlag ~= 1
    fprinf('Error solving system\n');
else
    fprintf('Optimal solution found:\n');
    x
end