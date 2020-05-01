function [F, S] = fftexample
    wave = @(t) -0.1 + 0.2*sin(2*pi*t) - 0.4*cos(2*pi*t) + 0.3*sin(2*pi*3*t);
    tspan = linspace(0,1,8);
    fval = wave(tspan);
    F = fft(fval)
    S = abs([F(1) 2*F(2:length(fval)/2)])/length(fval); 
end

