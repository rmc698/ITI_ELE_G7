function [t_cruces, f_estimada] = detectaCrucesCero(t, x)
% detectaCrucesCero - Detecta los cruces por cero de una señal con interpolación
% Entradas:
%   t : vector de tiempo
%   x : señal
% Salidas:
%   t_cruces  : tiempos (no índices) donde la señal cruza por cero
%   f_estimada: frecuencia estimada (Hz)

    s = sign(x);

    % cambios de signo (entre k y k+1 hay un cruce)
    cambios = find( s(1:end-1) ~= s(2:end) );

    % prealocar
    t_cruces = zeros(size(cambios));

    for k = 1:length(cambios)
        i = cambios(k);        % cruce entre i e i+1

        % valores en las dos muestras
        x1 = x(i);
        x2 = x(i+1);
        t1 = t(i);
        t2 = t(i+1);

        % interpolación lineal del punto donde x = 0
        % x(t) = x1 + (x2 - x1)*alpha
        % 0 = x1 + (x2 - x1)*alpha  ->  alpha = -x1/(x2 - x1)
        alpha = -x1 / (x2 - x1);
        t_zero = t1 + alpha*(t2 - t1);

        t_cruces(k) = t_zero;
    end

    % calcular frecuencia
    if numel(t_cruces) >= 2
        dt = diff(t_cruces);   % tiempo entre cruces consecutivos (medio ciclo)
        T = 2 * mean(dt);      % periodo
        f_estimada = 1 / T;
    else
        f_estimada = NaN;
    end
end