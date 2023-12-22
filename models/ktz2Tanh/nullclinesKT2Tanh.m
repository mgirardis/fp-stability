function [nn,fp] = nullclinesKT2Tanh(par,x,asFunc)
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
        nn.nx = nullclineX(par.K,par.T,par.Z,NaN);
        nn.ny = nullclineY(par.T,par.H,NaN);
        fp    = struct('x',[],'y',[]);
        [fp.x,fp.y] = findInter(x,nn.nx,nn.ny);
    else
        n1 = nullclineX(par.K,par.T,par.Z,x);
        n2 = nullclineY(par.T,par.H,x);
        nn.nx = n1(:);
        nn.ny = n2(:);
        [fp.x,fp.y] = findInter(x,nn.nx,nn.ny);
    end
end

function n = nullclineX(K,T,Z,x)
    if isnan(x)
        n = @(x)(x + Z - T.*atanh(x)) ./ K;
    else
        n = (x + Z - T.*atanh(x)) ./ K;
    end
end

function n = nullclineY(T,H,x)
    if isnan(x)
        n = @(x)tanh((x+H)./T);
    else
        n = tanh((x+H)./T);
    end
end