% Problema avanzado
% Apartado a) tipo de amotiguamiento

clear all

R=40
L=40*10^-3
C=10*10^-6

% ctes circuito

alfa=R/(2*L)
W0=1/sqrt(L*C)
wd=abs(sqrt(alfa^2-W0^2))

% s1=-alfa+sqrt((alfa)^2-1/(L*C))
% s2=-alfa-sqrt((alfa)^2-1/(L*C))

s1=-alfa+sqrt((alfa)^2-1/(L*C))
s2=-alfa-sqrt((alfa)^2-1/(L*C))

tau=1/alfa

% Apartado b)
% i(t)=e^(-alfa*t)*A1*cos(wd*t)+e^(-alfa*t)*A2*sen(wd*t)
% En t=0, I=0, de aquí se obtiene A1=0
% En t=0, (haciendo suma de tensiones) i`=10/L, obtengo que C2=10/(wd*L)


t=0:0.0001:8*tau ;
i=10/(L*wd)*exp(-alfa*t).*sin(wd*t);

plot(t,i)
 grid on
xlabel('Time (s)')
ylabel('Current (A)')