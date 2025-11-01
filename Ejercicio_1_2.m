clc; clear; close all;

f = 50;
fs = 1000;
T = 0.1;
t = 0:1/fs:T-1/fs;
x = sin(2*pi*f*t);

[t_cruces, f_est] = detectaCrucesCero(t, x);

figure;
plot(t, x, 'b', 'LineWidth', 1.2); hold on;
plot(t_cruces, zeros(size(t_cruces)), 'or', 'MarkerSize', 6, 'LineWidth', 1.2);
yline(0, '--k');

title(sprintf('Señal con cruces por cero - f estimada = %.2f Hz', f_est));
xlabel('Tiempo (s)');
ylabel('Amplitud');
legend('Señal','Cruces por cero','Línea cero','Location','best');
grid on;