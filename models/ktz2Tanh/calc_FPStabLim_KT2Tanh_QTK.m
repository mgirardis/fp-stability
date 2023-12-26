function [KSt,TSt,xSSt] = calc_FPStabLim_KT2Tanh_QTK(H,K_values,T_values,use_complex_ev)
    % given a field H and an array of K_values and T_values
    % we calculate the fixed points on top of the stability limits
    %
    %
    if use_complex_ev
        FPFunc = @FP_Complex_Lambda;
    else
        FPFunc = @FP_Real_Lambda;
    end
    [KSt,TSt] = meshgrid(K_values,T_values);
    xSSt      = cell(size(KSt));
    V         = linspace(-0.99999,0.99999,10000);
    for i = 1:numel(KSt)
        K              = KSt(i);
        T              = TSt(i);
        [xSSt_temp1,~] = findInter(V,F2(T,H),FPFunc(K,T, 1),[],[-0.999999999,0.999999999]);
        [xSSt_temp2,~] = findInter(V,F2(T,H),FPFunc(K,T,-1),[],[-0.999999999,0.999999999]);
        xSSt{i}        = sort(remove_nan([xSSt_temp1,xSSt_temp2]));
    end
end

function x = remove_nan(x)
    x = x(~isnan(x));
end

function y = F2(T,H)
    y = @(V)tanh((V+H)./T);
end

function y = FP_Complex_Lambda(K,T,s)
    y = @(V)FP_Complex_Lambda_Re(K,T,s,V);
end

function y = FP_Complex_Lambda_Re(K,T,s,V)
    y = s.*sqrt(1-T.*T./(K.*(1-V.*V)));
    y(abs(imag(y))>0)=NaN;
end

function y = FP_Real_Lambda(K,T,s)
    y = @(V)FP_Real_Lambda_Re(K,T,s,V);
end

function y = FP_Real_Lambda_Re(K,T,s,V)
    y = s.*sqrt(1-(T./K).*(1-T./(1-V.*V) ) );
    y(abs(imag(y))>0)=NaN;
end