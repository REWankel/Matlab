clear all
close all
clc
home

Sample_Point   = 1000;
ADC_Resolution = 14;
Amplitude      = 2^ADC_Resolution;
Noise_Gain     = 3000;

t = 0:2*pi/(Sample_Point-1):2*pi;                 %Radius for one sinewave period
cosinewave = Amplitude*cos(10*t);                 %pure sinewave multiply with Amplitude
random_noise = Noise_Gain*randn(1,Sample_Point);  %1000 noise data multiply with Noise_Gain

noise_cosine = cosinewave + random_noise;         %sinewave+random noise
plot(noise_cosine)
