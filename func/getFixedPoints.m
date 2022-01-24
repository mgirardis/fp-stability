function fp = getFixedPoints(par,fp,Lambda,fpFuncArgs,LambdaFuncArgs,fpNames,bif_param_name,bif_param_values,y_equals_x)
% par -> a struct with the parameters of the model (one of which may be a vector to use as a parameter for bifurcation)
% fp -> a struct with fields xS,yS,zS or a function handle to a function that returns xS,yS,zS (yS and zS are not necessary)
%     if fp is a truct:
%         fp.xS -> a numeric array with the values of the FP xS over the parameter range spanned by par
%                  or a cell array, in which each cell is a different FP on top of the range spanned by par
%                  (the same applies for yS and zS if they are present)
%     if fp is a function_handle, it must return xS,yS and zS according to the specification above
% Lambda -> the eigenvalues associated with xS,yS,zS or a function handle that returns these eigenvalues 
%     if xS is a cell, Lambda must be a cell of same size
%     each element of the cell Lambda must be a matrix with n rows, where n is the dimensionality of the FP (i.e. 1 if only xS, 2 if xS and yS, 3 if xS,yS,zS)
%     if Lambda is a numeric array, it must match the size of xS
% fpFuncArgs -> a cell of additional arguments to be passed to fp(par,fpFuncArgs{:}) if fp is function_handle
% LambdaFuncArgs -> a cell of additional arguments to be passed to Lambda(par,LambdaFuncArgs{:}) if Lambda is function_handle
% fpNames -> char vector containing a comma separated list of the names of the fixed points
% bif_param_name -> the name of the bifurcation parameter (must be a field in par; overrides par); if not given, we try to automatically estimate one from par
% bif_param_values -> values of the bifurcation parameter (if not given in par; overrides par, must come with the name in bif_param_name)
% y_equals_x -> true for KT(z) models; but false in general (this is just a reminiscent feature from my studies with the KT family of models)
    if (nargin < 4) || isempty(fpFuncArgs)
        fpFuncArgs = {};
    end
    if (nargin < 5) || isempty(LambdaFuncArgs)
        LambdaFuncArgs = {};
    end
    if (nargin < 6) || isempty(fpNames)
        fpNames = 'x^*,y^*,z^*';
    end
    if (nargin < 7) || isempty(bif_param_name)
        bif_param_name = '';
    end
    if (nargin < 8) || isempty(bif_param_values)
        bif_param_values = [];
    end
    if (nargin < 9) || isempty(y_equals_x)
        y_equals_x = false;
    end
    assert(isValidFP(fp),'Invalid value for fp: it must be either a struct with fields xS,yS,zS or a function handle that returns fp struct with fields xS,yS,zS');
    assert(isValidEV(Lambda),'Invalid value for Lambda: it must be either a numeric matrix (num of lines must match the dimension of the FP) or a function handle that returns a FP_dim X n matrix')
    
    if isempty(bif_param_name)
        [bif_param_values,bif_param_name] = GetBifPar(par);
    else
        par.(bif_param_name) = bif_param_values;
    end
    
    if isa(fp,'function_handle')
        fp = fp(par,fpFuncArgs{:});
    end
    fp = ensure_cell_fp(ensure_yS_zS(fp));
    
    if isa(Lambda,'function_handle')
        par = insert_fp_into_struct(par,fp);
        Lambda = Lambda(par,LambdaFuncArgs{:});
    end
    Lambda = ensure_cell(Lambda);
    
    if isfield(fp,'fpName')
        fpName = fp.fpNname;
    else
        fpName = fpNames;
    end
    
    parWindow = 1;
    x = {};
    y = {};
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
        [xx,yy,zz,pp,ee,tt] = splitFP_EV(fp.xS{j}(~k),fp.yS{j}(~k),fp.zS{j}(~k),bif_param_values(~k),Lambda{j}(:,~k),parWindow);
        
        % just separate the fp returned by the above function into their own cell
        x = expandVector(x,xx);
        y = expandVector(y,yy);
        z = expandVector(z,zz);
        p = expandVector(p,pp);
        e = expandVector(e,ee);
        t = expandVector(t,tt);
%         x((numel(x)+1):(numel(x)+numel(xx))) = xx;
%         y((numel(y)+1):(numel(y)+numel(yy))) = yy;
%         z((numel(z)+1):(numel(z)+numel(zz))) = zz;
%         p((numel(p)+1):(numel(p)+numel(pp))) = pp;
%         e((numel(e)+1):(numel(e)+numel(ee))) = ee;
%         t((numel(t)+1):(numel(t)+numel(tt))) = tt;
    end

    if y_equals_x
        y = x; % y* = x* in KT(z)
    end
    fp = struct('xS', x, 'yS', y, 'zS', z, 'ev', e, 'type', t, 'par', p, 'parName', bif_param_name, 'fpName', fpName, 'fixedParam', par);
    fp = eliminateEqualFP(fp);
end

function fp = ensure_yS_zS(fp)
    if ~isfield(fp,'yS')
        fp.yS = fp.xS;
    end
    if ~isfield(fp,'zS')
        fp.zS = fp.xS;
    end
end

function r = isValidFP(fp)
    r = isfield(fp,'xS') || isa(fp,'function_handle');
end

function r = isValidEV(ev)
    r = iscell(ev) || (isnumeric(ev) && ismatrix(ev)) || isa(ev,'function_handle');
end

function v = expandVector(v,vv)
    v((numel(v)+1):(numel(v)+numel(vv))) = vv;
end

function x = ensure_cell(x)
    if ~iscell(x)
        x = {x};
    end
end

function fp = ensure_cell_fp(fp)
    fp.xS = ensure_cell(fp.xS);
    if isfield(fp,'yS')
        fp.yS = ensure_cell(fp.yS);
    end
    if isfield(fp,'zS')
        fp.zS = ensure_cell(fp.zS);
    end
end

function par = insert_fp_into_struct(par,fp)
    if ~isfield(par,'xS')
        par.xS = fp.xS;
    end
    if ~isfield(par,'yS')
        if isfield(fp,'yS')
            par.yS = fp.yS;
        end
    end
    if ~isfield(par,'zS')
        if isfield(fp,'zS')
            par.zS = fp.zS;
        end
    end
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
            all( abs(fp1.yS - fp2.yS) < 1e-10 ) &&... % the values of all yS are equal (within 1e-10 error)
            all( abs(fp1.zS - fp2.zS) < 1e-10 ) &&... % the values of all zS are equal (within 1e-10 error)
            (fp1.par(1) == fp2.par(1)) && (fp1.par(end) == fp2.par(end)); % the parameter domain is the same
    end
end


function [x,y,z,p,e,t] = splitFP_EV(xSTemp,ySTemp,zSTemp,pTemp,evTemp,parWindow)
% this function splits the FP into cell arrays
% according to FP stability
    [ind, type] = getFPTypeInterval(evTemp,parWindow); % <- this is the magical function
    x = cell(1,numel(ind));
    y = cell(1,numel(ind));
    z = cell(1,numel(ind));
    p = cell(1,numel(ind));
    e = cell(1,numel(ind));
    t = cell(1,numel(ind));
    for m = 1:numel(ind)
        x{m} = xSTemp(ind{m});
        if ~islogical(ySTemp)
            y{m} = ySTemp(ind{m});
        end
        if ~islogical(zSTemp)
            z{m} = zSTemp(ind{m});
        end
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