function [xS,zS] = fixedPointKTzTanh(par, ~, ~)
%function [xS,zS,p] = fixedPointKTzTanh(par, s, ~)
%     if (nargin < 2) || isempty(s)
%         s = 1e4;
%     end
    parName = GetBifPar(par);
    nPar = numel(par.(parName{1}));
%     xx = linspace(-1,1,s); % 1/s is the precision of the calculated FP
%     xS = NaN(1,3*nPar); % max 3 fp per param pair
%     zS = xS;
%     p = par;
    xS = repmat({NaN(1,nPar)},1,3); % max 3 fp per param pair
    zS = xS;
    parFN = fieldnames(par);
%     n = 0;
    for k = 1:nPar
        [~,fp] = nullclinesKTzTanh(getParam(par,parFN,k),[],true);
        for i = 1:numel(fp.x)
            xS{i}(k) = fp.x(i);
            zS{i}(k) = fp.z(i);
        end
%         xS((n+1):(n+numel(fp.x))) = fp.x;
%         zS((n+1):(n+numel(fp.z))) = fp.z;
%         for i = 1:numel(parName)
%             p.(parName{i})((n+1):(n+numel(fp.x))) = repmat(par.(parName{i})(k),1,numel(fp.x));
%         end
%         n = n + numel(fp.x);
    end
%     ind = isnan(xS);
%     xS(ind) = [];
%     zS(ind) = [];
end

function p = getParam(par,fn,k)
    p = par;
    for i = 1:numel(fn)
        p.(fn{i}) = getValue(par.(fn{i}),k);
    end
end

function v = getValue(p,k)
    if numel(p) >= k
        v = p(k);
    else
        v = p;
    end
end

function pName = GetBifPar(par)
    fn = fieldnames(par)';
    nn = zeros(1,numel(fn));
    for i = 1:numel(fn)
        nn(i) = numel(par.(fn{i}));
    end
    pName = fn(nn == max(nn));
end