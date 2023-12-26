function [KSt,TSt] = find_KT2Tanh_StabLimFerro_H0Q0_bisection(par,K_values,T_values,n_iter,Ktol)
    if (nargin < 4) || isempty(n_iter)
        n_iter = 10;
    end
    if (nargin < 5) || isempty(Ktol)
        Ktol = 1e-6;
    end
    KSt   = NaN(size(T_values));
    TSt   = NaN(size(T_values));
    par.K = K_values;
    for i = 1:numel(T_values)
        % for each T, we swipe K
        T     = T_values(i);
        par.T = T;
        fp    = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],true); % true because y == x in this model
        fp1   = findFP(fp,'any',@(f)max(abs(imag(f.ev)))>0);
        if isempty(fp1) % making sure there is a mod phase to make boundaries with
            continue;
        end
        fp1   = getFirst(findFP(findFP(fp,'stable',@(f)abs(f.xS)>0),'any'     ,@(f)argmax(f.par)));
        fp2   = getFirst(findFP(fp                                 ,'unstable',@(f)f.par==par.K(end))); % last FP
        if isempty(fp1) || isempty(fp2)
            continue;
        end
        K1    = fp1.par;
        K2    = fp2.par;
        if (abs(K1-K2)/2) > Ktol
            pp    = par;
            for k = 1:n_iter % bisection
                % new K for FP
                Km    = (K1 + K2) / 2;
                pp.K  = Km;
                fp    = getFixedPoints(pp,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],true); % true because y == x in this model
                fpm   = getFirst(findFP(fp,'stable',@(f)f.xS>0));
                if isempty(fpm) % rhs of the bifurcation
                    K2 = Km;
                else
                    K1 = Km;
                end
            end
        end
        KSt(i) = (K1 + K2)/2;
        TSt(i) = T_values(i);
    end
    ind = ~isnan(TSt);
    KSt = KSt(ind);
    TSt = TSt(ind);
end

function fp=getFirst(fp)
    if ~isempty(fp)
        fp = fp(1);
    end
end