clc
syms x(t) g

Dx = diff(x,t);
cond = [x(0)==10, Dx(0)==0];
G = dsolve(diff(x,t,2) == -g);
P = dsolve(diff(x,t,2) == -g, cond);

fprintf("General Solution: " + string(G) + "\n");
fprintf("Particular Solution: " + string(P) + "\n");

fplot(subs(P,g,9.81), [0 2])
xlabel("t")
ylabel("x(t)")