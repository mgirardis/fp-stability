function [KSt,TSt,QSt] = calc_StabLim_KT2Tanh_QTK(H,K_values,T_values,use_complex_ev)
    % given a field H and an array of K_values and T_values
    % we calculate the stability limits
    %
    %
    [KSt,TSt,xSSt] = calc_FPStabLim_KT2Tanh_QTK(H,K_values,T_values,use_complex_ev);
    QSt            = cell(size(xSSt));
    for i = 1:numel(KSt)
        K              = KSt(i);
        T              = TSt(i);
        QSt{i}         = sort(clean_data( stLim(K,T,H,xSSt{i})  ));
    end
end


function x = clean_data(x)
    ind = isnan(x) | (abs(imag(x))>0);
    x = x(~ind);
end

function Q = stLim(K,T,H,V)
    Q = T .* atanh(V) - V + K.*tanh((V+H)./T);
end