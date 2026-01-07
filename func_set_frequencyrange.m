function [freq_range]=...
    func_set_frequencyrange(freq_range_min,...
    freq_range_max,freq_range_steps)
    %% Verify & order the Frequency and Frequency Range
    
    if freq_range_steps<1
        freq_range_steps=1;
    end

    
    if freq_range_min > freq_range_max
        temp = freq_range_min;
        freq_range_min = freq_range_max;
        freq_range_max = temp;
    end

    % Frequency Range
    freq_range=freq_range_min:freq_range_steps:freq_range_max;
    
end