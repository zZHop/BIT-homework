function [ newData ] = extrc_pca( data_ )

orig_data = data_;
%orig_lab  = data.lab;

[COEFF,SCORE,latent] = princomp(zscore(orig_data));
per = cumsum(latent)./sum(latent);
cmpNum = find(per>0.99,1);
tranMatrix = COEFF(:,1:cmpNum);

newData =  orig_data * tranMatrix ;

end