function fp = fixedPointKTTanh(par, ~, ~)
%function [xS,yS,p] = fixedPointKTTanh(par, s, ~)
%     if (nargin < 2) || isempty(s)
%         s = 1e4;
%     end
    parName = GetBifPar(par);
    nPar = numel(par.(parName{1}));
%     xx = linspace(-1,1,s); % 1/s is the precision of the calculated FP
%     xS = NaN(1,3*nPar); % max 3 fp per param pair
%     yS = xS;
%     p = par;
    xS = repmat({NaN(1,nPar)},1,3); % max 3 fp per param pair
    yS = xS;
    parFN = fieldnames(par);
%     n = 0;
    for k = 1:nPar
        [~,fp] = nullclinesKTTanh(getParam(par,parFN,k),[],true);
        for i = 1:numel(fp.x)
            xS{i}(k) = fp.x(i);
            yS{i}(k) = fp.y(i);
        end
%         xS((n+1):(n+numel(fp.x))) = fp.x;
%         yS((n+1):(n+numel(fp.y))) = fp.y;
%         for i = 1:numel(parName)
%             p.(parName{i})((n+1):(n+numel(fp.x))) = repmat(par.(parName{i})(k),1,numel(fp.x));
%         end
%         n = n + numel(fp.x);
    end
%     ind = isnan(xS);
%     xS(ind) = [];
%     yS(ind) = [];
    fp = struct('xS',[],'yS',[]);
    fp.xS = xS;
    fp.yS = yS;
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