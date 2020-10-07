function par = getSOqCMFEINetParamStruct(I,Gamma,p,q,J,A,tau,u)
    par = struct('I',I,'G',Gamma,'p',p,'q',q,'J',J,'A',A,'T',tau,'u',u);
    if nargin == 0
        return;
    end
    par.I = I;
    par.G = Gamma;
    par.p = p;
    par.q = q;
    par.J = J;
    par.A = A;
    par.T = tau;
    par.u = u;
end