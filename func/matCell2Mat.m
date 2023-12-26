function r = matCell2Mat(A)
    if iscell(A)
        try
            n = numel(A);
            [mA,nA] = size(A{1});
            r = zeros(n,mA*nA);
            for i = 1:n
                r(i,:) = reshape(A{i},1,mA*nA);
            end
        catch e
            if strcmpi(e.identifier,'MATLAB:getReshapeDims:notSameNumel')
                numElemA = cell2mat(cellfun(@(x)numel(x),A,'UniformOutput',false));
                N = max(numElemA);
                n = numel(A);
                r = NaN(n,N);
                for i = 1:n
                    r(i,1:numElemA(i)) = reshape(A{i},1,numElemA(i));
                end
            else
                rethrow(e);
            end
        end
    else
        if numel(size(A)) == 3 % 3D array
            [mA,nA,s] = size(A);
            r = reshape(A,mA*nA,s)';
        else
            [mA,nA] = size(A);
            r = reshape(A,1,mA*nA);
        end
    end
end