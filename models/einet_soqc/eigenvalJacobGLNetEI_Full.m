function lambda = eigenvalJacobGLNetEI_Full(par,~,~)
    sz = size(par.xS);
    r = ones(sz);
    s = ones(sz);
    W = par.W;
    h = par.h;
    G = par.G0;
    if isscalar(h)
        h = repmat(h,sz);
    end
    if isscalar(W)
        W = repmat(W,sz);
    end
    if isscalar(G)
        G = repmat(G,sz);
    end
    s((par.xS == 0) & (h < 0)) = 0;
    s((par.xS > 0) & ((W.*par.xS+h)<0)) = 0;
    r((par.xS == 0) & (h<(1./G))) = 0;
    r((par.xS > 0) & ((h+W.*par.xS)<(1./G))) = 0;
%     s = zeros(sz);
%     r = zeros(sz);
%     s((par.h+par.W.*par.xS)>=0) = 1;
%     r((par.h+par.W.*par.xS-1./par.G0)>=0) = 1;
    l = ev(par.xS,W,h,G,s,r);
    %l = par.G0.*(-par.h + par.par.W - 2.*par.par.W.*par.xS); % xS -> rhoS
    lambda = [ l(:)';...
               l(:)' ];
end

function l = ev(xS,W,h,G,s,r)
    l = -r+(r-1).*s.*G.*(h+W.*(-1+2.*xS));
end