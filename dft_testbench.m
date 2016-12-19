[x, fs] = audioread('media/speech.wav'); % Acquire track
x = x(:,1); % Ignore second channel
% trim sample
x = x(1:16);
X_2 = abs(top_level_fft(x)); % Custom dof implementation
