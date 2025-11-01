clc; clear; close all;

%% 1. Generar la señal base
fs = 2000;              % Hz
Ttotal = 0.2;           % 200 ms
t = 0:1/fs:Ttotal-1/fs;

f = 50;                 % Hz
Vp = 325;               % pico (230 RMS)
x = Vp * sin(2*pi*f*t); % señal base

%% 2. Introducir el hueco
t_inicio_hueco = 0.050;     % 50 ms
dur_hueco      = 0.050;     % 50 ms
profundidad    = 0.5;       % 50% -> mitad de amplitud

% índices del hueco
idx_hueco = (t >= t_inicio_hueco) & (t < t_inicio_hueco + dur_hueco);

% aplicar hueco
x_hueco = x;
x_hueco(idx_hueco) = profundidad * Vp .* sin(2*pi*f*t(idx_hueco));

%% 3. Calcular RMS deslizante
ventana_ms = 20;  % un ciclo
[rms_vec, t_rms] = rms_deslizante(x_hueco, fs, ventana_ms);

Vrms_nominal = 230;          % V
Vrms_limite  = 0.9 * 230;    % -10% = 207 V

%% 4. Visualizar resultados
figure;

% gráfica superior: señal temporal
subplot(2,1,1);
plot(t, x_hueco, 'b', 'LineWidth', 1.0); hold on;
% marcar el hueco
area(t(idx_hueco), x_hueco(idx_hueco), 'FaceColor', [1 0.8 0.8], 'EdgeColor', 'none');
plot(t, x, '--k'); % señal original de referencia
title('Señal con hueco de tensión');
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
legend('Señal con hueco','Zona de hueco','Señal original','Location','best');
grid on;

% gráfica inferior: RMS deslizante
subplot(2,1,2);
plot(t_rms, rms_vec, 'r', 'LineWidth', 1.4); hold on;
yline(Vrms_nominal, '--k', '230 V (nominal)');
yline(Vrms_limite, '--b', 'Límite -10% (207 V)');
xlabel('Tiempo (s)');
ylabel('RMS (V)');
title(sprintf('RMS deslizante (ventana = %d ms)', ventana_ms));
legend('RMS deslizante','230 V','207 V','Location','best');
grid on;