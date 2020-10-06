function x = KTzLogIter(par, x)
    arg = (x(1) - par.K.*x(2) + x(3)) ./ par.T;
    x(2) = x(1);
    x(3) = (1-par.d).*x(3) - par.l.*(x(1) - par.xR);
    x(1) = arg ./ (1.0 + abs(arg));
end