%% Actividad guiada

% Time vector 
time_harm = 0:sampling_time:0.5;

% Fundamental
fundamental = 325*sin(2*pi*freq*time_harm);

% Primera carga 
charge_1 = fundamental;

% Segunda carga  
ch_2_harm3 = 0.1*325*sin(2*pi*(3*freq)*time_harm);  
ch_2_harm5 = 0.05*325*sin(2*pi*(5*freq)*time_harm);  
charge_2 = fundamental + ch_2_harm3 + ch_2_harm5;

% Tercera carga 
ch_3_harm3 = 0.25*325*sin(2*pi*(3*freq)*time_harm);  
ch_3_harm5 = 0.15*325*sin(2*pi*(5*freq)*time_harm);  
ch_3_harm7 = 0.1*325*sin(2*pi*(7*freq)*time_harm);  
charge_3 = fundamental + ch_3_harm3 + ch_3_harm5 + ch_3_harm7;

[harmonic_data_ch1, THD_ch1] = analyze_harmonics(charge_1, fs, f0);
[harmonic_data_ch2, THD_ch2] = analyze_harmonics(charge_2, fs, f0);
[harmonic_data_ch3, THD_ch3] = analyze_harmonics(charge_3, fs, f0);

fprintf('Carga 1: ')
fprintf('\nTHD = %.4f%%\n\n', THD_ch1);
fprintf('Carga 2: ')
fprintf('\nTHD = %.4f%%\n\n', THD_ch2);
fprintf('Carga 3: ')
fprintf('\nTHD = %.4f%%\n\n', THD_ch3);

figure;
subplot(3,1,1)
plot(t_ms, charge_1);
xlabel('Tiempo (ms)');
ylabel('Amplitud (V)');
title('Carga 1');
grid on 
xlim([0 80])
subplot(3,1,2)
plot(t_ms, charge_2);
xlabel('Tiempo (ms)');
ylabel('Amplitud (V)');
title('Carga 2');
grid on
xlim([0 80])
subplot(3,1,3)
plot(t_ms, charge_3);
xlabel('Tiempo (ms)');
ylabel('Amplitud (V)');
title('Carga 3');
grid on 
xlim([0 80])


figure; 
subplot(3,1,1)
bar(harmonic_data_ch1(1:10,1), harmonic_data_ch1(1:10,3));
xlabel('Número de armónico');
ylabel('Magnitud [V]');
title('Espectro Carga 1');
grid on;
set(gca, 'XTick', harmonic_data_ch1(:,1));
subplot(3,1,2)
bar(harmonic_data_ch2(1:10,1), harmonic_data_ch2(1:10,3));
xlabel('Número de armónico');
ylabel('Magnitud [V]');
title('Espectro Carga 2');
grid on;
set(gca, 'XTick', harmonic_data_ch2(:,1));
subplot(3,1,3)
bar(harmonic_data_ch3(1:10,1), harmonic_data_ch3(1:10,3));
xlabel('Número de armónico');
ylabel('Magnitud [V]');
title('Espectro Carga 3');
grid on;
set(gca, 'XTick', harmonic_data_ch3(:,1));