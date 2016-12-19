%% Create an FFT for HDL Generation

%% 
% Create the specifications and input signal. 
N = 128;
Fs = 40; 
t = (0:N-1)'/Fs;
x = sin(2*pi*15*t) + 0.75*cos(2*pi*10*t);
y = x + .25*randn(size(x));
y_fixed = sfi(y,32,24);
%% 
% Write a function that creates the System object(TM) and calls |step|. You
% can generate HDL from this function. 
%
% <include>HDLFFT128.m</include> 
%
%% 
% Compute the FFT by calling the function for each data sample. 
Yf = zeros(1,3*N);
validOut = false(1,3*N);
for loop = 1:1:3*N 
    if (mod(loop, N) == 0) 
        i = N; 
    else
        i = mod(loop, N); 
    end
    [Yf(loop),validOut(loop)] = HDLFFT128(complex(y_fixed(i)),(loop <= N)); 
end
%% 
% Discard invalid data samples. Then plot the frequency channel results from
% the FFT. 
Yf = Yf(validOut == 1);
Yr =  bitrevorder(Yf);
plot(Fs/2*linspace(0,1,N/2), 2*abs(Yr(1:N/2)/N))
title('Single-Sided Amplitude Spectrum of Noisy Signal y(t)')
xlabel('Frequency (Hz)') 
ylabel('Output of FFT(f)')