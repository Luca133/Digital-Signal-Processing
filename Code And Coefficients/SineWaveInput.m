%% Clear
close all   % Close all figures
clear       % Clear all variables in workspace
clc         % Clear command window

%% Import relevant data files
load('LowpassCoeffs.mat')
load('BandpassCoeffs.mat')
load('HighpassCoeffs.mat')

equaliser = LowpassCoeffs + BandpassCoeffs + HighpassCoeffs;

%%
fs = 48000;          
T = 0.1;                
t  = 0:1/fs:T;       % Generates a time vector at 1/fs from 0 to T.

% Generate a signal having 5 frequencies (500Hz, 900Hz, 3000Hz, 4500Hz, 9000Hz)
% x  =  sin(2*pi*500*t) + sin(2*pi*900*t) + sin(2*pi*3000*t) + sin(2*pi*4500*t) + sin(2*pi*9000*t);

x  =  sin(2*pi*200*t) + sin(2*pi*1000*t) + sin(2*pi*3000*t) + sin(2*pi*4500*t) + sin(2*pi*10000*t);

figure(1)
plot(t,x)
title('Combined Sinewave');

figure(2);
plot(t,filter(LowpassCoeffs,1,x))
title('LowPass');

figure(3);
plot(t,filter(BandpassCoeffs,1,x))
title('BandPass');

figure(4);
plot(t,filter(HighpassCoeffs,1,x))
title('HighPass');

figure(5);
plot(t,filter(equaliser,1,x))
title('Equaliser');
