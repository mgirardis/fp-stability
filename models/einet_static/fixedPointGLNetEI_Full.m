function [rhoS,thetaS] = fixedPointGLNetEI_Full(par, sTheta, r, rTheta)
    % r -> sign of the square root for rho+ or rho-
    sTheta = sTheta>0;
    rTheta = rTheta>0;
    rhoS = (1/2).*((-1)+rTheta).^(-1).*sTheta.^(-1).*par.W.^(-1).*par.G0.^(-1).*(1+rTheta+sTheta.*(par.h+(-1).*par.W).*par.G0+rTheta.*sTheta.*((-1).*par.h+par.W).*par.G0+r.*((1+rTheta).^2+(-2).*((-1)+rTheta).*sTheta.*(par.h.*(1+rTheta)+((-1)+rTheta).*par.W).*par.G0+((-1)+rTheta).^2.*sTheta.^2.*(par.h+par.W).^2.*par.G0.^2).^(1/2));
%     thetaS = ones(size(rhoS));
%     return
    ind = (imag(rhoS) == 0) & (real(rhoS) <= 1) & (real(rhoS) >= 0);
    if sTheta > 0
        ind = ind & ((par.h+par.W.*rhoS)>=0);
    else
        ind = ind & ((par.h+par.W.*rhoS)<0);
    end
    if rTheta > 0
        ind = ind & ((par.h+par.W.*rhoS-1./par.G0)>=0);
    else
        ind = ind & ((par.h+par.W.*rhoS-1./par.G0)<0);
    end
%     ind = (imag(rhoS) == 0) & (real(rhoS) >= 0);
    rhoS(~ind) = NaN;
    thetaS = ones(size(rhoS));
    thetaS(~ind) = NaN;
end