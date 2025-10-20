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


%% Simulación 
clear all
close all 
sim("Simulacion_problema_2_iti_ele_ejercicios_1.slx");


%Data extraction
ind_current=ans.ind_current.data;
cap_voltage=ans.Cap_voltage.data;
source=ans.source.data;

time = 0:10^-5:0.05;

% Capacitor voltage 
figure(1)
plot(time,cap_voltage,'LineWidth',2)
grid on
title('Tensión en el condensador')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
ylim([0 11])
xlim([-0.005 0.05])
hold on
plot(0.001,6.3,'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r')


% Inductor Current
figure(2)
plot(time,ind_current,'LineWidth',2)
grid on
title('Corriente en la rama RLC')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
% ylim([0 11])
xlim([-0.005 0.05])
hold on 
plot(0.001,0.067,'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r')


figure(3)
plot(time,ind_current,'LineWidth',2)
grid on
title('Corriente en la rama RLC')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
% ylim([0 11])
xlim([0 0.0005])
xline(0.00013, 'r--', 'Pico de corriente', 'LineWidth', 2)