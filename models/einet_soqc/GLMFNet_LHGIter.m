function x = GLMFNet_LHGIter(par, x, ~)
    mup = 1 - par.mu;
    VBp = par.VB .* mup;
    x(2) = x(2) + (par.G1-x(2))./par.t1 - x(2).*x(1)./par.t0;
%     x(2) = (1 + 1./par.t1 - x(1)).*x(2); % simplified dynamics // obtained with: t0 = 1; t1 = -tau; G1 = 0;
    x(1) = (1-x(1)).*(VBp + par.J.*x(1)).*x(2)./( mup.*(mup + x(2).*(VBp + par.J.*x(1))) );
end