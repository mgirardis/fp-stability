function lh = plotVerticalLines(axh,x,varargin)
    if isempty(axh)
        axh = axes;
    end
    
    [yMax,lineArgs] = getParamValue('ymax',varargin,true);
    [yMin,lineArgs] = getParamValue('ymin',lineArgs,true);
    yMax = repeatToComplete(yMax,numel(x));
    yMin = repeatToComplete(yMin,numel(x));

    yLim0 = axh.YLim;
    lh = gobjects(numel(x),1);
    hold(axh,'on')
    for i = 1:numel(x)
        if isnan(x(i))
            continue;
        end
%         line(axh, [x(i),x(i)], axh.YLim, 'LineStyle', lineStyle{i}, 'Color', lineColor{i}, 'LineWidth', lineWidth{i}, args{:});
        yLim = getYLim(yMin,yMax,yLim0,i);
        lh(i) = line(axh,[x(i),x(i)], yLim, lineArgs{:});
    end
    hold(axh,'off')
end

function yLim = getYLim(yMin,yMax,yLim,k)
    if ~isempty(yMin) && ~isnan(yMin(k))
        yLim(1) = yMin(k);
    end
    if ~isempty(yMax) && ~isnan(yMax(k))
        yLim(2) = yMax(k);
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
