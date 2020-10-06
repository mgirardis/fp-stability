function x = KTTanhIter(par, x)
    xAnt = x(2);
    x(2) = x(1);
    x(1) = tanh((x(1) - par.K.*xAnt + par.H) ./ par.T);
end