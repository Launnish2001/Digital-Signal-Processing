% Problem 1:
a = 1 + mod(30,3);
Fs = 120;
T = 1/Fs;
t = [0:T:2];
x = sin(2*pi*a*15*t);

%120
N = 120;
ydft = fft(x,N);
freq = 0:Fs/N:Fs/2;
Dft = abs(ydft(1:fix(N/2+1)));
plot(freq,Dft,'b');
hold on
title('Amplitude Spectrum'); 
xlabel ('Frequency [Hz]'); 
ylabel('Magnitude'); 
grid on;


%130
N = 130;
ydft = fft(x,N);
freq = 0:Fs/N:Fs/2;
Dft = abs(ydft(1:fix(N/2+1)));
plot(freq,Dft,'r');
legend("N=120","N=130");
hold off

%160
N = 160;
ydft = fft(x,N);
freq = 0:Fs/N:Fs/2;
Dft = abs(ydft(1:fix(N/2+1)));
plot(freq,Dft);
title('Amplitude Spectrum');
xlabel('Frequency [Hz]');
ylabel('Amplitude');
grid on


% Problem 2:

dft(215,120,126,"");
dft(415,120,126,"");
dft(1115,120,126,"");
dft(1515,120,126,"");
dft(1915,120,126,"");

dft(215,140,146,"");
dft(415,140,146,"");
dft(1115,140,146,"");
dft(1515,140,146,"");
dft(1915,140,146,"");

dft(215,160,166,"");
dft(415,160,166,"");
dft(1115,160,166,"");
dft(1515,160,166,"");
dft(1915,160,166,"");

% Problem 3: 

dft(215,120,126,"Hamming");
dft(415,120,126,"Hamming");
dft(1115,120,126,"Hamming");
dft(1515,120,126,"Hamming");
dft(1915,120,126,"Hamming");

dft(215,140,146,"Hanning");
dft(415,140,146,"Hanning");
dft(1115,140,146,"Hanning");
dft(1515,140,146,"Hanning");
dft(1915,140,146,"Hanning");

dft(215,160,166,"Blackman");
dft(415,160,166,"Blackman");
dft(1115,160,166,"Blackman");
dft(1515,160,166,"Blackman");
dft(1915,160,166,"Blackman");

% Problem 4:

%Hamming
x = load("Exp4Data1.txt");
Fs1 = 5000;
N = 10000;
ham = x'.*hamming(length(x)); % Hamming window
plot(x);
xlabel ('Time [s]'); 
ylabel('Amplitude');
hold on
plot (ham);
hold off
title('Hamming Window');
ydft = fft(ham,N);
freq = 0:Fs1/N:Fs1/2;
Dft = abs(ydft(1:fix(N/2+1)));
TF2 = islocalmax(Dft,'MinProminence',10);
plot(freq,Dft,freq(TF2),Dft(TF2),'r*');
title('Amplitude Spectrum'); 
xlabel ('Frequency [Hz]'); 
ylabel('Magnitude'); 
grid on;
f = freq(TF2)/5000;
F1 = "F1 = " + f(1)+"Fs";
disp(F1)
F2 = "F2 = "+ f(2)+"Fs";
disp(F2)

%Rectangular
rect = x'.*rectwin(length(x)); % Rectangular window
plot(x);
xlabel ('Time [s]'); 
ylabel('Amplitude');
hold on
plot (rect);
hold off
title('Rectangular Window');
ydft = fft(rect,N);
freq = 0:Fs1/N:Fs1/2;
Dft = abs(ydft(1:fix(N/2+1)));
TF2 = islocalmax(Dft,'MinProminence',50);
plot(freq,Dft,freq(TF2),Dft(TF2),'r*');
title('Amplitude Spectrum'); 
xlabel ('Frequency [Hz]'); 
ylabel('Magnitude'); 
grid on;
f = freq(TF2)/5000;
F1 = "F1 = " + f(1)+"Fs";
disp(F1)
F2 = "F2 = "+ f(2)+"Fs";
disp(F2)