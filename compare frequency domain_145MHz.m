clear all
close all
clc
home

%Load File
M = csvread('C:\Users\HTDSP\Desktop\NSPO FIR - 複製\3.output signal(raw data)\modified.csv',2,0);

%Split Value from Load File
cos_wave_add_random_noise = M(:,1);	
sin_wave_add_random_noise = M(:,2);	
FIR_145MHz_cos	          = M(:,3);	
FIR_145MHz_sin	          = M(:,4);	
FIR_97MHz_cos	          = M(:,5);
FIR_97MHz_sin	          = M(:,6);
FIR_73MHz_cos	          = M(:,7);
FIR_73MHz_sin	          = M(:,8);
FIR_60MHz_cos	          = M(:,9);
FIR_60MHz_sin	          = M(:,10);
FIR_50MHz_cos	          = M(:,11);
FIR_50MHz_sin	          = M(:,12);
FIR_40MHz_cos	          = M(:,13);
FIR_40MHz_sin	          = M(:,14);
FIR_30MHz_cos	          = M(:,15);
FIR_30MHz_sin	          = M(:,16);
FIR_15MHz_cos	          = M(:,17);
FIR_15MHz_sin	          = M(:,18);

%FFT
Sample_Point   = 1000;
R              = 50; % system impedance (ohms)
N              = Sample_Point;
nfft           = N; % fft length
Fs             = 5*10^8;
f              = Fs/2*[-1:2/nfft:1-2/nfft];

%noise
ch_combine_noise = cos_wave_add_random_noise+1i*sin_wave_add_random_noise;

% FFT of signal
Re_noise= fftshift(fft(cos_wave_add_random_noise,nfft))/(N);
Im_noise= fftshift(fft(sin_wave_add_random_noise,nfft))/(N);
S_combine_noise = (fftshift(fft(ch_combine_noise,nfft))/(N));

% power spectrum
SpI_noise=10*log10((abs(Re_noise).^2)/R*1000);
SpQ_noise=10*log10((abs(Im_noise).^2)/R*1000);
power_combine_noise = abs(S_combine_noise).^2;
log_combine_noise = 10*log10((power_combine_noise)/R*1000);

%[J,K] = max(log_combine_noise);

%filtered signal
ch_combine = FIR_145MHz_cos+1i*FIR_145MHz_sin;

% FFT of signal
Re= fftshift(fft(FIR_145MHz_cos,nfft))/(N);
Im= fftshift(fft(FIR_145MHz_sin,nfft))/(N);
S_combine = (fftshift(fft(ch_combine,nfft))/(N));

% power spectrum
SpI=10*log10((abs(Re).^2)/R*1000)-20*log10(32768);
SpQ=10*log10((abs(Im).^2)/R*1000)-20*log10(32768);
power_combine = abs(S_combine).^2;
log_combine = 10*log10((power_combine)/R*1000)-20*log10(32768);

%[G,H] = max(log_combine);

figure(1)
subplot(2,1,1)
plot(f,SpI_noise)
grid on
grid minor
legend('noise co-sin wave');
title('Spectrum')
xlabel('Frequency')
ylabel('I-Power(dBm)')
subplot(2,1,2)
plot(f,SpI)
grid on
grid minor
legend('FIR 145MHz cos');
title('Spectrum')
xlabel('Frequency')
ylabel('I-Power(dBm)')

figure(2)
subplot(2,1,1)
plot(f,SpQ_noise)
grid on
grid minor
legend('noise sin wave');
title('Spectrum')
xlabel('Frequency')
ylabel('Q-Power(dBm)')
subplot(2,1,2)
plot(f,SpQ)
grid on
grid minor
legend('FIR 145MHz sin');
title('Spectrum')
xlabel('Frequency')
ylabel('Q-Power(dBm)')

figure(3)
subplot(2,1,1)
plot(f,log_combine_noise)
%text(K,J, sprintf('Peak = %6.3f',J))
grid on
grid minor
title('Power Spectrum')
xlabel('Frequency (MHz)')
ylabel('Combine Power(dBm)')
subplot(2,1,2)
plot(f,log_combine)
%text(H,G, sprintf('Peak = %6.3f',G))
grid on
grid minor
title('Power Spectrum')
xlabel('Frequency (MHz)')
ylabel('Combine Power(dBm)')

figure(4)
hold on
plot(f,SpI_noise)
plot(f,SpI,'r')
grid on
grid minor
title('Spectrum')
xlabel('Frequency')
ylabel('I-Power(dBm)')

figure(5)
hold on
plot(f,SpQ_noise)
plot(f,SpQ,'r')
grid on
grid minor
title('Spectrum')
xlabel('Frequency')
ylabel('Q-Power(dBm)')

figure(6)
hold on
plot(f,log_combine_noise)
plot(f,log_combine,'r')
grid on
grid minor
title('Power Spectrum')
xlabel('Frequency (MHz)')
ylabel('Combine Power(dBm)')


