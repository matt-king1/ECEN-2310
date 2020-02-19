function rv = tone(duration, freq)
%Generates the sampled sine wave for the given 'freq'
%and 'duration'. The sampling rate is 8192 Hz.
    sampleTimes = (0:duration*8192-1)/8192;
    rv = sin(2*pi*freq*sampleTimes);
end