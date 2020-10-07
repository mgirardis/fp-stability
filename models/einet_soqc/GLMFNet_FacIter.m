function x = GLMFNet_FacIter(par, x, ~)
    mup = 1 - par.mu;
    VBp = par.VB .* mup;
    x(2) = x(2) + (par.G1-x(2)).*(par.d.*x(1)+1-par.d)./par.t1 - (x(2)-par.G0).*((1-par.d).*x(1)+par.d)./par.t0;
    x(1) = (1-x(1)).*(VBp + par.J.*x(1)).*x(2)./( mup.*(mup + x(2).*(VBp + par.J.*x(1))) );
end