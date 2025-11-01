% Señal con harmónicos
time_harm = 0:sampling_time:0.5;
fundamental = 325*sin(2*pi*freq*time_harm);
third_harm = 0.15*325*sin(2*pi*(3*freq)*time_harm); 
fifth_harm = 0.1*325*sin(2*pi*(5*freq)*time_harm);
signal_harm = fundamental + third_harm + fifth_harm;

f0 = freq; % Fundamental frequency (Hz)
[harmonic_data, THD] = analyze_harmonics(signal_harm, fs, f0);
t_ms = time_harm*1000;

figure;
subplot(2,1,1)
plot(t_ms, signal_harm);
xlabel('Tiempo (ms)');
ylabel('Amplitud (V)');
title('Señal temporal');
xlim([0 80])
grid on;
subplot(2,1,2);
bar(harmonic_data(1:10,1), harmonic_data(1:10,3));
xlabel('Número de armónico');
ylabel('Magnitud [V]');
title(sprintf('Magnitud de los armónicos (THD = %.2f%%)', THD));
grid on;
set(gca, 'XTick', harmonic_data(:,1));

% Display results
fprintf('\n===== ANÁLISIS DE ARMÓNICOS =====\n\n');
fprintf('Armónico\tFrecuencia (Hz)\tMagnitud\n');
fprintf('--------\t---------------\t--------\n');
for i = 1:size(harmonic_data, 1)
    fprintf('%d\t\t%.2f\t\t%.4f\n', harmonic_data(i,1), harmonic_data(i,2), harmonic_data(i,3));
end
fprintf('\nTHD = %.4f%%\n\n', THD);
