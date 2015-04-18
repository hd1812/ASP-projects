function [MDL,AIC,EP]=mdl_aic_ep(data,order,coefs);
    N=1000;
    coef_n=order+1;
    m=mean(data);
    data=data-m;

    EP=zeros(coef_n,1);
    MDL=zeros(coef_n,1);
    AIC=zeros(coef_n,1);
    
    y = zeros(N,coef_n);
    for i = 1:order
        coefs_sel=coefs(1:i);
        y(:,i) = filter([1 coefs_sel],1,data)-data;
    end

    for i=1:coef_n
        for j=1:N
            EP(i)=(y(j,i)-data(j,1))^2+EP(i,1);
        end
    end
    
    for i=1:coef_n
        MDL(i,1)=log(EP(i,1))+i*log(N)/N;
        AIC(i,1)=log(EP(i,1))+2*i/N;
    end
end