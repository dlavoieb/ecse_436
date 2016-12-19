clc;clear;
[x, fs] = audioread('media/1kHz.wav'); % Acquire track
x = x(:,1); % Ignore second channel

% trim sample
x = x(1:1024);

tic;
X = fft(x); % Compute fft and keep magnitude information
toc;
tic;
X_2 = myFFT(x); % Custom dft implementation
toc;

X = abs(X); % Keep magnitude only
X_2 = abs(X_2); % Keep magnitude only

N = length(X); % Get lenght of fft
NUP = ceil((N+1)/2); % Compute number of points to consider
X = X(1:NUP);% Keep one-sided information
X_2 = X_2(1:NUP);
f = (0:NUP-1)*fs/N; % Compute values for x axis
X = 20*log10(X); % Compute power values from amplitude
X_2 = 20*log10(X_2); % Compute power values from amplitude
figure(1)
% plot(f, X, f, X_2)
hold on
for i = 1:numel(X_2)
    stem(f(i), X_2(i)) % plot 
end
hold off

% set plot display options
xlim([0 max(f)])
grid on
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
title('Amplitude spectrum of the signal')
xlabel('Frequency, Hz')
ylabel('Magnitude, dB')

