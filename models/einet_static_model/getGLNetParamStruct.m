function par = getGLNetParamStruct(VR, VB, VT, mu, J, Gamma0, tau0, Gamma1, tau1, delta,...
                                   pS, pR, x0, Iext,...
                                   h, W, pExc, qInh)
    par = struct('VR', 0, 'VB', 0, 'VT', 0, 'mu', 0, 'J', 0, 'G0', 0, 't0', 0, 'G1', 0, 't1', 0, 'd', 0,...
                 'pS', 0, 'pR', 0, 'x0', 0, 'Iext', 0,...
                 'h', 0, 'W', 0, 'pE', 0, 'qI', 0);
    if nargin == 0
        return;
    end
    if (nargin < 1) || isempty(VR)
        VR = 0;
    end
    if (nargin < 3) || isempty(VT)
        VT = 0;
    end
    if (nargin < 7) || isempty(tau0)
        tau0 = NaN;
    end
    if (nargin < 8) || isempty(Gamma1)
        Gamma1 = NaN;
    end
    if (nargin < 9) || isempty(tau1)
        tau1 = NaN;
    end
    if (nargin < 10) || isempty(delta)
        delta = NaN;
    end
    if (nargin < 11) || isempty(pS)
        pS = NaN;
    end
    if (nargin < 12) || isempty(pR)
        pR = NaN;
    end
    if (nargin < 13) || isempty(x0)
        x0 = NaN;
    end
    if (nargin < 14) || isempty(Iext)
        Iext = 0;
    end
    if (nargin < 15) || isempty(h)
        h = NaN;
    end
    if (nargin < 16) || isempty(W)
        W = NaN;
    end
    if (nargin < 17) || isempty(pExc)
        pExc = NaN;
    end
    if (nargin < 18) || isempty(qInh)
        qInh = NaN;
    end
    par.VR = VR;
    par.VB = VB;
    par.VT = VT;
    par.mu = mu;
    par.J = J;
    par.G0 = Gamma0;
    par.t0 = tau0;
    par.G1 = Gamma1;
    par.t1 = tau1;
    par.d = delta;
    par.pS = pS;
    par.pR = pR;
    par.x0 = x0;
    par.Iext = Iext;
    par.h = h;
    par.W = W;
    par.pE = pExc;
    par.qI = qInh;
end