I0 = 10E-12;
n = 1;
VT = ((1.3806488E-23)*300)/(1.602176565E-19);
R = 10E3;
Vs = 3;

f1 = @(v) I0*(exp(v/(n*VT))-1);
f2 = @(v) v/R;

[v1, fval, exitflag] = fsolve( @(j) f1(j) - f2(Vs-j), 0.6 );
if exitflag ~= 1
    error("Failed to find a solution")
end
v2 = Vs - v1;

vspan = linspace(0.4, 0.5, 100);
plot(vspan, f2(Vs-vspan), vspan, f1(vspan))
xlabel('Voltage (V)')
ylabel('Current (A)')
legend('Current through resistor','Current through diode')

diodeP = v1 * f1(v1);
resistorP = v2 * f2(v2);

fprintf('Power dissipated in diode: %gJ, Power dissipated in resistor: %gJ\n', diodeP, resistorP)

p = Vs * f1(Vs);
fprintf('Power dissipated in diode if resistor is not present: %gJ\n', p)

p = Vs * f2(Vs);
fprintf('Power dissipated in resistor if diode is not present: %gJ\n', p)