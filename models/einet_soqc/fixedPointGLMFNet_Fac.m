function [rhoS,GammaS] = fixedPointGLMFNet_Fac(par, s, r, ~)
    % r -> sign of the square root for rho+ or rho-
    if r>0
        if s>0
            rhoS = 0.*par.J + 0.*par.t0 + 0.*par.t1 + 0.*par.G1 + 0.*par.G0 + 0.*par.d;
            GammaS = (((-1)+par.d).*par.t0+(-1).*par.d.*par.t1).^(-1).*(par.G1.*((-1)+par.d).*par.t0+(-1).*par.G0.*par.d.*par.t1);
            if numel(GammaS)~=numel(par.J)
                GammaS = GammaS.*ones(size(par.J));
            end
        else
            rhoS = (4.*par.G1.*par.J.*par.d.*par.t0+(-4).*par.G0.*par.J.*((-1)+par.d).*par.t1).^(-1).*(((-1).*par.d+par.G1.*par.J.*((-2)+3.*par.d)).*par.t0+((-1)+par.d+par.G0.*(par.J+(-3).*par.J.*par.d)).*par.t1+(-1).*((par.G1.*par.J.*((-2)+par.d)+par.d).^2.*par.t0.^2+(-2).*(((-1)+par.d).*par.d+par.G0.*par.J.*(4+((-7)+par.d).*par.d)+par.G1.*par.J.*((-2)+par.G0.*par.J.*((-2)+par.d).*(1+par.d)+par.d.*(5+par.d))).*par.t0.*par.t1+((-1)+par.d+par.G0.*par.J.*(1+par.d)).^2.*par.t1.^2).^(1/2));
            GammaS = (2.*par.J.*((-2)+par.d).*par.t0+(-2).*par.J.*(1+par.d).*par.t1).^(-1).*((par.G1.*par.J.*((-2)+par.d)+(-1).*par.d).*par.t0+(-1).*(1+(-1).*par.d+par.G0.*par.J.*(1+par.d)).*par.t1+((par.G1.*par.J.*((-2)+par.d)+par.d).^2.*par.t0.^2+(-2).*(((-1)+par.d).*par.d+par.G0.*par.J.*(4+((-7)+par.d).*par.d)+par.G1.*par.J.*((-2)+par.G0.*par.J.*((-2)+par.d).*(1+par.d)+par.d.*(5+par.d))).*par.t0.*par.t1+((-1)+par.d+par.G0.*par.J.*(1+par.d)).^2.*par.t1.^2).^(1/2));
        end
    else
        rhoS = (4.*par.G1.*par.J.*par.d.*par.t0+(-4).*par.G0.*par.J.*((-1)+par.d).*par.t1).^(-1).*(((-1).*par.d+par.G1.*par.J.*((-2)+3.*par.d)).*par.t0+((-1)+par.d+par.G0.*(par.J+(-3).*par.J.*par.d)).*par.t1+((par.G1.*par.J.*((-2)+par.d)+par.d).^2.*par.t0.^2+(-2).*(((-1)+par.d).*par.d+par.G0.*par.J.*(4+((-7)+par.d).*par.d)+par.G1.*par.J.*((-2)+par.G0.*par.J.*((-2)+par.d).*(1+par.d)+par.d.*(5+par.d))).*par.t0.*par.t1+((-1)+par.d+par.G0.*par.J.*(1+par.d)).^2.*par.t1.^2).^(1/2));
        GammaS = (-1).*(2.*par.J.*((-2)+par.d).*par.t0+(-2).*par.J.*(1+par.d).*par.t1).^(-1).*(((-1).*par.G1.*par.J.*((-2)+par.d)+par.d).*par.t0+(1+(-1).*par.d+par.G0.*par.J.*(1+par.d)).*par.t1+((par.G1.*par.J.*((-2)+par.d)+par.d).^2.*par.t0.^2+(-2).*(((-1)+par.d).*par.d+par.G0.*par.J.*(4+((-7)+par.d).*par.d)+par.G1.*par.J.*((-2)+par.G0.*par.J.*((-2)+par.d).*(1+par.d)+par.d.*(5+par.d))).*par.t0.*par.t1+((-1)+par.d+par.G0.*par.J.*(1+par.d)).^2.*par.t1.^2).^(1/2));
    end

    ind = ~((imag(rhoS) == 0) & (real(rhoS) <= 1) & (real(rhoS) >= 0) & (imag(GammaS) == 0));
    rhoS(ind) = NaN;
    GammaS(ind) = NaN;
end