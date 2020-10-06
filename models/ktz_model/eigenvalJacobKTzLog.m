function lambda = eigenvalJacobKTzLog(par)
    if iscell(par.xS)
        n = numel(par.xS);
        lambda = cell(size(par.xS));
        for i = 1:n
            lambda{i} = eigenvalJacobKTzLog_internal(par.K,par.T,par.d,par.l,par.xS{i},par.zS{i});
        end
    else
        lambda = eigenvalJacobKTzLog_internal(par.K,par.T,par.d,par.l,par.xS,par.zS);
    end
end

function lambda = eigenvalJacobKTzLog_internal(K,T,D,L,xS,zS)
%     K = par.K(:)';
%     T = par.T(:)';
%     D = par.d(:)';
%     L = par.l(:)';
%     %xR = xR(:)';%xR nao eh preciso aqui pq jah esta embutido em zS
%     xS = par.xS(:)';
%     zS = par.zS(:)';
% 
%     % copiado paper Copelli, Tragtenberg, Kinouchi Physica A 2004
%     p2 = (T + abs((1-K).*xS + zS)).^2;
%     
%     % polinomial coefficients
%     a0 = K.*T.*(D-1)./p2;
%     a1 = T.*(L+K+1-D)./p2;
%     a2 = -(T+(1-D).*p2)./p2;
% 
%     Q3 = (a1./3-a2.*a2./9).^3;
%     R = (9.*a1.*a2-27.*a0-2.*a2.^3)./54;
%     R2 = R.*R;
%     S = (R+sqrt(Q3+R2)).^(1/3);  % o polinomio cubico pode ter 3 raizes complexas
%                                   % por isso tô tomando a raiz cubica como ^(1/3)
% 	U = (R-sqrt(Q3+R2)).^(1/3);
% %     S = nthroot(R+sqrt(Q3+R2),3);
% %     U = nthroot(R-sqrt(Q3+R2),3);
%     lambda = [ (S+U-a2./3);...
%                (sqrt(3).*(S-U).*1i-S-U)./2-a2./3;...
%                (sqrt(3).*(U-S).*1i-S-U)./2-a2./3 ];
    K = K(:)';
    T = T(:)';
    D = D(:)';
    L = L(:)';
    %xR = xR(:)';%xR nao eh preciso aqui pq jah esta embutido em zS
    xS = xS(:)';
    zS = zS(:)';
    
    p = T + abs((1-K).*xS + zS);
    pSq3 = 3.*p.^2;
    R = -3.*(D-1).*(p.^4).*T.*(D+6.*K-3.*L-1)+pSq3.*(T.^2).*(D-3.*K-3.*L-1)-2.*((D-1).^3).*p.^6+2.*T.^3;
    U2 = (p.^2).*D-p.^2 - T;
    U = pSq3.*T.*(K + 1 - D + L)-U2.^2;
    A = - U2 ./ pSq3;
    %cRootRU = nthroot(R + sqrt(abs(4.*(U.^3)+R.^2)),3); % estava assumindo que a raiz eh obrigatoriamente real,
                                                         % mas isso não eh necessariamente verdade, já que o polinomio
                                                         % cubico pode ter 3 raizes complexas
    cRootRU = (R + sqrt(4.*(U.^3)+R.^2)).^(1/3);
    cRoot2 = 2^(1/3);
    iSqrt3 = 1i*sqrt(3);
    B = -cRootRU ./ (pSq3 .* cRoot2);
    C = U ./ (pSq3 .* cRootRU);
    lambda = [ A - B - cRoot2 .* C;...
               A + ((1-iSqrt3)./2) .* B + ((1+iSqrt3) ./ (cRoot2.*cRoot2)) .* C;...
               A + ((1+iSqrt3)./2) .* B + ((1-iSqrt3) ./ (cRoot2.*cRoot2)) .* C ];
end