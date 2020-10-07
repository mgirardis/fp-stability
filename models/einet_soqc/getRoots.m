function r = getRoots(p,dim)
% returns root k of the polynomial given by p
% if p is a vector, then simply call r = roots(p) and returns r(k)
% if p is a matrix it defines a polynomial of degree size(p,dim)
%      and the k root is returned for all the coefficient sets along the other dimension than dim
    if (nargin < 2) || isempty(dim)
        dim = 1;
    end
    if isvector(p)
        r = roots(p(:));
    else
        n = size(p,dim)-1; % number of roots is one less than the number of coefficients of p
        if dim == 1
            N = size(p,2);
            r = zeros(n,N);
            r = complex(r,r);
            r = getRoots_internal(r,p,N,@(x,j) x(:,j));
        elseif dim == 2
            N = size(p,1);
            r = zeros(n,N);
            r = complex(r,r);
            r = getRoots_internal(r,p,N,@(x,j) x(j,:))';
        else
            error('function not defined for multidimensional p')
        end
    end
end

function r = getRoots_internal(r,p,N,getCoeff)
    for i = 1:N
        r(:,i) = roots(getCoeff(p,i));
    end
end