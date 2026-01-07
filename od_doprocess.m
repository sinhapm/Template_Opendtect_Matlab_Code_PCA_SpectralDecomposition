function out = od_doprocess(pars,seismicin) 
    
    if dateflag==1 % Domain Flag Line
        %% Take the input from the od_getparameters() function
        sampint = pars.SamplingInterval;
        windowsize = pars.WindowSize; % Window Size for LSA Spectral Decomposition
        
        freq_range_min = abs(pars.FrequencyRangeMin);
        freq_range_max = abs(pars.FrequencyRangeMax);
        freq_range_steps = abs(pars.FrequencySteps);
        
        principalcomponent= pars.PrincipalComponent;
        
        %% Call the Function to verify & order the Frequency and Frequency Range
        [freq_range]=func_set_frequencyrange(freq_range_min,...
            freq_range_max,freq_range_steps);
               
        %% Input Format of 3D Seismic from Opendtect
        % Dimension: TWT x Xline x Inline
        % Dimension: (TWT,Xline,Inline)
        seis3d_in1 = cell2mat( seismicin(1) );

        %% Call function to carry out the spectral decomposition (SD)
        % Method: SPectral Decomposition, Return Value= Magnitude
        % Size of sd_mag_out4pca =[ns*nxline*ninline , length of Frequency Rang]
        [sd_mag_out4pca, ns, nxline, ninline] = ...
            sdmag3d( seis3d_in1, sampint, windowsize,freq_range);
        
        %% Call function to carry out the PCA
        out = sdmag3dpca( sd_mag_out4pca, principalcomponent,ns,nxline,ninline);

    else
        out=0;
    end
    
end