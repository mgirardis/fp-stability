function x = GLNetEI_Full_Iter(par, x, ~)
    x(2) = x(2);
    A = par.h+par.W.*x(1);
    x(1) = (1-x(1)).*(par.G0.*A.*heaviside(A).*heaviside((1./par.G0) - A) + heaviside(A-(1./par.G0)));
end