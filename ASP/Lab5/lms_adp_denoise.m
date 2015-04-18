function [y_w,e,w]=lms_adp_denoise(x,z,order)
    N_w=order;
    N=length(x);
    
    w=zeros(N,N_w);
    y_w=zeros(N-N_w,1);
    e=zeros(N-N_w,1);
    
    maximum=0.005;
    minimum=10^-4;
    max_u=1;
    min_u=10^-5;
    u=0.01;
    
   %common case, start from time 1
    for i=N_w:N
        
        %select x and z
        x_w=x(i:-1:i+1-N_w);
        
        %algorithm starts
        y_w(i)=w(i,:)*x_w;
        e(i)=z(i)-y_w(i);   
        
        %u=min(max((max_u-min_u)/(maximum-minimum)*(e(i)-minimum)+min_u,0.01),0.1);
        w(i+1,:)=w(i,:)+u*e(i)*(x_w)';%w is listed in row
        
    end 
end