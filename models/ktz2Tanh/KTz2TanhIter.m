function x = KTz2TanhIter(par, x)
    xAnt = x(1);
    x(1) = tanh((x(1) - par.K.*x(2) + x(3) + par.Z) ./ par.T);
    x(2) = tanh( (xAnt+par.H)./par.T );
    x(3) = (1-par.d).*x(3) - par.l.*(xAnt - par.xR);
end