function lambda = eigenvalJacobKT2Tanh(par)
    if iscell(par.xS)
        xS = par.xS;
        lambda = cell(size(xS));
        for i = 1:numel(xS)
            par.xS = xS{i};
            lambda{i} = eigenvalJacobKTTanh_internal(par);
        end
    else
        lambda = eigenvalJacobKTTanh_internal(par);
    end
end

function lambda = eigenvalJacobKTTanh_internal(par)
    K = par.K(:)';
    T = par.T(:)';
    H = par.H(:)';
    %Q = par.Q(:)';

    v  = par.xS(:)';
    y  = tanh( (v+H)./T );
    A  = (1 - v.*v)./(2.*T);
    B  = sqrt(    (1-v.^2)  .*     (     1-v.^2 -4.*K .*  (1-y.^2)      )       )./(2.*T);
    lambda = [ A + B; A - B];
end