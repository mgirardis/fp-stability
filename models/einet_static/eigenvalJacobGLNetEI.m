function lambda = eigenvalJacobGLNetEI(par)
    if iscell(par.xS)
        n = numel(par.xS);
        lambda = cell(size(par.xS));
        for i = 1:n
            lambda{i} = eigenvalJacobGLNetEI_internal(get_par_for_single_FP(par,i));
        end
    else
        lambda = eigenvalJacobGLNetEI_internal(par);
    end
end

function park = get_par_for_single_FP(par,k)
    park = par;
    park.xS = par.xS{k};
    if isfield(par,'yS')
        park.yS = par.yS{k};
    end
    if isfield(par,'zS')
        park.zS = par.zS{k};
    end
end

function lambda = eigenvalJacobGLNetEI_internal(par)
    s = ones(size(par.xS));
    W = par.W;
    h = par.h;
    if isscalar(h)
        h = repmat(h,size(par.xS));
    end
    if isscalar(W)
        W = repmat(W,size(par.xS));
    end
    s((par.xS == 0) & (h < 0)) = 0;
    s((par.xS > 0) & ((W.*par.xS+h)<0)) = 0;
    l = s.*par.G0.*(-h + W.*(1 - 2.*par.xS)); % xS -> rhoS
    lambda = [ l(:)';...
               l(:)' ];
end