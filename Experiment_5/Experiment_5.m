% Problem 1:
a = 1 + mod(30,3);
Fs = 100;
T = 1/Fs;
t = [0:T:10];
F1 = 2+2*a;
F2 = 5+5*a;
f = linspace(F1,20,length(t));
x = sin(2*pi.*f.*t);
set(gcf,'color','k');
plot(t,x)
title('Chirp Signal'); 
xlabel ('Time [s]'); 
ylabel('Magnitude');

% FFT 
ydft = fft(x);
freq = 0:Fs/length(x):Fs/2;
dft = abs(ydft(1:fix(length(x)/2+1)));
plot(freq,dft,'y');
title('Amplitude Spectrum'); 
xlabel ('Frequency [Hz]'); 
ylabel('Magnitude');
grid on

% Spectrogram
spectrogram(x,hamming(256),250,512,Fs,'yaxis');view(-45,65);colormap jet
title('Spectrogram (Hamming)'); 
spectrogram(x,hann(256),250,512,Fs,'yaxis');view(-45,65);colormap jet
title('Spectrogram (Hanning)');
spectrogram(x,blackman(256),250,512,Fs,'yaxis');view(-45,65);colormap jet
title('Spectrogram (Blackman)');

% Problem 2:

% instru1.wav
% Spectrogram
[s1,f1] = audioread("instru1.wav");
set(gcf,'color','k');
spectrogram(s1,hann(500),450,800,f1,'yaxis');view(-45,65);colormap jet
title('Spectrogram (Hanning)');

% Pitch extraction
[~,f,t,ps] = spectrogram(s1,hann(1000),900,2000,f1,'xaxis');
imagesc(t, f, 10*log10(ps));
axis xy;
ylim([100 1000]); % zoom to the fundamental frequency range
xlabel('Time in s');
ylabel('Frequency in Hz');

% FFT
win = s1'.*hann(length(s1));
N = 10000;
ydft = fft(s1,N);
freq = 0:f1/N:f1/2;
dft = abs(ydft(1:fix(N/2+1)));
plot(freq,dft,'y');
title('Amplitude Spectrum'); 
xlabel ('Frequency [Hz]'); 
ylabel('Magnitude');
grid on
[~,b] = max(dft);
Fund_freq = "Fund_freq = " + freq(b) + " Hz";
disp(Fund_freq)

%Opera.wav
% Spectrogram
[s2,f2] = audioread("Opera.wav");
dat = s2(88200:176400); % 2-4s
spectrogram(s2,chebwin(500),450,800,f2,'yaxis');view(-45,65);colormap jet
title('Spectrogram (Chebyshev)');

% Pitch extraction
[~,f,t,ps] = spectrogram(dat,chebwin(1000),900,2000,f2,'xaxis');
imagesc(t, f, 10*log10(ps));
axis xy;
ylim([0 2000]); % zoom to the fundamental frequency range
xlabel('Time in s');
ylabel('Frequency in Hz');

% FFT
ydft = fft(dat);
freq = 0:f2/length(dat):f2/2;
dft = abs(ydft(1:fix(length(dat)/2+1)));
peak = islocalmax(dft,'MinProminence',400);
loc = [1247 2625];
plot(freq,dft,freq(loc),dft(loc),'r*');
title('Amplitude Spectrum'); 
xlabel ('Frequency [Hz]'); 
ylabel('Magnitude');
grid on
f = freq(loc);
freq1 = "F1 = " + f(1) + " Hz";
freq2 = "F2 = " + f(2) + " Hz";
disp(freq1)
disp(freq2)

% Problem 3:
% Spectrogram
[s,fs] = audioread("Name.wav");
data = s(3600:5600);
set(gcf,'color','k');
spectrogram(s,chebwin(500),490,800,fs,'yaxis');view(-45,65);colormap jet
title('Spectrogram (Chebyshev)');

% Pitch extraction
[~,f,t,ps] = spectrogram(data,chebwin(1000),980,1000,fs,'xaxis');
imagesc(t, f, 10*log10(ps));
axis xy;
ylim([0 2000]); % zoom to the fundamental frequency range
xlabel('Time in s');
ylabel('Frequency in Hz');

% FFT
ydft = fft(data);
freq = 0:fs/length(data):fs/2;
dft = abs(ydft(1:fix(length(data)/2+1)));
peak = islocalmax(dft,'MinProminence',3);
plot(freq,dft,freq(peak),dft(peak),'r*');
title('Amplitude Spectrum'); 
xlabel ('Frequency [Hz]'); 
ylabel('Magnitude');
grid on
fr = freq(peak);
freq1 = "F1 = " + fr(1) + " Hz";
freq2 = "F2 = " + fr(2) + " Hz";
freq3 = "F3 = " + fr(3) + " Hz";
freq4 = "F4 = " + fr(4) + " Hz";
disp(freq1)
disp(freq2)
disp(freq3)
disp(freq4)