function [y_w,e,w]=lms_algo(x,z,u,order)
    N_w=order+1;
    N=length(x);
    
    w=zeros(N,N_w);
    y_w=zeros(N-N_w,1);
    e=zeros(N-N_w,1);
   %common case, start from time 1
    for i=N_w:N
        
        %select x and z
        x_w=x(i:-1:i+1-N_w);
        
        %algorithm starts
        y_w(i)=w(i,:)*x_w;
        e(i)=z(i)-y_w(i);
        w(i+1,:)=w(i,:)+u*e(i)*x_w';%w is listed in row
        
    end 
end