%Question 1:
%Part 1
t = linspace(-1,1,1000);
a = 1 + mod(30,3);
y1 = sin(20*pi*a*t);
plot(t,y1)
xlabel('t')
ylabel('y1')


%Part 2
y2 = cos((5*pi*a*t) + (pi/4));
plot(t, y2)
xlabel('t')
ylabel('y2')

%Part 3
y3 = exp(-2*a*t);
plot(t, y3)
xlabel('t')
ylabel('y3')

%Part 4
y4 = exp(-0.25*a*t).*sin(20*pi*t);
plot(t, y4)
xlabel('t')
ylabel('y4')

%Question 2:
t = linspace(-5,5,100000);
hold on  
subplot(2,2,1)
y1 = inline("exp(-a*t)","t","a");
plot(t, y1(t,a))
xlabel('t')
ylabel('y1')

subplot(2,2,2)
y2 = inline("exp(a*t)", "t","a");
plot(t, y2(t,a))
xlabel('t')
ylabel('y2')

subplot(2,2,3)
y3 = inline("exp(-a*(t-1.5*a))", "t","a");
plot(t, y3(t,a))
xlabel('t')
ylabel('y3')

subplot(2,2,4)
y4 = inline("exp(-a*(2*a*t))", "t","a");
plot(t, y4(t,a))
xlabel('t')
ylabel('y4')
hold off


%Question 3:
A=load('ECG_Data.txt');
subplot(1,1,1)
plot(A)
xlabel('samples')
ylabel('ECG Data')

july = load('RainFallIndia_July.txt');
jan = load('RainFallIndia_Jan.txt');

figure; histogram(july)
xlabel('samples')
ylabel('RainFallIndia_July')
figure; histogram(jan)
xlabel('samples')
ylabel('RainFallIndia_Jan')

mean(july)
mean(jan)

std(july)
std(jan)

[s,Fs] = audioread('Track001.wav');
sound(s,Fs);


%Question 4:
[s,Fs] = audioread('speech.wav');
sound(s,Fs);
F = 250000* a;
y = s*cos(2*pi*(F/Fs));
audiowrite('y.wav', y, Fs);
[y,Fs] = audioread('y.wav');
sound(y,Fs)
subplot(1,2,1)
plot(s)
xlabel('samples')
ylabel('s')
subplot(1,2,2)
plot(y)
xlabel('samples')
ylabel('y')

Fourier = fft(y);
T = 1/Fs;                  
L = 19120;            
t = (0:L-1)*T; 
P2 = abs(Fourier/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title(" Amplitude Spectrum of S(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")



%Question 5:
t =[0:0.001:5];
fs = 1000;
y1 = sin(2*pi*200*a*t);
y2 = sin(2*pi*220*a*t);
k = [y1 y2];
audiowrite('sg2.wav', k, fs);
[s,Fs] = audioread('sg2.wav');
sound(s, Fs)
plot(s)
xlabel('samples')
ylabel('s')


%Question 6:
t = linspace(0,5,20000);
fs = 44100;
y1 =  sin(220*t);
sound(y1, fs)

y2 = sin(246.94*t)
sound(y2, fs)

y3 = sin(261.63*t)
sound(y3, fs)

y4 = sin(293.66*t)
sound(y4, fs)

y5 = sin(329.63 *t)
sound(y5, fs)

y6 = sin(349.23*t)
sound(y6, fs)

y7 = sin(392*t)
sound(y7, fs)

z = [y3 y4 y5 y6 y7 y1 y2]
audiowrite('sg1.wav', z, fs);

[s,Fs] = audioread('sg1.wav');
sound(s, Fs)


%Question 7:
con = load('ConvFile1.txt')
[s,Fs] = audioread('Track001.wav');
sound(s, Fs)
res = conv2(s, con)
audiowrite('conv.wav', res, Fs);
sound(res, Fs)