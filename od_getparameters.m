function pars = od_getparameters() 
%% Get the Required Parameters from the Opendtect Volume Builder Process
% Volume Builder is applicable to only 3D Seismic Volme
% Spectral Decomoposition - Input 3D Seismic Time Volume
% Pricipal Component Calculation based on input od Spectral Decomposition

    pars.nrinputs = 1; % Number of Seismic Volume Input
    pars.SamplingInterval = 4; % Sampling Interval in msec
    pars.WindowSize = 100; % Time Window in msec
    pars.FrequencyRangeMin = 6; % Frequency (Hz) Range - Min for Calculation
    pars.FrequencyRangeMax = 60; % Frequency (Hz) Range - Max for Calculation
    pars.FrequencySteps = 3; % Frequency (Hz) Range - Steps for Calculation
    pars.PrincipalComponent = 1; % Principal Components
    
end