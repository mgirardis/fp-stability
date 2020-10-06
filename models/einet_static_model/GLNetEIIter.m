function x = GLNetEIIter(par, x, ~)
    x(2) = x(2);
    x(1) = par.G0.*(1-x(1)).*(par.h+par.W.*x(1)+par.Iext);
end

%phi_func = @(V,G,theta) G.*(V-theta).*heaviside(V-theta).*heaviside(theta+1./G-V)+heaviside(V-(theta+1./G));