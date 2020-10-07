function r = getRoot(p,k,dim)
% returns root k of the polynomial given by p
% if p is a vector, then simply call r = roots(p) and returns r(k)
% if p is a matrix it defines a polynomial of degree size(p,dim)
%      and the k root is returned for all the coefficient sets along the other dimension than dim
    if (nargin < 3) || isempty(dim)
        dim = 1;
    end
    if isvector(p)
        r = roots(p(:));
        r = r(k);
    else
        if dim == 1
%             getCoeff = @(x,j) x(:,j);
            N = size(p,2);
            r = zeros(1,N);
            r = complex(r,r);
            r = getRoot_internal(r,p,k,N,@(x,j) x(:,j));
        elseif dim == 2
%             getCoeff = @(x,j) x(j,:);
            N = size(p,1);
            r = zeros(N,1);
            r = complex(r,r);
            r = getRoot_internal(r,p,k,N,@(x,j) x(j,:));
        else
            error('function not defined for multidimensional p')
        end
    end
end

function r = getRoot_internal(r,p,k,N,getCoeff)
    for i = 1:N
        rr = roots(getCoeff(p,i));
        r(i) = rr(k);
    end
end