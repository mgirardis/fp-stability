function fp = getFixedPoints(par,fp,Lambda)
    [bif_param,bif_param_name] = GetBifPar(par);
    parWindow = 1;
    x = {};
    z = {};
    p = {};
    e = {};
    t = {};

    % we need three FP variables because KT has 2 and KTz has 3 FPs
    for j = 1:numel(fp.xS)
        k = isnan(fp.xS{j}); % the FP is NaN where it does not exist
        if all(k)
            continue;
        end
        % this is where the trick happens
        % we just use FP that are not NaN's
        [xx,zz,pp,ee,tt] = splitFP_EV(fp.xS{j}(~k),fp.zS{j}(~k),bif_param(~k),Lambda{j}(:,~k),parWindow);
        
        % just separate the fp returned by the above function into their own cell
        x((numel(x)+1):(numel(x)+numel(xx))) = xx;
        z((numel(z)+1):(numel(z)+numel(zz))) = zz;
        p((numel(p)+1):(numel(p)+numel(pp))) = pp;
        e((numel(e)+1):(numel(e)+numel(ee))) = ee;
        t((numel(t)+1):(numel(t)+numel(tt))) = tt;
    end

    y = x; % y* = x* in KT(z)
    fp = struct('xS', x, 'yS', y, 'zS', z, 'ev', e, 'type', t, 'par', p, 'parName', bif_param_name, 'fpName', 'x^*,y^*,z^*', 'fixedParam', par);
    fp = eliminateEqualFP(fp);
end

function fp = eliminateEqualFP(fp)
    n = numel(fp);
    k = [];
    for i = 1:n
        for j = (i+1):n
            if isEqualFP(fp(i),fp(j))
                k(end+1) = j;
            end
        end
    end
    fp(unique(k)) = [];
end

function r = isEqualFP(fp1,fp2)
    r = false;
    if (numel(fp1.xS) == numel(fp2.xS)) && strcmpi(fp1.type,fp2.type) % the fps have the same amount of values in their domains and are of the same type
        r = all( abs(fp1.xS - fp2.xS) < 1e-10 ) &&... % the values of all xS are equal (within 1e-10 error)
            all( abs(fp1.zS - fp2.zS) < 1e-10 ) &&... % the values of all zS are equal (within 1e-10 error)
            (fp1.par(1) == fp2.par(1)) && (fp1.par(end) == fp2.par(end)); % the parameter domain is the same
    end
end


function [x,z,p,e,t] = splitFP_EV(xSTemp,yS_or_zS_Temp,pTemp,evTemp,parWindow)
% this function splits the FP into cell arrays
% according to FP stability
    [ind, type] = getFPTypeInterval(evTemp,parWindow); % <- this is the magical function
    x = cell(1,numel(ind));
    z = cell(1,numel(ind));
    p = cell(1,numel(ind));
    e = cell(1,numel(ind));
    t = cell(1,numel(ind));
    for m = 1:numel(ind)
        x{m} = xSTemp(ind{m});
        z{m} = yS_or_zS_Temp(ind{m});
        p{m} = pTemp(ind{m});
        e{m} = evTemp(:,ind{m});
        t{m} = type{m};
    end
end

function [ind, type] = getFPTypeInterval(ev,parWindow)
% THIS IS THE MAGICAL FUNCTION
    ind = {};
    type = {};
    
    % stable FP obey this condition
    indSt = all((abs(ev)-1) <= 0,1);
    
    % unstable FP obey this condition
    indUn = all((abs(ev)-1)  > 0,1) & ~indSt;
    
    % saddle FP are the remaining ones
    indSd = ~indSt & ~indUn;

    % generate continuous intervals on the parameter for each of the conditions above
    indSt = breakIntoContIntervals(find(indSt),parWindow);
    indUn = breakIntoContIntervals(find(indUn),parWindow);
    indSd = breakIntoContIntervals(find(indSd),parWindow);

    % just an extra condition to be consistent
    if numel(indSt) > 0
        for i = 1:numel(indSt)
            ind{end+1} = indSt{i};
            type{end+1} = 'stable';
        end
    end
    if numel(indUn) > 0
        for i = 1:numel(indUn)
            ind{end+1} = indUn{i};
            type{end+1} = 'unstable';
        end
    end
    if numel(indSd) > 0
        for i = 1:numel(indSd)
            ind{end+1} = indSd{i};
            type{end+1} = 'saddle';
        end
    end
end

function k = breakIntoContIntervals(ind,parWindow)
    if isempty(ind)
        k = [];
        return
    end
    k = {};
    ji = 1;
    for i = 2:numel(ind)
        if ((ind(i) - ind(i-1)) > parWindow)
            k{end+1} = ind(ji:(i-1));
            ji = i;
        end
    end
    k{end+1} = ind(ji:end);
end

function [y,ind] = splitNaN(x)
    n = length(x);
    y = {};
    ind = {};
    startIndex = n;
    found = 0;
    k = 1;
    for i = 1:n
        if (isnan(x(i)))
            if (i > startIndex)
                ind{k} = startIndex:i-1;
                y{k} = x(ind{k});
                startIndex = n;
                k = k + 1;
                found = 0;
            end
        else
            if (~found)
                startIndex = i;
                found = 1;
            end
        end
    end
    if ~isnan(x(n))
        ind{k} = startIndex:n;
        y{k} = x(ind{k});
    end
end

function [parmito,parmitoName] = GetBifPar(par)
    fn = fieldnames(par)';
    parmito = par.(fn{1});
    parmitoName = fn{1};
    for i = 2:numel(fn)
        if numel(par.(fn{i})) > numel(parmito)
            parmito = par.(fn{i});
            parmitoName = fn{i};
        end
    end
end