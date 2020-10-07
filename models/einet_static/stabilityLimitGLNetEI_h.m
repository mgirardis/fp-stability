function [hFlip,hFP,hHalf,hC,h0] = stabilityLimitGLNetEI_h(par)
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

%     hh1 = @(W,G,s) (-1 - G.*W + s.*2.*sqrt(1+G.*W))./G;
%     hh2 = @(W,G,s) (-1 - G.*W + s.*2.*sqrt(G.*W))./G;
    s = [1    0     1    0];
    k = [1    1    -1   -1];
    hh1 = @(W,G,k,s) (-1).*G.^(-1).*(1+W.*G)+k.*s.^(-1).*G.^(-1).*(1+s.*(3+4.*W.*G)).^(1/2); % flip
    hh2 = @(W,G,k,s) (-1).*s.^(-1).*G.^(-1).*(k+(s.*W.*G).^(1/2)).^2; % FP
    hh3 = @(W,G,s) (2-W.*G.*s)./(2.*G.*s); % FP > 1/2
    hh4 = @(W,G,k,s) (-1).*W+s.^(-1).*G.^(-1).*((-1)+k.*(1+4.*s.*W.*G).^(1/2)); % Lambda=0

    hHalf = fixCurve(hh3(par.W,par.G0,1));
    hFlip = cell(size(s));
    hFP   = cell(size(s));
    hC   = cell(size(s));
    k1 = [];
    k2 = [];
    k4 = [];
    for i = 1:numel(s)
        [hFlip{i},allNaN1] = fixCurve(hh1(par.W,par.G0,k(i),s(i)));
        [hFP{i},allNaN2] = fixCurve(hh2(par.W,par.G0,k(i),s(i)));
        hFP{i} = fixTranscBif(hFP{i},par.W,par.G0);
        allNaN2 = allNaN2 && all(isnan(hFP{i}));
        [hC{i},allNaN4] = fixCurve(hh4(par.W,par.G0,k(i),s(i)));
        if allNaN1
            k1(end+1) = i;
        end
        if allNaN2
            k2(end+1) = i;
        end
        if allNaN4
            k4(end+1) = i;
        end
    end
    hFlip(k1) = [];
    hFP(k2) = [];
    hC(k4) = [];
    hFlip = eliminateEqualCurves(hFlip);
    hFP = getTopCurve(eliminateEqualCurves(hFP));
    hC = eliminateEqualCurves(hC);
    h0 = getZeroFieldLim(par.W,par.G0);
end

function h = getZeroFieldLim(W,G)
    if isscalar(W)
        h = NaN(size(G));
        h((G>(-1/abs(W))) & (G<(1/abs(W)))) = 0;
    else
        h = NaN(size(W));
        h((W>(-1/abs(G))) & (W<(1/abs(G)))) = 0;
    end
end

function h = getTopCurve(hh)
    h = max(cell2mat(hh'),[],1);
end

function h = fixTranscBif(h,W,G)
    if isscalar(W)
        h(G<1./W) = NaN;
    else
        h(W<1./G) = NaN;
    end
end

function [h,allNaN] = fixCurve(h)
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
