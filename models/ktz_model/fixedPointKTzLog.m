function fp = fixedPointKTzLog(par, s, r)
% par = struct with K, T, d, l, xR parameters values
%     indN = par.T < 0;
%     par.T = abs(par.T);
    if isscalar(s) && isscalar(r)
        xS = fixedPointKTLog_internal(par, s, r);
    else
        n = max([numel(r),numel(s)]);
        s = ones(1,n).*s;
        r = ones(1,n).*r;
        xS = cell(1,n);
        zS = cell(1,n);
        for i = 1:n
            [xS{i},zS{i}] = fixedPointKTzLog_internal(par, s(i), r(i));
        end
    end
    fp = struct('xS',[],'zS',[]);
    fp.xS = xS;
    fp.zS = zS;
end

function [xS,zS] = fixedPointKTzLog_internal(par, s, r)
    alpha = par.l ./ par.d;
    xS = (s ./ (2.*(1-par.K-alpha))) .* (1-par.K-par.T-alpha.*(s.*par.xR+1) + s .* r.* sqrt((par.K+par.T+alpha-1).^2 + (alpha.*par.xR).^2 + 2.*s.*alpha.*par.xR.*(1-par.K-alpha+par.T)));
    zS = alpha .* (par.xR - xS);
    if s > 0
        ind = (abs(real(xS)) <= 1) & (imag(xS) == 0) & ((1-par.K).*xS+zS)>=0;
        xS(~ind) = NaN;
        zS(~ind) = NaN;
    else
        ind = (abs(real(xS)) <= 1) & (imag(xS) == 0) & ((1-par.K).*xS+zS)<0;
        xS(~ind) = NaN;
        zS(~ind) = NaN;
    end
%     if numel(par.T) > 1
%         xS(indN) = -xS(indN);
%     else
%         if par.T < 0
%             xS = -xS;
%         end
%     end
end