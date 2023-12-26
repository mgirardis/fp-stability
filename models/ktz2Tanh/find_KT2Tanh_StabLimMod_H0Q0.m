function [KSt,TSt] = find_KT2Tanh_StabLimMod_H0Q0(par,K_range,T_values,n_iter,KTol,n_IC,tTrans,tTotal,xTol,t_sample)
    if (nargin < 4) || isempty(n_iter)
        n_iter = 30;
    end
    if (nargin < 5) || isempty(KTol)
        KTol = 1e-2;
    end
    if (nargin < 6) || isempty(n_IC)
        n_IC = 5;
    end
    if (nargin < 7) || isempty(tTrans)
        tTrans = 40000;
    end
    if (nargin < 8) || isempty(tTotal)
        tTotal = 50000;
    end
    if (nargin < 9) || isempty(xTol)
        xTol = 1e-6;
    end
    if (nargin < 10) || isempty(t_sample)
        t_sample = 50;
    end
    K_range = sort(K_range);
    x0    = linspace(-0.99,0.99,n_IC);
    KSt   = NaN(size(T_values));
    TSt   = NaN(size(T_values));
    for i = 1:numel(T_values)
        T     = T_values(i);
        par.T = T;
        par.K = K_range(1);
        r1    = isFP_many_IC(x0,par,tTrans,tTotal,t_sample,xTol);
        %x1 = KTAtrator_mex(getKTzParamStruct_for_KTAtrator(par),x0,tTrans,tTotal,'KT2Tanh','',false,false);
        par.K = K_range(2);
        r2    = isFP_many_IC(x0,par,tTrans,tTotal,t_sample,xTol);
        %x2 = KTAtrator_mex(getKTzParamStruct_for_KTAtrator(par),x0,tTrans,tTotal,'KT2Tanh','',false,false);
        if r1 && r2
            continue;
        end
        pp   = par;
        K    = K_range;
        for j = 1:n_iter
            Km   = mean(K);
            pp.K = Km;
            rm   = isFP_many_IC(x0,pp,tTrans,tTotal,t_sample,xTol);
            if rm
                K(1) = Km;
            else
                K(2) = Km;
            end
            if abs(diff(K))<KTol
                break;
            end
        end
        KSt(i) = mean(K);
        TSt(i) = T;
    end
    ind = ~isnan(TSt);
    KSt = KSt(ind);
    TSt = TSt(ind);
    [ KSt,ind ] = unique(KSt);
    TSt         = TSt(ind);
end

function r = isFP_many_IC(x0,par,tTrans,tTotal,t_sample,xTol)
    r = true;
    for i = 1:numel(x0)
        xx0 = [ x0(i), x0(i) ];
        x   = KTAtrator_mex(getKTzParamStruct_for_KTAtrator(par),xx0,tTrans,tTotal,'KT2Tanh','',false,false);
        r   = r && isFP(x(:,1),t_sample,xTol);
    end
end

function r = isFP(x,t_sample,xTol)
    ind = (numel(x) - t_sample):numel(x);
    r   = mean(abs(diff([reshape(x(ind(1:(end-1))),1,[]);reshape(x(ind(2:end)),1,[])],1,1))) < xTol;
end