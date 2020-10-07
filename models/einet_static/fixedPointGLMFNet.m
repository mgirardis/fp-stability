function [rhoS,GammaS] = fixedPointGLMFNet(par, ~, r, ~)
    % r -> sign of the square root for rho+ or rho-
    mup = 1 - par.mu;
    VBp = par.VB .* mup;
    A = par.J.*par.G0 - mup.^2 - par.G0.*VBp.*(1+mup);
    D = 2.*par.G0.*par.J.*(1+mup);
    rhoS = (A + r.*sqrt(A.^2+2.*D.*par.G0.*VBp))./D;
    ind = (imag(rhoS) == 0) & (real(rhoS) <= 1) & (real(rhoS) >= 0);
%     ind = (imag(rhoS) == 0) & (real(rhoS) >= 0);
    rhoS(~ind) = NaN;
    GammaS = repmat(par.G0(1),size(rhoS));
    GammaS(~ind) = NaN;
end