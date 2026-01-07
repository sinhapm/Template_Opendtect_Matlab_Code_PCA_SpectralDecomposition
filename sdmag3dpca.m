function pca_out = sdmag3dpca( sd_mag_out4pca, ...
    principalcomponent,nts,nxline,ninline)


    % De-mean
    X =(sd_mag_out4pca - mean(sd_mag_out4pca))./std(sd_mag_out4pca);
    
    % Do the PCA
    [~,score,~] = pca(X);

%     [~,score,latent] = pca(X);
% 
%     ncolumn=length(latent);
%     latent_cum=latent./sum(latent)*100;
%     
%     for ii=2: ncolumn
%         latent_cum(ii,1)=latent_cum(ii-1,1)+latent_cum(ii,1);
%     end
%   
%     figure;plot(1:ncolumn,latent_cum,'k','Linewidth', 2); 
%     grid on;xlim([0 ncolumn]); ylim([0 110]);
%     xlabel('Principal Component Band Number');
%     ylabel('Contribution Percentage (%)'); hold on;
%     bar(1:ncolumn,latent./sum(latent)*100);
%     
    pca_out=zeros(nts,nxline,ninline);
    cnt=1;
    
    for ii=1:nxline
        for jj=1:ninline
            r1=cnt;
            r2=cnt-1+nts;
            pca_out(:,ii,jj)=score(r1:r2,principalcomponent);
            cnt=r2+1;
        end      
    end
    
end
