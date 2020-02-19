% sampleTimes = (0:8192-1)/8192;
% samples = sin(2 * pi * 440 * sampleTimes);
% audiowrite('midA.wav', tone(1,440), 8192);
% sound(midA.wav)

midA = tone(1.0,440);
sampleTimes = (0:8192-1)/8192;
A = plot(0:1/8192:1-1/8192,midA)
pause(2)
B = plot(0:1/19:1-1/19,midA(1:ceil(8192/440)))
pause(2)
C = plot(0:1/19:1-1/19,midA(1:ceil(8192/440)), '-o')
pause(2)
D = plot(0:10/(10*8192/440):10,midA(1:ceil(10*8192/440)))

