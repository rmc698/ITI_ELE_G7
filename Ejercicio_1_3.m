clc; clear; close all;

fs = 1000;         % Hz
T  = 0.2;          % 200 ms
t  = 0:1/fs:T-1/fs;

f = 50;            % Hz
Vp = 325;          % 230 RMS

% señal base
x = Vp * sin(2*pi*f*t);

% metemos una caída entre 80 ms y 120 ms
x( t>=0.08 & t<=0.12 ) = 0.5 * Vp * sin(2*pi*f*t( t>=0.08 & t<=0.12 ));

% calcular RMS deslizante con ventana de 20 ms
ventana_ms = 20;
[rms_vec, t_rms] = rms_deslizante(x, fs, ventana_ms);

% valor RMS esperado (antes de la caída)
Vrms_teorico = Vp/sqrt(2);

% ---- gráficas ----
figure;
subplot(2,1,1);
plot(t, x, 'b');
xlabel('Tiempo (s)');
ylabel('Amplitud (V)');
title('Señal original');
grid on;

subplot(2,1,2);
plot(t_rms, rms_vec, 'r', 'LineWidth', 1.2); hold on;
yline(Vrms_teorico, '--k', '230 V RMS');
xlabel('Tiempo (s)');
ylabel('RMS (V)');
title(sprintf('RMS deslizante (ventana = %d ms)', ventana_ms));
legend('RMS','230 V','Location','best');
grid on;