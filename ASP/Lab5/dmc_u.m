function u=dmc_u(e)
    maximum=0.001;
    minimum=0.0001;
    max_u=0.1;
    min_u=0.001;
    e_square=e.^2;
    if e_square>maximum
        u=max_u;
    elseif e_square>minimum
        u=(max_u-min_u)/(maximum-minimum)*(e_square-minimum)+min_u;
    else
        u=min_u;
    end
end