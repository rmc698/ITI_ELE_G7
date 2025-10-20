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
