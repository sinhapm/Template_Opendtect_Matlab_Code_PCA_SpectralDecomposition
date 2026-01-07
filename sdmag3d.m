function [sd_mag_out4pca, ns, nxline, ninline] = ...
    sdmag3d( seis3d_in1, sampint, Nwms, freq_range)
% PCA based on Spectral Decomposition - Magnitude - LSA
% The Program performs the Spectral Decomposition (Phase) based on Least
% Square Analysis & then compute the PCA. Note Input seismic cube trace
% should not contain any Null / NAN value, program does not discard the
% NULL / NAN but assign it to as zero value.

%% Tolerance Criteria for Null Traces
    epsilon_value=10^-2; 
    opendtect_nan=1.0e+30; % The Value is defined NULL via Opendtect volume builder.

%% Initialize the Empty 3D Seismic Volume and other parameters etc.
    % Input Format of 3D Seismic from Opendtect
    % Dimension: TWT x Xline x Inline
    % Dimension: (TWT,Xline,Inline)
    % ns = number of time samples
    % nxline = number of XLines
    % ninline = number of InLines
    [ns,nxline,ninline] =size(seis3d_in1);
    len_freq_range=length(freq_range);
    sd_mag_out4pca=zeros(ns*nxline*ninline,len_freq_range);

  
%% Call the Function to perform the Phase Decomposition of the 3D seismic cube
    cnt=1;
    for XL=1:nxline
        for INL=1:ninline
            
            trace=seis3d_in1(:,XL,INL);
            
            if (sum(abs(trace))<=epsilon_value) || ...
                    (trace(1)>=opendtect_nan) || ...
                    (sum(double(isnan(trace)))==1)
                
                sd_mag=zeros(ns,len_freq_range); % Retrun the near Zero Traces as zero
                
            else
                % Call function 'func_SpectralDecomposition' to perform Spectral Decomposition
                % Decomposition
                % Output: 'sd' Dimension: TWT X Frequency Range
                [sd]= func_SpectralDecomposition(trace,sampint,Nwms,freq_range);
                
                % Magnitude of the Spectrum Result
                [sd_mag]=func_compute_mag_phase_voice(sd);
            
            end
            r1=cnt;
            r2=cnt-1+ns;
            sd_mag_out4pca(r1:r2,:)=sd_mag;
            cnt=r2+1;
        end
    end

end