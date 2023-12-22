function par = getKTz2TanhParamStruct(K, T, d, l, xR, H, Z)
    if (nargin < 7) || isempty(Z)
        Z = [];
    end
    par.K = K;
    par.T = T;
    par.Z = Z;
    par.d = d;
    par.l = l;
    par.xR = xR;
    par.H = H;
end