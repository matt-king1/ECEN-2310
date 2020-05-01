
%plotfourier takes time series data and makes three different subplots
    %Sublot 1 is the entire dataset plotted in time domain
    %Subplot 2 is a week of data plotted in the time domain 
    %Subplot 3 is the absolute value of the single sided fourier spectrum
%data is the data set
%fs is the sampling frequency in days^-1
%label is a string with the type of data to be plotted (e.g. 'GHI')


function plotfourier(data, fs, label)
T = 1/fs;          %Sampling period: days
L = length(data);  %length of signal (samples)     
t = (0:L-1)*T;     %time vector

%Plot time series data
subplot(3,1,1);
plot(t,data);
title('Full Time Series Data');
xlabel('Samples');
ylabel(label);

subplot(3,1,2);
plot(t(1:(24*7)),data(1:(24*7)))
title('One Week of Time Series Data');
xlabel('Samples');
ylabel(label);

%Compute FFT, find the absolute value of single sided spectrum
Y = fft(data);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f1 = fs*(0:(L/2))/L;

%Plot the Fourier spectrum
subplot(3,1,3);
plot(f1,P1,'LineWidth',2);
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f [1/d]')
ylabel('|P1(f)|')
axis([0 12 0 0.4]);
end 

