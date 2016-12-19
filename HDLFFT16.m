function [yOut,validOut] = HDLFFT16(yIn,validIn)
%HDLFFT128 
% Processes one sample of FFT data using the dsp.HDLFFT System object(TM)
% yIn is a fixed-point scalar or column vector. 
% validIn is a logical scalar value.
% You can generate HDL code from this function.

  persistent fft16;
  if isempty(fft16)
    fft16 = dsp.HDLFFT('FFTLength',16)
  end    
  [yOut,validOut] = step(fft16,yIn,validIn);
end

