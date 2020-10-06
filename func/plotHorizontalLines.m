function lh = plotHorizontalLines(axh,y,varargin)
    if isempty(axh)
        axh = axes;
    end
    
    [xMax,lineArgs] = getParamValue('xmax',varargin,true);
    [xMin,lineArgs] = getParamValue('xmin',lineArgs,true);
    xMax = repeatToComplete(xMax,numel(y));
    xMin = repeatToComplete(xMin,numel(y));

    xLim0 = axh.XLim;
    lh = gobjects(numel(y),1);
    hold(axh,'on')
    for i = 1:numel(y)
        if isnan(y(i))
            continue;
        end
%         line(axh, [x(i),x(i)], axh.YLim, 'LineStyle', lineStyle{i}, 'Color', lineColor{i}, 'LineWidth', lineWidth{i}, args{:});
        xLim = getXLim(xMin,xMax,xLim0,i);
        lh(i) = line(axh, xLim, [y(i),y(i)], lineArgs{:});
    end
    hold(axh,'off')
end

function xLim = getXLim(xMin,xMax,xLim,k)
    if ~isempty(xMin) && ~isnan(xMin(k))
        xLim(1) = xMin(k);
    end
    if ~isempty(xMax) && ~isnan(xMax(k))
        xLim(2) = xMax(k);
    end
end

function [v,parList] = getParamValue(parName,parList,delParFromList)
    if (nargin < 3) || isempty(delParFromList)
        delParFromList = false;
    end
    k = find(strcmpi(parList,parName));
    if isempty(k)
        v = [];
        return;
    end
    if k == numel(parList)
        error(['missing parameter value for ', parName]);
    end
    v = parList{k+1};
    if delParFromList
        parList(k:(k+1)) = [];
    end
end

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
