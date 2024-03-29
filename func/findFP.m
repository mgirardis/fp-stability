function fp1 = findFP(fp,type,cond,sort_result)
    % finds the stable fixed points in fp struct that respects the given cond fuction
    % eg: cond = @(fp) fp.xS > 0 
    %     to find stable FP that has xS greater than 0
    %     the cond function must act only on the variables, 
    %     eigenvalues, or control parameter
    %     i.e., xS,yS,zS,ev,par
    %     and it must return true or false, or the indices of the FP that respect the condition
    %
    % returns: all fp in a single struct
    if (nargin < 4) || isempty(sort_result)
        sort_result = false;
    end
    if isempty(fp)
        fp1 = [];
        return;
    end
    type = lower(type);
    assert(any(strcmpi({'any','stable','unstable','saddle'},type)),'type must be one of: any,stable,unstable,saddle');
    fpTemp = fp;
    if ~strcmpi(type,'any')
        ind    = strcmpi({fp.type},type);
        if any(ind)
            fpTemp = fp(ind);
        else
            fp1 = [];
            return;
        end
    end
    fp1      = fp(1);
    fp1.xS   = zeros(1,0);
    fp1.yS   = zeros(1,0);
    fp1.zS   = zeros(1,0);
    fp1.ev   = zeros(size(fp(1).ev,1),0);
    fp1.type = cell(1,0);%type
    fp1.par  = zeros(1,0);
    for k = 1:numel(fpTemp)
        ind             = cond(fpTemp(k));
        if islogical(ind)
            ind   = find(ind);
            n_ind = numel(find(ind));
        else
            n_ind = numel(ind);
        end
        i1              = numel(fp1.xS)+1;
        i2              = numel(fp1.xS)+n_ind;
        fp1.xS(i1:i2)   = fpTemp(k).xS(ind);
        fp1.yS(i1:i2)   = fpTemp(k).yS(ind);
        fp1.zS(i1:i2)   = fpTemp(k).zS(ind);
        fp1.ev(:,i1:i2) = fpTemp(k).ev(:,ind);
        fp1.type(i1:i2) = repmat({fpTemp(k).type(1:2)},1,numel(ind));
        fp1.par(i1:i2)  = fpTemp(k).par(ind);
    end
    if numel(fp1.xS) == 0
        fp1 = [];
    end
    if ~isempty(fp1) && sort_result
        [~,ind] = sort(fp1.par);
        fp1.xS   = fp1.xS(ind);
        fp1.yS   = fp1.yS(ind);
        fp1.zS   = fp1.zS(ind);
        fp1.ev   = fp1.ev(:,ind);
        fp1.type = fp1.type(ind);
        fp1.par  = fp1.par(ind);
    end
end