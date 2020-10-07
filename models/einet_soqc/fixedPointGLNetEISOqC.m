function fp = fixedPointGLNetEISOqC(par, s, r)
    if isscalar(s) && isscalar(r)
        [xS,yS,zS] = fixedPointGLNetEISOqC_internal(par, s, r);
    else
        n = max([numel(r),numel(s)]);
        s = ones(1,n).*s;
        r = ones(1,n).*r;
        xS = cell(1,n);
        yS = cell(1,n);
        zS = cell(1,n);
        for i = 1:n
            [xS{i},yS{i},zS{i}] = fixedPointGLNetEISOqC_internal(par, s(i), r(i));
        end
    end
    fp = struct('xS',[],'yS',[],'zS',[]);
    fp.xS = xS;
    fp.yS = yS;
    fp.zS = zS;
end

function [rhoS,WS,thetaS] = fixedPointGLNetEISOqC_internal(par, s, r)
    sz = getSizeLargestField(par);
    if (s < 0) && (r < 0) % the solution with theta > 0
        rhoS = 1./(par.T .* par.u) + zeros(sz);
        WS = par.A./2 + zeros(sz);
        thetaS = par.I + ( (par.J.*par.p-par.q.*WS) - 1./(par.G.*(1-rhoS)) ).*rhoS;
    else
        thetaS = zeros(sz);
        WS = reshape(getRoot_mex(calc_W_poly_coeff(par,sz),convertToInt(s,r),1),sz); % gets root 1,2 or 3 of the polynomial for W
        rhoS = (par.A-WS)./(par.u.*WS.*par.T);
    end
    ind = ((imag(rhoS) == 0) & (real(rhoS) <= 1) & (real(rhoS) >= 0)) & ((imag(WS) == 0) & (real(WS) >= 0)) & (real(thetaS) >= 0);
    rhoS(~ind) = NaN;
    WS(~ind) = NaN;
    thetaS(~ind) = NaN;
end

function c = calc_W_poly_coeff(par,sz)
    c1 = zeros(sz) + par.q.*par.G.*(1+par.u.*par.T);
    c2 = zeros(sz) + (-1).*par.J.*par.p.*par.G.*(1+par.u.*par.T)+(-1).*par.A.*par.q.*par.G.*(2+par.u.*par.T)+par.u.*par.T.*(1+par.G.*par.I+par.u.*par.G.*par.I.*par.T);
    c3 = zeros(sz) + par.A.*(par.A.*par.q.*par.G+(-1).*par.u.*(1+par.G.*par.I).*par.T+par.J.*par.p.*par.G.*(2+par.u.*par.T));
    c4 = zeros(sz) + (-1).*par.A.^2.*par.J.*par.p.*par.G;
    if sz(1) == 1
        c = [c1;c2;c3;c4];
    else
        c = [c1';c2';c3';c4'];
    end
end

function n = convertToInt(s,r)
    n = bin2dec(sprintf('%d',(s+1)/2,(r+1)/2));
end

function sz = getSizeLargestField(p)
    f = fieldnames(p);
    [~,k] = max(structfun(@(x)max(size(x)),p));
    sz = size(p.(f{k}));
end