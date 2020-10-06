function [rhoS,GammaS] = fixedPointGLMFNet_LHG(par, ~, r, ~)
    % r -> sign of the square root for rho+ or rho-
    A = par.G1;
    if r>0
        rhoS = 0.*par.J + 0.*par.t0 + 0.*par.t1 + 0.*A;
        if numel(A) == 1
            GammaS = A.*ones(size(rhoS));
        else
            GammaS = A;
        end
    else
        rhoS = (par.t0.*(A.*par.J-1))./(2.*A.*par.J.*par.t0+par.t1);
        GammaS = (2.*A.*par.J.*par.t0+par.t1)./(par.J.*(2.*par.t0+par.t1));
    end

    ind = ~((imag(rhoS) == 0) & (real(rhoS) <= 1) & (real(rhoS) >= 0) & (imag(GammaS) == 0));
    rhoS(ind) = NaN;
    GammaS(ind) = NaN;
end