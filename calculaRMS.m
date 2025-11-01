function Vrms = calculaRMS(v)
% calculaRMS - Calcula el valor RMS de una señal
% Entrada:
%   v : vector con los valores de la señal
% Salida:
%   Vrms : valor RMS calculado

    N = length(v);
    Vrms = sqrt((1/N) * sum(v.^2));
end