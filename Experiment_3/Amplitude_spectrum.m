% Amplitude spectrum function:
function [Fund_freq,Out] = Amplitude_spectrum(s,fs)
 
ydft = fft(s);
freq = 0:fs/length(s):fs/2;
ydft = ydft(1:fix(length(s)/2+1));
decibels = 20.*log10(abs(ydft)./min(abs(ydft)));
Out = plot(freq,abs(ydft));
title('Amplitude Spectrum'); 
xlabel ('Frequency [Hz]'); 
ylabel('Magnitude [db]'); 
grid on;
[maxval,idx] = max(abs(ydft));
Fund_freq = fix(freq(idx))

end