function x = KTLogIter(par, x)
    arg = (x(1) - par.K.*x(2) + par.H) ./ par.T;
    x(2) = x(1);
    x(1) = arg ./ (1.0 + abs(arg));
end