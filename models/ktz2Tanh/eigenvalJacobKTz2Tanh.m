function lambda = eigenvalJacobKTz2Tanh(par)
    if iscell(par.xS)
        xS = par.xS;
        lambda = cell(size(xS));
        for i = 1:numel(xS)
            par.xS = xS{i};
            lambda{i} = eigenvalJacobKTzTanh_internal(par);
        end
    else
        lambda = eigenvalJacobKTzTanh_internal(par);
    end
end

function lambda = eigenvalJacobKTzTanh_internal(par)
    K = par.K(:)';
    T = par.T(:)';
    H = par.H(:)';
    D = par.d(:)';
    L = par.l(:)';
    %xR = xR(:)';%xR nao eh preciso aqui pq jah esta embutido em zS
    v = par.xS(:)';
    y = tanh( (v+H)./T );

    % copiado paper Copelli, Tragtenberg, Kinouchi Physica A 2004
    % the solution below assumes a cubic polynomial of the form
    % X^3 + a2 X^2 + a1 X + a0 == 0
    a = 1-v.*v;
    b = 1-y.*y;
    
    % coefficients of the characteristic polynomial
    a0 = (a.*b.*K.*(D-1))./(T.*T);   % the constant term
    a1 = (a./T).*( 1-D+L + b.*K./T );  % coefficient of the linear term
    a2 = D-1-(a./T);         % coefficient of the quadratic term

    R = (-27.*a0 + 9.*a1.*a2 - 2.*a2.^3 + 3.*sqrt(3).*sqrt(27.*a0.^2 + 4.*a1.^3 - 18.*a0.*a1.*a2 - (a1.^2).*(a2.^2) + 4.*a0.*a2.^3)).^(1./3);
    S = 3.*a1 - a2.^2;
%     S = nthroot(R+sqrt(Q3+R2),3);
%     U = nthroot(R-sqrt(Q3+R2),3);
    lambda = [ -(a2./3) - (2.^(1./3).*S)./(3.*R) + R./(3.*2.^(1./3));...
               -(a2./3) - (1 - 1i.*sqrt(3).*R)./(6.*2.^(1./3)) + ((1 + 1i.*sqrt(3)).*S)./(3.*2.^(2./3).*R) ;...
               -(a2./3) - (1 + 1i.*sqrt(3).*R)./(6.*2.^(1./3)) + ((1 - 1i.*sqrt(3)).*S)./(3.*2.^(2./3).*R) ];
end