function [h1,h2,hHalf] = stabilityLimitGLNetEI_h_Full(par)
% this function returns the stability limits as function of a given paramater
% inside the par struct
% par struct must contain only one parameter which is a vector of points where the h will be evaluated
%
% the h functions below were calculated by hand (Mathematica)
%
% the algorithm for this function is like follows:
% 1) calculates the GG functions for all the interval given in the vector parameter
% 2) replaces non-real or infinity by NaN solutions (deletes completely complex or infinity solutions)
%
% returns: h is a 1xn cell array where n is the number of remaining solutions

    s = [1     1     0     0     1     1     0     0];
    r = [1     0     1     0     1     0     1     0];
    k = [1     1     1     1    -1    -1    -1    -1];

    hh1 = @(W,G,s,r,k) ((-1)+r).^(-1).*s.^(-1).*G.^(-1).*(1+r+(-1).*((-1)+r).*s.*W.*G+2.*k.*(1+(-1).*((-1)+r).*s.*W.*G).^(1/2));
    hh2 = @(W,G,s,r,k) (-1).*(s.*G+(-1).*r.*s.*G).^(-1).*(1+r+s.*W.*G+(-1).*r.*s.*W.*G+2.*k.*W.*((-1).*((-1)+r).*s.*W.^(-1).*G).^(1/2));
    hh3 = @(W,G) (2-W.*G)/(2.*G);

    hHalf = eliminateImagInf(hh3(par.W,par.G0));

    h1 = cell(1,numel(s));
    h2 = cell(1,numel(s));
    k1 = [];
    k2 = [];
    for i = 1:numel(s)
        h1{i} = hh1(par.W,par.G0,s(i),r(i),k(i));
        h2{i} = hh2(par.W,par.G0,s(i),r(i),k(i));
        [h1{i},allNaN1] = eliminateImagInf(h1{i});
        [h2{i},allNaN2] = eliminateImagInf(h2{i});
        if allNaN1
            k1(end+1) = i;
        end
        if allNaN2
            k2(end+1) = i;
        end
    end
    h1(k1) = [];
    h2(k2) = [];
    h1 = eliminateEqualCurves(h1);
    h2 = eliminateEqualCurves(h2);
end

function [h,allNaN] = eliminateImagInf(h)
    ind = (imag(h) ~= 0) | isinf(h);
    h(ind) = NaN;
    allNaN = all(isnan(h(:)));
end

function h = eliminateEqualCurves(h)
    n = numel(h);
    k = [];
    for i = 1:n
        for j = (i+1):n
            if isEqualCurve(h{i},h{j})
                k(end+1) = j;
            end
        end
    end
    h(k) = [];
end

function r = isEqualCurve(h1,h2)
    r = false;
    if (numel(h1) == numel(h2))
        r = all( abs(h1 - h2) < 1e-10 );
    end
end
