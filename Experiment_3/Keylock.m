% Reference audio is input:
function out = Keylock(ref)
    [s1,fs1] = audioread(ref);
    ydft1 = fft(s1);
    freq1 = 0:fs1/length(s1):fs1/2; 
    ydft1 = ydft1(1:fix(length(s1)/2+1));
    plot(freq1,abs(ydft1),'r') 
    hold on
    title('Amplitude Spectrum'); 
    xlabel ('Frequency [Hz]'); 
    ylabel('Magnitude [db]'); 
    grid on;
    [val1,idx1] = max(abs(ydft1));
    Fund_freq1 = fix(freq1(idx1));

% Record the audio:
    
    a = audiorecorder(44100,16,1);
    disp("Start whistling")
    recordblocking(a,3);
    disp("End of recording")

% Find the fund_freq of the audio:
    
    dat = getaudiodata(a);
    fs = 44100;
    ydft2 = fft(dat);
    freq2 = 0:fs/length(dat):fs/2; 
    ydft2 = ydft2(1:fix(length(dat)/2+1));
    [val2,idx2] = max(abs(ydft2));
    plot(freq2,abs(ydft2),'b') 
    legend('Reference','User Input')
    hold off
    

% Dtermine the error: 
    
    error = abs((freq2(idx2)-Fund_freq1)/Fund_freq1);
    Error = ['Error = ' num2str(fix(error*100)) '%'];
    disp(Error)
    if error <= 0.05
        out = "ACCESS GRANTED";
    else
        out = "ACCESS DENIED";
    end
end