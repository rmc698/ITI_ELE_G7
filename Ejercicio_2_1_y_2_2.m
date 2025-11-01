close all 
clear all 

% Signal generation 
fs = 20000;
sampling_time = 1/fs; 
time = 0:sampling_time:1;
freq = 50; 
sample_signal = 325*sin(2*pi*freq*time);
freq_visual = freq*10;


% Call the FFT analysis function
[frequencies, magnitudes] = analyze_fft(sample_signal, fs);

% Analyze harmonics and calculate THD
f0 = freq; % Fundamental frequency (Hz)
[harmonic_data, THD] = analyze_harmonics(sample_signal, fs, f0);

% Display results
figure;
subplot(3,1,1);
plot(time, sample_signal);
xlabel('Tiempo (s)');
ylabel('Amplitud (V)');
title('Señal temporal');
grid on;
subplot(3,1,2);
stem(frequencies, magnitudes, 'LineWidth', 1.5);
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
title('Espectro de frecuencias');
grid on;
xlim([0 freq_visual]); 
subplot(3,1,3);
bar(harmonic_data(:,1), harmonic_data(:,3));
xlabel('Número de armónico');
ylabel('Magnitud');
title(sprintf('Magnitud de los armónicos (THD = %.2f%%)', THD));
grid on;
set(gca, 'XTick', harmonic_data(:,1));


% Visualización FFT señal 50 Hz
figure(20)
subplot(2,1,1);
plot(time, sample_signal);
xlabel('Tiempo (s)');
ylabel('Amplitud (V)');
title('Señal temporal');
grid on;
xlim([0 0.1])
subplot(2,1,2);
stem(frequencies, magnitudes, 'LineWidth', 1.5);
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
title('Espectro de frecuencias');
grid on;
xlim([0 freq_visual]); % Modificación propia 



% Display peak frequency
[max_mag, max_idx] = max(magnitudes);
fprintf('Frecuencia dominante: %.2f Hz\n', frequencies(max_idx));
fprintf('Magnitud: %.2f\n', max_mag);

% Display results
fprintf('\n===== ANÁLISIS DE ARMÓNICOS =====\n\n');
fprintf('Armónico\tFrecuencia (Hz)\tMagnitud\n');
fprintf('--------\t---------------\t--------\n');
for i = 1:size(harmonic_data, 1)
    fprintf('%d\t\t%.2f\t\t%.4f\n', harmonic_data(i,1), harmonic_data(i,2), harmonic_data(i,3));
end
fprintf('\nTHD = %.4f%%\n\n', THD);
