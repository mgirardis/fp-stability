function lambda = eigenvalJacobGLMFNet(par,~,~)
    mup = 1 - par.mu;
    VBp = par.VB .* mup;
    l = -1./mup + (mup + par.G0.*(par.J + VBp))./(mup + par.G0.*(par.J.*par.xS + VBp)).^2; % xS -> rhoS
    lambda = [ l(:)';...
               l(:)' ];
end