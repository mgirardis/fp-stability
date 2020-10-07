function lambda = eigenvalJacobKTTanh(par)
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
    %H = par.H(:)'; %implicitly inside xS
    xS = par.xS(:)';
    xS2T2 = (1 - xS.*xS)./(2.*T);
    s = sqrt(1 - 2.*K./xS2T2);
    lambda = [ xS2T2 .* (1 + s); xS2T2 .* (1 - s)];
end