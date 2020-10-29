function h = plotManifoldXY(ax,xRange,yRange,z,plotFunc,plotProperties)
    if isempty(ax)
        ax = axes;
    end
    if (nargin < 5) || isempty(plotFunc)
        plotFunc = 'imagesc'; % 'imagesc' or 'pcolor'
    end
    if (nargin < 6) || isempty(plotProperties)
        plotProperties = {};
    end
    assert(any(strcmpi(plotFunc,{'imagesc','pcolor'})),'plotFunc must be either imagesc or pcolor');
    if strcmpi(plotFunc,'pcolor')
        [xgrid,ygrid] = meshgrid(linspace(xRange(1),xRange(end),size(z,2)+1),linspace(yRange(1),yRange(end),size(z,1)+1));
        h = pcolor(xgrid, ygrid, [[z;NaN(1,size(z,2))],NaN(size(z,1)+1,1)]);
        h.EdgeColor = 'none';
    else
        h=imagesc(ax,xRange,yRange,z);
        h.AlphaData = ~isnan(z);
        ax.YDir = 'normal';
    end
    if ~isempty(plotProperties)
        set(h,plotProperties{:});
    end
end