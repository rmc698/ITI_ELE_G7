%% Análisis RMS señal trafo 
close all 
clear all 

% Signal generation 
sampling_time = 0.6/6000; 
fs = 1/sampling_time; 
time = 0:sampling_time:0.6;
freq = 50; 
signal = 325*sin(2*pi*freq*time);
% swell
signal(501:1501) = 0.55*signal(501:1501);
% sag 
signal(1501:2701) = 1.15*signal(1501:2701); 

% Signal Visualization  
figure(1)
plot(time,signal)
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
title('Señal con sag & swell')
grid on 

ventana_ms = 20;
[rms_vec,t_rms] = rms_deslizante(signal,fs,ventana_ms);

% RMS Visualization
figure(2)
subplot(2,1,1)
plot(time,signal)
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
title('Señal con sag & swell')
grid on 
subplot(2,1,2)
plot(t_rms,rms_vec,'LineWidth',2)
grid on
xlabel('Tiempo [s]')
ylabel('Tensión RMS [V]')
title('Valores de RMS a lo largo del tiempo') 
ylim([100 280])

