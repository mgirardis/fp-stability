function fp = fixedPointKT2Tanh(par, ~, ~)

    parName = GetBifPar(par);
    nPar = numel(par.(parName{1}));

    xS = repmat({NaN(1,nPar)},1,9); % max 6 fp per param pair because of 2 tanh
    yS = xS;
    parFN = fieldnames(par);

    for k = 1:nPar
        [~,fp] = nullclinesKT2Tanh(getParam(par,parFN,k),[],true);
        for i = 1:numel(fp.x)
            xS{i}(k) = fp.x(i);
            yS{i}(k) = fp.y(i);
        end

    end
    invalid_fp = cellfun(@(x)all(isnan(x)),xS);
    xS         = xS(~invalid_fp);
    yS         = yS(~invalid_fp);
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