function u=dmc_u(e)
    maximum=60;
    minimum=1;
    max_u=0.05;
    min_u=0.01;
    e_square=e.^2;
    if e_square>maximum
        u=max_u;
    elseif e_square>minimum
        u=(max_u-min_u)/(maximum-minimum)*(e_square-minimum)+min_u;
    else
        u=min_u;
    end
end