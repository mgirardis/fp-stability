function lambda = eigenvalJacobGLMFNet_LHG(par,~,~)
    t0 = par.t0(:)';
    t1 = par.t1(:)';
    J = par.J(:)';
    rhoS = par.xS(:)';
    GammaS = par.zS(:)';
    lambda = [(-1/2).*(1+J.*GammaS.*rhoS).^(-2).*t0.^(-1).*t1.^(-1).*((1+J.*GammaS.*rhoS).^2.*t0+rhoS.*(1+J.*GammaS.*rhoS).^2.*t1+(-1).*(1+J.*GammaS).*t0.*t1+((-4).*J.*GammaS.*(1+J.*GammaS.*rhoS).^2.*t0.*t1.*((1+(-1).*rhoS.*(2+J.*GammaS.*rhoS)).*t0.*((-1)+t1)+rhoS.^2.*(1+J.*GammaS.*rhoS).*t1)+(rhoS.*(1+J.*GammaS.*rhoS).^2.*t1+t0.*((1+J.*GammaS.*rhoS).^2+(-1).*(1+J.*GammaS).*t1)).^2).^(1/2));...
              (1/2).*(1+J.*GammaS.*rhoS).^(-2).*t0.^(-1).*t1.^(-1).*((-1).*rhoS.*(1+J.*GammaS.*rhoS).^2.*t1+t0.*((-1).*(1+J.*GammaS.*rhoS).^2+(1+J.*GammaS).*t1)+((-4).*J.*GammaS.*(1+J.*GammaS.*rhoS).^2.*t0.*t1.*((1+(-1).*rhoS.*(2+J.*GammaS.*rhoS)).*t0.*((-1)+t1)+rhoS.^2.*(1+J.*GammaS.*rhoS).*t1)+(rhoS.*(1+J.*GammaS.*rhoS).^2.*t1+t0.*((1+J.*GammaS.*rhoS).^2+(-1).*(1+J.*GammaS).*t1)).^2).^(1/2))];
end