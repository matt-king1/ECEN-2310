t = 0:pi/100:10*pi;
x = exp(-t./3).*cos(3.*t);
y = exp(-t./10).*sin(t)+1;
plot(x,y)