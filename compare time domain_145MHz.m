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

%Vivado parameter
ILA_length  = 1024;      %Vivado ILA Sample point
%Time Scale
t = 0:1:ILA_length; 

%Time Domain
subplot(2,1,1)
plot(cos_wave_add_random_noise)
hold on
plot(FIR_145MHz_cos/32768,'r')
legend('cos wave add random noise','FIR 145MHz cos');
title('Time Domain Compare')
xlabel('point')
ylabel('Magnitude(dB)')
grid on
subplot(2,1,2)
plot(sin_wave_add_random_noise)
hold on
plot(FIR_145MHz_sin/32768,'r')
legend('sin wave add random noise','FIR 145MHz sin');
title('Time Domain Compare')
xlabel('point')
ylabel('Magnitude(dB)')
grid on
