function Y = linearTransf(X,xLim,yLim)
    if (nargin < 2) || isempty(xLim)
        xLim = minmax(X(:)');
    end
    b = diff(yLim) / diff(xLim);
    a = yLim(1) - b * xLim(1);
    Y = a + b.*X;
end