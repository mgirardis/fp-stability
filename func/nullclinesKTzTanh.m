function [nn,fp] = nullclinesKTzTanh(par,x,asFunc)
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
        nn.nx = nullclineX(par.K,par.T,par.H,NaN);
        nn.nz = nullclineZ(par.d,par.l,par.xR,NaN);
        fp = struct('x',[],'y',[],'z',[]);
        [fp.x,fp.z] = findInter(x,nn.nx,nn.nz);
        fp.y = fp.x;
    else
        n1 = nullclineX(par.K,par.T,par.H,x);
        n2 = nullclineZ(par.d,par.l,par.xR,x);
        nn.nx = n1(:);
        nn.nz = n2(:);
        nn.x = x(:);
        fp = struct('x',[],'y',[],'z',[]);
        [fp.x,fp.z] = findInter(x,nn.nx,nn.nz);
        fp.y = fp.x;
    end
end

function n = nullclineX(K,T,H,x)
    if isnan(x)
        n = @(x)(K-1).*x - H + T.*atanh(x);
    else
        n = (K-1).*x - H + T.*atanh(x);
    end
end

function n = nullclineZ(d,l,xR,x)
    if isnan(x)
        n = @(x)(xR-x).*l./d;
    else
        n = (xR-x).*l./d;
    end
end