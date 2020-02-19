plot1 = figure('Name','Problem A Plot 1');
plot2 = figure('Name','Problem A Plot 2');

theta = linspace(0,2*pi,100);
r = sin(2.*theta);
polarplot(theta, r);
plot1

pause(2);

figure(plot2);
t = linspace(-1000,1000,20000);
x = (1-t.^2)./(1+t.^2);
y = (2.*t)./(1+t.^2);
plot(x,y);
plot2

