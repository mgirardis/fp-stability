function lambda = eigenvalJacobGLNetEISOqCFull(par)
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
    sz = getSizeLargestField(par);
    c = calc_Lambda_poly_coeff(par,sz);
    nan_idx = find(any(isnan(c),1));
    c(:,nan_idx) = repmat([1;0;0;0],1,numel(nan_idx));
    lambda = getRoots_mex(c,1);
    lambda(:,nan_idx) = NaN;
end

function c = calc_Lambda_poly_coeff(par,sz)
    c1 = -1+zeros(sz);
    c2 = zeros(sz) + 2+par.G.*(par.zS+(-1).*par.I+par.q.*par.yS.*((-1)+2.*par.xS)+par.J.*(par.p+(-2).*par.p.*par.xS))+(-1).*par.tauT.^(-1)+(-1).*par.tauW.^(-1);
    c3 = zeros(sz) + par.tauT.^(-1).*par.tauW.^(-1).*((-1)+(1+(-1).*par.u.*par.xS+par.G.*(par.zS+(-1).*par.I+par.q.*par.yS.*((-1)+2.*par.xS)+par.J.*(par.p+(-2).*par.p.*par.xS))).*par.tauW+par.tauT.*(1+par.u.*par.xS+par.G.*(par.zS+(-1).*par.I+par.q.*par.yS.*((-1)+2.*par.xS)+par.J.*(par.p+(-2).*par.p.*par.xS))+((-1)+(-1).*par.G.*(2.*par.J.*par.p+(-2).*par.q.*par.yS+(2+par.u).*par.zS+(-2).*par.I)+par.G.*(4.*par.J.*par.p+par.q.*((-4)+par.u).*par.yS+par.u.*par.zS).*par.xS+par.u.*(par.u+(-1).*par.q.*par.yS.*par.G).*par.xS.^2).*par.tauW));
    c4 = zeros(sz) + par.G.*par.tauT.^(-1).*par.tauW.^(-1).*(par.zS+(-1).*par.I+par.q.*par.yS.*((-1)+2.*par.xS)+par.J.*(par.p+(-2).*par.p.*par.xS)+((par.zS+(-1).*par.I).*((-1)+par.u.*par.xS)+(-1).*par.J.*par.p.*((-1)+2.*par.xS).*((-1)+par.u.*par.xS)+par.q.*par.yS.*(1+par.xS.*((-2)+par.u.*par.xS))).*par.tauW+par.tauT.*(par.q.*par.yS+(-1).*(1+par.u).*par.zS+par.I+par.u.*par.I.*par.xS+par.q.*par.yS.*par.xS.*((-2)+par.u+(-2).*par.u.*par.xS)+par.J.*par.p.*((-1)+2.*par.xS).*(1+par.u.*par.xS)+(((-1)+par.u.*par.xS).*(((-1)+(-1).*par.u).*par.zS+par.I+par.u.*par.I.*par.xS)+par.J.*par.p.*((-1)+2.*par.xS).*((-1)+par.u.^2.*par.xS.^2)+(-1).*par.q.*par.yS.*(1+par.u.*par.xS).*(1+par.xS.*((-2)+par.u.*par.xS))).*par.tauW));
    if isvector(c1)
        if sz(1) == 1
            c = [c1;c2;c3;c4];
        else
            c = [c1';c2';c3';c4'];
        end
    else
        c = [reshape(c1,1,[]);reshape(c2,1,[]);reshape(c3,1,[]);reshape(c4,1,[])];
    end
end

function sz = getSizeLargestField(p)
    f = fieldnames(p);
    [~,k] = max(structfun(@(x)max(size(x)),p));
    sz = size(p.(f{k}));
end