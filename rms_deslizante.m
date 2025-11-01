function [rms_vec, t_rms] = rms_deslizante(x, fs, ventana_ms)
% rms_deslizante - Calcula el RMS en ventanas deslizantes (muestra a muestra)
% Entradas:
%   x          : señal (vector fila o columna)
%   fs         : frecuencia de muestreo (Hz)
%   ventana_ms : tamaño de la ventana en milisegundos
% Salidas:
%   rms_vec    : vector con los valores RMS calculados
%   t_rms      : vector de tiempos asociado a cada RMS

    x = x(:);  % asegurar columna

    % tamaño de la ventana en muestras
    Nvent = round(fs * ventana_ms / 1000);   % p.ej. 20 ms a 1 kHz -> 20 muestras

    if Nvent < 1
        error('La ventana es demasiado pequeña.');
    end

    N = length(x);
    % número de posiciones posibles: una por muestra a partir de que haya
    % suficientes muestras para llenar la ventana
    Nout = N - Nvent + 1;

    rms_vec = zeros(Nout,1);
    t_rms   = zeros(Nout,1);

    % recorre muestra a muestra
    for k = 1:Nout
        trozo = x(k : k+Nvent-1);
        rms_vec(k) = sqrt( mean( trozo.^2 ) );
        % tiempo asociado: centro de la ventana (mejor que el inicio)
        idx_centro = k + floor((Nvent-1)/2);
        t_rms(k) = (idx_centro-1)/fs;
    end
end