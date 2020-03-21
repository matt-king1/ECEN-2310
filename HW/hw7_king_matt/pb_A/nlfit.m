T = readtable("nlfit.csv");
v = T{1:end,"V"};
a = T{1:end,"A"};
pf = polyfit(v,a,1);

[R, p] = corrcoef(v, a);
fprintf('r = %g, p = %g\n', R(1,2), p(1,2))

subplot(2,1,1)
plot(v, a, v, polyval(pf,v))
xlabel('Voltage (V)')
ylabel('Current (A)')

subplot(2,1,2)
logV = T{1:end,"V"};
logA = T{1:end,"A"};
logV(2:end) = log(logV(2:end));
logA(2:end) = log(logA(2:end));

pf2 = polyfit(logV,logA,1);

fprintf('power law: I = e^%g * V^%g\n', pf(2), pf(1))
t = linspace(min(v),max(v),100)
plot(v, exp(pf(2)).*v.^pf(1))

