function [KSt,TSt,lSt] = calc_StabLim_KTz2Tanh_l_Adiabatic(par,K_values,T_values,use_complex_ev)
    % par has to define:
    %   H -> the external field in y
    %   d -> the selected value of d (adiabatic means small d, e.g. d=1e-3)
    %   l -> the selected value of l (adiabatic means small l, e.g. d=1e-3)
    %   xR-> return potential for Z variable
    %   Q, K, T don't matter, since K,T will be replaced by K_values,T_values, respectively, and Q are calculated inside this function
    % given a field H and an array of K_values and T_values
    %
    % returns: the stability limits given by xR,K,T
    %
    [KSt,TSt,xSSt] = calc_FPStabLim_KT2Tanh_QTK(par.H,K_values,T_values,use_complex_ev);
    lSt  = cell(size(xSSt));
    %dSt  = cell(size(xSSt));
    for i = 1:numel(KSt)
        K       = KSt(i);
        T       = TSt(i);
        Qfast   = Qfast_StLim(K,T,par.H,xSSt{i});
        %lSt{i}                  = lambda_StLim(par.d,par.xR,xSSt{i},Q);
        %dSt{i}                  = delta_StLim(par.l,par.xR,xSSt{i},Q);
        %xRSt{i}                 = xR_StLim(par.l,par.d,xSSt{i},Q);
        %[lSt{i},dSt{i},xRSt{i}] = clean_data(Q,lSt{i},dSt{i},xRSt{i});
        lSt{i}                 = clean_data(Qfast,lambda_StLim(par.d,par.xR,xSSt{i},par.Q,Qfast));
        
    end
    
end

function p = clean_data(Q,p)
    ind = get_bad_data_ind(Q) | get_bad_data_ind(p);
    p   = p(~ind);
end

function ind = get_bad_data_ind(x)
    ind = isnan(x) | (abs(imag(x))>0);
end

function l = lambda_StLim(delta,xR,xS,Q,Qfast)
    l = delta.*(Qfast-Q)./(xR-xS);
end

function d = delta_StLim(lambda,xR,xS,Q,Qfast)
    d = lambda.*(xR-xS)./(Qfast-Q);
end

function Q = Q_StLim(lambda,delta,xR,xS,Qfast)
    Q = Qfast + (lambda./delta).*(xS-xR);
end

function xR = xR_StLim(lambda,delta,Q,xS,Qfast)
    xR = xS + (delta./lambda).*(Qfast-Q);
end

function Q = Qfast_StLim(K,T,H,V)
    Q = T .* atanh(V) - V + K.*tanh((V+H)./T);
end