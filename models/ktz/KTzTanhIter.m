function x = KTzTanhIter(par, x)
    xAnt = x(1);
    x(1) = tanh((xAnt - par.K.*x(2) + x(3) + par.H) ./ par.T);
    x(2) = xAnt;
    x(3) = (1-par.d).*x(3) - par.l.*(xAnt - par.xR);
end