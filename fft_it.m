function d = fft_it(x) 
% Cooley-Tukey flavor of the FFT algorithm
% Based on the implementation presented in Fast Fourier Transform
% by Stefan Worner of Swiss Federal Institute of Technology Zuric
  
    N = length(x);
    d = x(bitrevorder(1:N));
    q = log2(N);
    
    for j = 1:q
       m = 2^(j-1);
       d = exp(-2 *pi * i /m).^(0:m-1);
       for k = 1:2^(q-j)
           s = (k-1)*2*m+1; % start-index
           e = k*2*m; % end-index
           r = s + (e-s+1)/2; % middle-index
           y_top = x(s:(r-1));
           y_bottom = x(r:e);
           z = d .* y_bottom;
           y = [y_top + z, y_top - z];
           x(s:e) = y;
       end
    end
end