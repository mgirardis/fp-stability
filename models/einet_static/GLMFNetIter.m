function x = GLMFNetIter(par, x, ~)
    x(2) = x(2);
    mup = 1 - par.mu;
    VBp = par.VB .* mup;
    x(1) = (1-x(1)).*(VBp + par.J.*x(1)).*par.G0./( mup.*(mup + par.G0.*(VBp + par.J.*x(1))) );
end