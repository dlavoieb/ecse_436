function X = myFFT(x)

N = numel(x);
x_even = x(1:2:end);
x_odd = x(2:2:end);

if N>=8
    X_even = myFFT(x_even);
    X_odd = myFFT(x_odd);
    
    Wn = exp(-1i*2*pi*((0:N/2-1)')/N);
    tmp = Wn .* X_odd;
    X = [(X_even + tmp);(X_even -tmp)];

elseif N == 2
    X = [1 1;1 -1]*x;
elseif N == 4
    X = [1 0 1 0; 0 1 0 -1i; 1 0 -1 0;0 1 0 1i]*[1 0 1 0;1 0 -1 0;0 1 0 1;0 1 0 -1]*x;
else
    error('N not correct.');
end
end