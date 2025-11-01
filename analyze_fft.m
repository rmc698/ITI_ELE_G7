% Function to perform FFT analysis
function [frequencies, magnitudes] = analyze_fft(signal, fs) 
    N = length(signal); % Number of samples
    % Compute FFT
    fft_result = fft(signal);  
    % Consider only positive frequencies (first half of spectrum)
    % For even N: indices 1 to N/2+1
    % For odd N: indices 1 to (N+1)/2
    if mod(N, 2) == 0
        num_positive = N/2 + 1;
    else
        num_positive = (N+1)/2;
    end    
    fft_positive = fft_result(1:num_positive);   
    % Normalize magnitudes by dividing by number of samples
    magnitudes = abs(fft_positive) / N;
    % Multiply by 2 the intermediate components (except DC and Nyquist)
    magnitudes(2:end-1) = 2 * magnitudes(2:end-1);
    % Generate frequency vector
    frequencies = (0:num_positive-1) * (fs/N);
end

