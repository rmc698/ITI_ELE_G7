clc; clear; close all;

% Parámetros de la señal
f = 50;               % Frecuencia (Hz)
Vp = 325;             % Voltaje pico (V)
fs = 1000;            % Frecuencia de muestreo (Hz)
T = 0.1;              % Duración (s)
t = 0:1/fs:T-1/fs;    % Vector de tiempo

% Generar señal sinusoidal
v = Vp * sin(2*pi*f*t);

% Calcular valor RMS usando la función
Vrms_calc = calculaRMS(v);

% Valor RMS teórico
Vrms_teorico = Vp / sqrt(2);

% Mostrar resultados
fprintf('Valor RMS calculado: %.3f V\n', Vrms_calc);
fprintf('Valor RMS teórico: %.3f V\n', Vrms_teorico);
fprintf('Error: %.3f %%\n', abs((Vrms_calc - Vrms_teorico)/Vrms_teorico)*100);

% Comprobar si el error cumple con la especificación
if abs((Vrms_calc - Vrms_teorico)/Vrms_teorico)*100 < 1
    disp('✅ El error es menor al 1%.');
else
    disp('❌ El error supera el 1%.');
end