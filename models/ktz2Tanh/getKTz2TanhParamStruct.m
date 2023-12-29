function par = getKTz2TanhParamStruct(K, T, d, l, xR, H, Q)
    if (nargin < 7) || isempty(Q)
        Q = [];
    end
    par.K  = K;
    par.T  = T;
    par.Q  = Q;
    par.d  = d;
    par.l  = l;
    par.xR = xR;
    par.H  = H;
end