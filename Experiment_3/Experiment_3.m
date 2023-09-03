% Problem 1:

[s1,fs1] = audioread('piano1.wav');
[s2,fs2] = audioread('trumpet1.wav');
[s3,fs3] = audioread('violin1.wav');
[s4,fs4] = audioread('flute1.wav');

Amplitude_spectrum(s1,fs1);
Amplitude_spectrum(s2,fs2);
Amplitude_spectrum(s3,fs3);
Amplitude_spectrum(s4,fs4);

% Problem 2:

[s5,fs5] = audioread('whistle.wav');
Amplitude_spectrum(s5,fs5);
Out = Keylock('whistle.wav')


% Problem 3:

[s6,fs6] = audioread('Opera.wav');
Amplitude_spectrum(s6,fs6);

% Temporal variations:
Amplitude_spectrum(s6(1:20000),fs6);
for i = 2:10
    figure;
        Amplitude_spectrum(s6(20000*(i-1):20000*i),fs6);
end