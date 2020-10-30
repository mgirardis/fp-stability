function [fp,p1Range,p2Range,parName,lambda] = getStableFPSurf(par,fpFunc,evFunc,fpFuncArgs,LambdaFuncArgs,p1Settings,p2Settings)
    if (nargin < 4) || isempty(fpFuncArgs)
        fpFuncArgs = {};
    end
    if (nargin < 5) || isempty(LambdaFuncArgs)
        LambdaFuncArgs = {};
    end
    if (nargin < 6) || isempty(p1Settings)
        p1Settings = [];
    end
    if (nargin < 7) || isempty(p2Settings)
        p2Settings = [];
    end

    if isempty(p1Settings) || isempty(p2Settings)
        [parVal,parName] = getDomainParam(par);
        p1Range = parVal{1};
        p2Range = parVal{2};
        if ~isempty(p1Settings)
            warning('ignoring p1Settings');
        end
        if ~isempty(p2Settings)
            warning('ignoring p2Settings');
        end
    else
        assert(isValidCell(p1Settings,par) || isValidCellRange(p1Settings),'p1Settings has to be a cell of the form {''parName'',N_values,[lim1,lim2]} or of the form {''parName'',parValues}');
        assert(isValidCell(p2Settings,par) || isValidCellRange(p2Settings),'p1Settings has to be a cell of the form {''parName'',N_values,[lim1,lim2]} or of the form {''parName'',parValues}');
%         assert(isValidCell(p1Settings),'p1Settings has to be a cell of the form {''parName'',N_values,[lim1,lim2]}');
%         assert(isValidCell(p2Settings),'p2Settings has to be a cell of the form {''parName'',N_values,[lim1,lim2]}');
        p1 = p1Settings{1};
        p2 = p2Settings{1};
        [p1Range,p2Range] = meshgrid(getParRange(p1Settings),getParRange(p2Settings));
        par.(p1) = p1Range;
        par.(p2) = p2Range;
        parName = {p1,p2};
    end
    
    fp = fpFunc(par,fpFuncArgs{:});
    fp = ensure_cell_fp(ensure_yS_zS(fp));
    par = insert_fp_into_struct(par,fp);
    lambda = evFunc(par,LambdaFuncArgs{:});
    lambda = ensure_cell(lambda);

    indFPToRem = false(size(lambda));
    for i = 1:numel(lambda)
        indNotSt = ~all((abs(lambda{i})-1) <= 0,1); %(abs(lambda{i}(1,:))>1)|(abs(lambda{i}(2,:))>1);
        fp.xS{i}(indNotSt) = NaN;
        fp.yS{i}(indNotSt) = NaN;
        fp.zS{i}(indNotSt) = NaN;
        
        indFPToRem(i) = all( isnan(fp.xS{i}(:)) );
    end
    fp.xS(indFPToRem) = [];
    fp.yS(indFPToRem) = [];
    fp.zS(indFPToRem) = [];
    lambda = reshape_lambda(lambda,size(fp.xS{1}));
end

function LL = reshape_lambda(L,sz)
% each L must be defined over the same range as the FP
    n = size(L{1},1); % number of eigenvalues
    m = numel(L); % number of FP
    LL = cell(size(L));
    for i = 1:m
        LL{i} = reshape(L{i}(1,:),sz);
        for j = 2:n
            LL{i} = cat(3,LL{i},reshape(L{i}(j,:),sz));
        end
        L{i} = []; % releasing memory
    end
end

function r = getParRange(pSetting)
    if isValidCellRange(pSetting)
        r = pSetting{2};
    else
        r = linspace(pSetting{3}(1),pSetting{3}(2),pSetting{2});
    end
end

function r = isValidCell(c,par)
    r = iscell(c) && (numel(c) == 3) && ischar(c{1})...
        && isfield(par,c{1})...
        && isscalar(c{2}) && isnumeric(c{2})...
        && isvector(c{3}) && (numel(c{3}) == 2) && isnumeric(c{3});
end

function r = isValidCellRange(c)
    r = iscell(c) && (numel(c) == 2) && ischar(c{1})...
        && isvector(c{2}) && isnumeric(c{2});
end

function [parVal,parName] = getDomainParam(par)
    f = fieldnames(par);
    n = structfun(@numel,par)>1;
    parName = f(n);
    parVal = cell(size(parName));
    for i = 1:numel(parName)
        parVal{i} = par.(parName{i});
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

function fp = ensure_yS_zS(fp)
    if ~isfield(fp,'yS')
        fp.yS = fp.xS;
    end
    if ~isfield(fp,'zS')
        fp.zS = fp.xS;
    end
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