function [yOut,validOut] = HDLFFT128(yIn,validIn)
%HDLFFT128 
% Processes one sample of FFT data using the dsp.HDLFFT System object(TM)
% yIn is a fixed-point scalar or column vector. 
% validIn is a logical scalar value.
% You can generate HDL code from this function.

  persistent fft128;
  if isempty(fft128)
    fft128 = dsp.HDLFFT('FFTLength',128)
  end    
  [yOut,validOut] = step(fft128,yIn,validIn);
end

