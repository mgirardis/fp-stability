function lambda = eigenvalJacobGLNetEISOqC(par)
    if iscell(par.xS)
        n = numel(par.xS);
        lambda = cell(size(par.xS));
        for i = 1:n
            lambda{i} = eigenvalJacobGLNetEISOqC_internal(get_par_for_single_FP(par,i));
        end
    else
        lambda = eigenvalJacobGLNetEISOqC_internal(par);
    end
end

function park = get_par_for_single_FP(par,k)
    park = par;
    park.xS = par.xS{k};
    park.yS = par.yS{k};
    park.zS = par.zS{k};
end

function lambda = eigenvalJacobGLNetEISOqC_internal(par)
    lambda = getRoots_mex(calc_Lambda_poly_coeff(par),1);
end

function c = calc_Lambda_poly_coeff(par)
    sz = getSizeLargestField(par);
    c1 = -1+zeros(sz);
    c2 = zeros(sz) + 2+par.G.*(par.zS+(-1).*par.I+par.q.*par.yS.*((-1)+2.*par.xS)+par.J.*(par.p+(-2).*par.p.*par.xS))+(-2).*par.T.^(-1);
    c3 = zeros(sz) + par.T.^(-2).*((-1)+par.T.*(2+2.*par.G.*(par.zS+(-1).*par.I)+2.*par.J.*par.p.*par.G.*((-1)+2.*par.xS).*((-1)+par.T)+(-1).*par.T+(2.*par.G.*par.I+par.G.*par.zS.*((-2)+par.u.*((-1)+par.xS))+par.u.^2.*par.xS.^2).*par.T+par.q.*par.yS.*par.G.*(2.*((-1)+par.T)+par.xS.*(4+((-4)+par.u+(-1).*par.u.*par.xS).*par.T))));
    c4 = zeros(sz) + par.G.*par.T.^(-2).*(par.J.*par.p.*((-1)+2.*par.xS).*((-1)+par.T+par.u.*par.xS.*par.T).*(1+((-1)+par.u.*par.xS).*par.T)+(1+((-1)+par.u.*par.xS).*par.T).*(par.zS+(-1).*(1+par.u).*par.zS.*par.T+par.I.*((-1)+par.T+par.u.*par.xS.*par.T))+(-1).*par.q.*par.yS.*((-1)+par.T+par.u.*par.xS.*par.T).*((-1)+par.T+par.xS.*(2+((-2)+par.u.*par.xS).*par.T)));
    if sz(1) == 1
        c = [c1;c2;c3;c4];
    else
        c = [c1';c2';c3';c4'];
    end
end

function sz = getSizeLargestField(p)
    f = fieldnames(p);
    [~,k] = max(structfun(@(x)max(size(x)),p));
    sz = size(p.(f{k}));
end