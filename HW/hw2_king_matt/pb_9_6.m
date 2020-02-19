midA = tone(1.0,440);
%midA2 = midA * 2;
%audiowrite('midA2.wav', midA2, 8192);
t = 0:1/8192:(1-1/8192); % t goes from 0 to 1 with a size of 8192
midAExp = midA .* exp(-3*t);
plot(t,midAExp) % amplitude decreases as t increases
sound(midAExp) % volume trails off because it's dampened
pause(2)

midACos = midA .* cos(10*t);
plot(t, midACos) % amplitude increases and decreases cyclically with time
sound(midACos) % this is reflected in the sound by the volume increasing
pause(2)       % and decreasing
               
midAExpCos = midA .* cos(10*t) .* exp(-3*t);
plot(t, midAExpCos) % ampltiude decreases and increases but trends downward
sound(midAExpCos) % this is a combination of the previous effects