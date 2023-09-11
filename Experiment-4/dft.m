function out = dft(N,A,B,window)
    Fs = 200;
    T = 1/Fs;
    t = 0:T:10;
    x = 0.1*sin(A*pi*t) + cos(B*pi*t);

    if window == "Hanning"
        window = x'.*hann(length(x));
    elseif window == "Blackman"
        window = x'.*blackman(length(x));
    elseif window =="Hamming"
        window = x'.*hamming(length(x));
    elseif window == ""
        window = x;
    end
    ydft = fft(window,N);
    freq = 0:Fs/N:Fs/2;
    Dft = abs(ydft(1:fix(N/2+1)));
    out = plot(freq,Dft);
    title("Amplitude Spectrum "+N+"-Samples");
    xlabel('Frequency [Hz]');
    ylabel('Amplitude');
    grid on
end