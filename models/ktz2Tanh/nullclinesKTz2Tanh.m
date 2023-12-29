function [nn,fp] = nullclinesKTz2Tanh(par,x,asFunc)
% nn.nx = nullcline X
% nn.ny = nullcline Y
% nn.nz = nullcline Z
% fp.xS = x star
% fp.yS = y star
% fp.zS = z star
    if (nargin < 3) || isempty(asFunc)
        asFunc = false;
    end
    if (nargin < 2) || isempty(x)
        x = linspace(-1+1e299*realmin,1-1e299*realmin,10000);
    end
    if asFunc
        nn.nx = nullclineX(par.K,par.T,par.H,par.Q,NaN);
        nn.nz = nullclineZ(par.d,par.l,par.xR,NaN);
        fp = struct('x',[],'y',[],'z',[]);
        [fp.x,fp.z] = findInter(x,nn.nx,nn.nz);
        fp.y = tanh((fp.x+par.H)./par.T);
    else
        n1 = nullclineX(par.K,par.T,par.H,par.Q,x);
        n2 = nullclineZ(par.d,par.l,par.xR,x);
        nn.nx = n1(:);
        nn.nz = n2(:);
        nn.x = x(:);
        fp = struct('x',[],'y',[],'z',[]);
        [fp.x,fp.z] = findInter(x,nn.nx,nn.nz);
        fp.y = tanh((fp.x+par.H)./par.T);
    end
end

function n = nullclineX(K,T,H,Q,x)
    if isnan(x)
        n = @(x) K.*tanh((x+H)./T) - x - Q + T.*atanh(x);
    else
        n = K.*tanh((x+H)./T) - x - Q + T.*atanh(x);
    end
end

function n = nullclineZ(d,l,xR,x)
    if isnan(x)
        n = @(x)(xR-x).*l./d;
    else
        n = (xR-x).*l./d;
    end
end