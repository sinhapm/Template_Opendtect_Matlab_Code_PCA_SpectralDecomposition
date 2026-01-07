function [magnitude]=func_compute_mag_phase_voice(data)
% [magnitude,phase,voice]=func_compute_mag_phase_voice(data)
        %Compute the Magnitude, Phase(in Degree) & Voice Component
   
        magnitude=abs(data);

%         phase=atan2(imag(data), real(data))*180/pi;         
%         
%         voice=magnitude.*cos(phase*pi/180);
        
end