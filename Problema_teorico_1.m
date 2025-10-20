%% Problema 1
R = 330
L = 0.15
Vs = 15
tao = L/R


time = 0:10*10^-7:tao*20;

If = Vs/R

I = If*(1-exp(-time/tao));

I_tao = If*(1-exp(-1));

close all
figure(1)
plot(time,I)
grid on
xlabel('Time (s)')
ylabel('Current (A)')
hold on
plot(tao, I_tao, 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r')
asintota = If*ones(length(time));
plot(time,asintota,'k')
% plot(x_punto, y_punto, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r')
