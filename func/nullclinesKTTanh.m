function [nn,fp] = nullclinesKTTanh(par,x,asFunc)
% nn.nx = nullcline X
% nn.ny = nullcline Y
% fp.xS = x star
% fp.yS = y star
    if (nargin < 3) || isempty(asFunc)
        asFunc = false;
    end
    if (nargin < 2) || isempty(x)
        x = linspace(-1+1e299*realmin,1-1e299*realmin,10000);
    end
    if asFunc
        nn.nx = nullclineX(par.K,par.T,par.H,NaN);
        nn.ny = nullclineY(NaN);
        fp = struct('x',[],'y',[]);
        [fp.x,fp.y] = findInter(x,nn.nx,nn.ny);
    else
        n1 = nullclineX(par.K,par.T,par.H,x);
        n2 = nullclineY(x);
        nn.nx = n1(:);
        nn.ny = n2(:);
        [fp.x,fp.y] = findInter(x,nn.nx,nn.ny);
    end
end

function n = nullclineX(K,T,H,x)
    if isnan(x)
        n = @(x)(x + H - T.*atanh(x)) ./ K;
    else
        n = (x + H - T.*atanh(x)) ./ K;
    end
end

function n = nullclineY(x)
    if isnan(x)
        n = @(x)x;
    else
        n = x;
    end
end