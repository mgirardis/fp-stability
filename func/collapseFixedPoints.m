function fp1 = collapseFixedPoints(fp,sortby)
    % collapse all fp in fp struct into a single fp struct, with sorted bifurcation param
    if (nargin < 2) || isempty(sortby)
        sortby = 'par';
    end
    assert(any(strcmpi({'par','ev'},sortby)),'sortby must be one of: par,ev');
    if isempty(fp)
        fp1 = fp;
        return;
    end
    fp1      = fp(1);
    fp1.xS   = zeros(1,0);
    fp1.yS   = zeros(1,0);
    fp1.zS   = zeros(1,0);
    fp1.ev   = zeros(size(fp(1).ev,1),0);
    fp1.type = cell(1,0);
    fp1.par  = zeros(1,0);
    for k = 1:numel(fp)
        i1              = numel(fp1.xS)+1;
        i2              = numel(fp1.xS)+numel(fp(k).xS);
        fp1.xS(i1:i2)   = fp(k).xS;
        fp1.yS(i1:i2)   = fp(k).yS;
        fp1.zS(i1:i2)   = fp(k).zS;
        fp1.ev(:,i1:i2) = fp(k).ev;
        fp1.par(i1:i2)  = fp(k).par;
        fp1.type(i1:i2) = repmat({fp(k).type},1,numel(fp(k).xS));
    end
    fp1 = eliminateEqualFP(fp1);
    if strcmpi(sortby,'par')
        [~,ind] = sort(fp1.par);
    else
        [~,ind] = sort(max(abs(fp1.par),[],1));
    end
    fp1.xS   = fp1.xS(ind);
    fp1.yS   = fp1.yS(ind);
    fp1.zS   = fp1.zS(ind);
    fp1.ev   = fp1.ev(:,ind);
    fp1.par  = fp1.par(ind);
    fp1.type = fp1.type(ind);
end

function f = selectFP(fp,k)
    f = fp;
    f.xS   = f.xS(k);
    f.yS   = f.yS(k);
    f.zS   = f.zS(k);
    f.ev   = f.ev(:,k);
    f.par  = f.par(k);
    f.type = f.type{k};
end

function fp = eliminateEqualFP(fp)
    n = numel(fp);
    k = [];
    for i = 1:n
        for j = (i+1):n
            if isEqualFP(selectFP(fp,i),selectFP(fp,j))
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