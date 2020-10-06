function c = findImagEVCollision(fp,tol)
% finds the values of fp.par in which any pair of imag(fp.ev) becomes zero simultaneously (within tol tolerance)
% the search is performed for all the fp in the struct array fp
    if (nargin < 2) || isempty(tol)
        tol = 0; % tolerance for zero;
    end
    c = [];
    for i = 1:numel(fp)
        cc = findImagEVCollision_internal(fp(i),tol);
        c((numel(c)+1):(numel(c)+numel(cc))) = cc;
    end
    c = sort(c);
end

function c = findImagEVCollision_internal(fp,tol)
    [nEV,nPar] = size(fp.ev); % number of EV (3 for 3D, 2 for 2D)
    pairs = nchoosek(1:nEV,2); % determines all the pairs
    nPairs = size(pairs,1); % number of pairs
    k0 = false(1,nPar);
    for i = 1:nPairs % for each pair
        k0 = k0 | all(abs(imag(fp.ev(pairs(i,:),:)))<=tol,1); % given a the pair i, determines all the fp.par points in which the pair is <= tol
        % not tested: k0 = k0 | all(abs(diff(abs(imag(fp.ev(pairs(i,:),:)))))<=tol,1); % given a the pair i, determines all the fp.par points in which the pair is <= tol
%         j = pairs(i,1);
%         k = pairs(i,2);
%         [~,yi,ind] = findInter(fp.par,imag(fp.ev(j,:)),imag(fp.ev(k,:)));
%         k0(ind(abs(yi)<=tol)) = true;
        %c((numel(c)+1):(numel(c)+numel(xi))) = xi;
    end
    c = fp.par(sort([(strfind(k0,[0,1])+1), strfind(k0,[1,0])])); % finding values of fp.par in which any pair becomes zero or stop being zero ('bifurcations')
end