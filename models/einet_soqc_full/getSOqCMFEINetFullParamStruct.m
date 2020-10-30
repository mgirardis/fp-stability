function par = getSOqCMFEINetFullParamStruct(I,Gamma,p,q,J,A,tauW,tauT,u)
    par = struct('I',I,'G',Gamma,'p',p,'q',q,'J',J,'A',A,'tauW',tauW,'tauT',tauT,'u',u);
    if nargin == 0
        return;
    end
    par.I = I;
    par.G = Gamma;
    par.p = p;
    par.q = q;
    par.J = J;
    par.A = A;
    par.tauW = tauW;
    par.tauT = tauT;
    par.u = u;
end