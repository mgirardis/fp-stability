function [KSt,TSt] = find_KT2Tanh_StabLimFerro(par,K_values,T_values,n_iter,KTol,n_sub)
    if (nargin < 4) || isempty(n_iter)
        n_iter = 10;
    end
    if (nargin < 5) || isempty(KTol)
        KTol = 1e-6;
    end
    if (nargin < 6) || isempty(n_sub)
        n_sub = 100;
    end
    KSt   = NaN(size(T_values));
    TSt   = NaN(size(T_values));
    par.K = K_values;
    for i = 1:numel(T_values)
        % for each T, we swipe K
        T       = T_values(i);
        par.T   = T;
        fp    = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],true); % true because y == x in this model
        fp1   = findFP(fp,'any',@(f)max(abs(imag(f.ev)))>0);
        if isempty(fp1) % making sure there is a mod phase to make boundaries with
            continue;
        end
        pp = par;
        for j = 1:n_iter
            K_range = find_K_range(fp);
            if isempty(K_range)
                break;
            end
            pp.K   = linspace(K_range(1),K_range(2),n_sub);
            fp     = getFixedPoints(pp,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],true); % true because y == x in this model
            if (abs(diff(K_range))/2)<KTol
                break;
            end
        end
        if isempty(K_range)
            continue;
        end
        KSt(i) = mean(K_range);
        TSt(i) = T_values(i);
    end
    ind = ~isnan(TSt);
    KSt = KSt(ind);
    TSt = TSt(ind);
end

function K_range = find_K_range(fp)
    %fp;
    fp1   = getFirst(findFP(findFP(fp,'any',@(f)abs(f.xS)>0),'any',@(f)argmax(f.par)));
    if isempty(fp1)
        K_range = [];
        return;
    end
    K1    = fp1.par;
    fp2   = collapseFixedPoints(findFP(fp,'any',@(f)(f.par>K1)&(abs(f.xS)<1e-10)),'par'); % last FP
    if isempty(fp2)
        K_range = [];
        return;
    end
    K_range = [fp1.par,fp2.par(1)];
end

%function K_range = find_K_range(fp)
%    fp     = collapseFixedPoints(fp,'ev');
%    ev_max = max(abs(fp.ev),[],1);
%    [~,k]  = min(abs(ev_max-1)); % finding fp closest to the bifurcation
%    if ev_max(k) > 1 % we are on the rhs of the bifurcation
%        K1      = fp.par(find(ev_max(1:(k-1))<1,1,'last'));
%        if isempty(K1)
%            K1 = fp.par(1);
%        end
%        K_range = [K1,fp.par(k)];
%    else
%        K2      = fp.par(find(ev_max((k+1):end)>1,1,'first'));
%        if isempty(K2)
%            K2 = fp.par(end);
%        end
%        K_range = [fp.par(k),K2];
%    end
%end

function fp=getFirst(fp)
    if ~isempty(fp)
        fp = fp(1);
    end
end