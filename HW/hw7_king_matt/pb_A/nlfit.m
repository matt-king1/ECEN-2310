T = readtable("nlfit.csv");
v = T{1:end,"V"};
a = T{1:end,"A"};
pf = polyfit(v,a,1);


vt = v';
at = a';

subplot(2,1,1)
scatter(vt, at, 'r')
line(v, polyval(pf, v))
xlabel('Voltage (V)')
ylabel('Current (A)')
[R, p] = corrcoef(v, a);
title('Linear Fit')
fprintf('Linear fit cc and p-value: r = %g, p = %g\n', R(1,2), p(1,2))


subplot(2,1,2)
scatter(vt,at, 'r')
xlabel('Voltage (V)')
ylabel('Current (A)')
logV = log(v(2:end,1));
logA = log(a(2:end,1));
lf = polyfit(logV,logA,1);


t = linspace(0, 100, 5000);
line(t,exp(lf(2)) * t .^ (lf(1)))
title('Power Law')
fprintf('Power law found: I = e^%g * V^%g\n', lf(2), lf(1))
[R2, p2] = corrcoef(logV, logA);
fprintf('Power law cc and p-value: r = %g, p = %g\n', R2(1,2), p2(1,2))

