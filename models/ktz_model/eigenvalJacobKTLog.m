function lambda = eigenvalJacobKTLog(par, isCellOut)
% if isCellOut == 1, then lambda is a cell(1,2) so that K, T or H param may be matrixes
    if nargin < 2 || isempty(isCellOut)
        isCellOut = 0;
    end
    if iscell(par.xS)
        n = numel(par.xS);
        lambda = cell(size(par.xS));
        for i = 1:n
            lambda{i} = eigenvalJacobKTLog_internal(par.K,par.T,par.H,par.xS{i},isCellOut);
        end
    else
        lambda = eigenvalJacobKTLog_internal(par.K,par.T,par.H,par.xS,isCellOut);
    end
end

function lambda = eigenvalJacobKTLog_internal(K,T,H,xS,isCellOut)
    if ~isCellOut
        K = K(:)';
        T = T(:)';
        H = H(:)';
        xS = xS(:)';
    end
    p2 = (T + abs((1-K).*xS + H)).^2;
    T2P2 = T ./ (2 .* p2);
    s = sqrt(1 - 2.*K./T2P2);
    if isCellOut
        lambda = { (T2P2 .* (1 + s)), (T2P2 .* (1 - s)) };
    else
        lambda = [ T2P2 .* (1 + s); T2P2 .* (1 - s)];
    end
end