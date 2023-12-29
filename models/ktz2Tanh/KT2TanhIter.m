function x = KT2TanhIter(par, x)
    xAnt = x(1);
    x(1) = tanh((x(1) - par.K.*x(2) + par.Q) ./ par.T);
    x(2) = tanh( (xAnt+par.H)./par.T );
end