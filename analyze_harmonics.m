% Function to analyze harmonics and calculate THD
function [harmonic_data, THD] = analyze_harmonics(signal, fs, f0)
    N = length(signal);
    % Calculate frequency resolution
    delta_f = fs / N;
    fprintf('Resolución de frecuencia: Δf = %.4f Hz\n', delta_f);
    % Get FFT results
    [frequencies, magnitudes] = analyze_fft(signal, fs);
    % Initialize matrix to store harmonic data
    num_harmonics = 15;
    harmonic_data = zeros(num_harmonics, 3);
    % Analyze each harmonic
    for n = 1:num_harmonics
        % Calculate theoretical harmonic frequency
        f_harmonic = n * f0;  
        % Find the closest index in the frequency vector
        [~, idx] = min(abs(frequencies - f_harmonic));     
        % Store: harmonic number, actual frequency, magnitude
        harmonic_data(n, 1) = n;
        harmonic_data(n, 2) = frequencies(idx);
        harmonic_data(n, 3) = magnitudes(idx);
    end
    % Calculate THD
    % THD = sqrt(sum(V_n^2 for n=2 to 15)) / V_1 * 100%
    V1 = harmonic_data(1, 3); % Fundamental magnitude
    sum_harmonics_squared = sum(harmonic_data(2:end, 3).^2);
    THD = sqrt(sum_harmonics_squared) / V1 * 100;
end
