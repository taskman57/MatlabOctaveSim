function y = mysin(N, f, fs, fn,bit)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%    sin with Noise generaor         %%
% %%  function arguments description:   %%
% %%  mysin(N,f,fs, fn,bit)             %%
% %%    N: number of desired periods    %%
% %%    f: main sine fraquency          %%
% %%   fs: sampling frequency           %%
% %%   fn: noise addetive frequency     %%
% %%  bit: total bit width of the wave  %%
% %%                                    %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  close all;
  x=0:1/fs:(N/f-1/fs);
  y=2^(bit-1)*(1+(0.7*sin(2*pi*f.*x)+0.3*sin(2*pi*fn.*x)));
  plot(y);
end
