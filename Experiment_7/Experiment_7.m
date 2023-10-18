% Problem 1:
% Rectangular 
L = 64;
window1 = 0.85*rectwin(L);
N = 1024;
X1 = abs(fft (window1, N) / length (window1));
Freq = (0: N/2-1)/ N;
Y1 = X1 (1: length (Freq)) / max (X1);
mag_dB1 =  20*log10(Y1); 

% Hamming
L = 64;
window2 = hamming(L);
N = 1024;
X1 = abs(fft (window2, N) / length (window2));
Freq = (0: N/2-1)/ N;
Y1 = X1 (1: length (Freq)) / max(X1);
mag_dB2 =  20*log10(Y1); 

% Hanning
L = 64;
window3 = hann(L);
N = 1024;
X1 = abs(fft (window3, N) / length (window3));
Freq = (0: N/2-1)/ N;
Y1 = X1 (1: length (Freq)) / max (X1);
mag_dB3 =  20*log10(Y1); 

% Time domain
plot (window1); 
hold on
plot (window2); 
plot (window3); 
hold off
ylabel("Amplitude")
xlabel("Samples")
title("Time Domain analysis of windows")
legend("Rectangular","Hamming","Hanning",Location="south")
grid on

% Frequency Domain
plot(Freq,mag_dB1);
hold on
plot(Freq,mag_dB2);
plot(Freq,mag_dB3);
hold off
ylabel("Magnitude [dB]")
xlabel("Normalized Frequency")
title("Frequency Domain analysis of windows")
legend("Rectangular","Hamming","Hanning",Location="southwest")
grid on

% Problem 2:
% Frequency Response(Bode analysis)
Filter_1 = fir1(20,1/(1+1),'low',rectwin(21));
[h1,f1] = freqz(Filter_1);
m1 = 20*log10(abs(h1));

Filter_2 = fir1(20,1/(1+1),'low',hamming(21));
[h2,f2] = freqz(Filter_2);
m2 = 20*log10(abs(h2));

Filter_3 = fir1(20,1/(1+1),'low',hann(21));
[h3,f3] = freqz(Filter_3);
m3 = 20*log10(abs(h3));

Filter_4 = fir1(20,1/(1+1),'low',blackman(21));
[h4,f4] = freqz(Filter_4);
m4 = 20*log10(abs(h4));

plot(f1,m1)
hold on
plot(f2,m2)
plot(f3,m3)
plot(f4,m4)
hold off
title('Frequency Response')
ylabel('Magnitude [dB]');
xlabel('Normalized Frequency');
legend("Rectangular","Hamming","Hanning","Blackman",Location="southwest")
grid on

% Impulse Response
impz(Filter_1)
hold on
impz(Filter_3)
hold off
legend("Rectangular","Hanning")
grid on


% Problem 3:
% Spectrogram
[s1,f2] = audioread("instru1.wav");
spectrogram(s1,hann(256),250,512,f2,'yaxis');view(-45,65);colormap jet
title('Spectrogram (Hanning)');

% Pitch Extraction
[~,f,t,ps] = spectrogram(s1,hann(1000),900,2000,f2,'xaxis');
imagesc(t, f, 10*log10(ps));
axis xy;
ylim([100 1000]); % zoom to the fundamental frequency range
xlabel('Time [s]');
ylabel('Frequency [Hz]');
title('Pitch Extraction');

% BandPass FIR filter with cutoff freuencies(400-600Hz)
Filter = fir1(100,[0.53 0.8],'bandpass',chebwin(101,60));
[h4,f4] = freqz(Filter);
m = 20*log10(abs(h4));
plot((f4/pi)*750,m)
title('FIR(Chebyshev) filter response')
ylabel('Magnitude [dB]');
xlabel('Frequency [Hz]');
grid on

% Filtering
Filtered = filtfilt(Filter,1,s1);
spectrogram(Filtered,hann(256),250,512,1500,'yaxis');view(-45,65);colormap jet
title('Spectrogram (Filtered)');