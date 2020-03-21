I0 = 10E-12;
n = 1;
VT = ((1.3806488E-23)*300)/(1.602176565E-19);
R = 10E3;
Vs = 3;

[x, fval, exitflag] = fsolve(@(v) f1(v)-f2(Vs-v), [1 5]);

vspan = linspace(5,15, 100);
plot(vspan, I0*(exp(vspan./(n*VT))-1))

x
sum(sum(fval.*fval))

if exitflag ~= 1
    error('Unreliable solution')
end