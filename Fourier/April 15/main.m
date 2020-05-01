W = csvread("WindSpeed_Boulder_2007_2012.csv");
A = fft(W);
A = A / max(A);

figure(1)
plotfourier(A, 10, 10)