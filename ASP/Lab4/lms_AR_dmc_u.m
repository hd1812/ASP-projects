function [y_w,e,w]=lms_AR_dmc_u(x,order)
    N_w=order;
    N=length(x);
    
    w=zeros(N,N_w);
    y_w=zeros(N-N_w,1);
    e=zeros(N-N_w,1);
   %common case, start from time 1
    for i=N_w:N-1
        
        %select x
        x_w=x(i:-1:i+1-N_w);
        
        %algorithm starts
        y_w(i)=w(i,:)*x_w;
        e(i)=x(i+1)-y_w(i);
        u=dmc_u(e(i));
        w(i+1,:)=w(i,:)+u*e(i)*x_w';%w is listed in row
        
    end 
end