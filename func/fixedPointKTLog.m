function [xS,yS] = fixedPointKTLog(par, s, r)
    if isscalar(s) && isscalar(r)
        xS = fixedPointKTLog_internal(par, s, r);
    else
        n = max([numel(r),numel(s)]);
        s = ones(1,n).*s;
        r = ones(1,n).*r;
        xS = cell(1,n);
        for i = 1:n
            xS{i} = fixedPointKTLog_internal(par, s(i), r(i));
        end
    end
    yS = xS;
end

function xS = fixedPointKTLog_internal(par, s, r)
    %par = struct with K, T, H parameters values
    xS = (s ./ (2 .* (1-par.K))) .* (1-par.K-par.T-s.*par.H + r .* s .* sqrt((1-par.K+s.*par.H-par.T).^2  + 4.*s.*par.H.*par.T));
    if s > 0
        ind = (abs(real(xS)) <= 1) & (imag(xS) == 0) & ((1-par.K).*xS+par.H)>=0;
        xS(~ind) = NaN;
    else
        ind = (abs(real(xS)) <= 1) & (imag(xS) == 0) & ((1-par.K).*xS+par.H)<0;
        xS(~ind) = NaN;
    end
end