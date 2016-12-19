function [ X ] = dft( x )
%DFT Summary of this function goes here
%   Detailed explanation goes here

N = length(x);
X = zeros(size(x));
for k = 0:N-1
    s = 0;
   for t = 0:N-1
       s = s + x(t + 1)*exp(-2 * pi * t * k * 1i / N);
   end
   X(k + 1) = s;
end
end
