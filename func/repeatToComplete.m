function y = repeatToComplete(x,N)
% y = [ x(:)', x(:)', ..., x(:)' ]; such that y is [1,N] vector
    if isempty(x)
        y = x;
        return
    end
    if iscell(x)
        y = cell(1,N);
    else
        y = zeros(1,N);
    end
    x = x(:)';
    n = numel(x);
    m = floor(N/n);
    if m < 1
        y = x(1:N);
        return
    end
    y(1:(m*n)) = repmat(x, 1, m);
    y((m*n+1):N) = x(1:(N-m*n));
    if ischar(x)
        y = char(y);
    end
end
