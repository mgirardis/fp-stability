function h = plotManifoldXY(ax,xRange,yRange,z,plotProperties)
    if isempty(ax)
        ax = axes;
    end
    if (nargin < 5) || isempty(plotProperties)
        plotProperties = {};
    end
%     [xgrid,ygrid] = meshgrid(linspace(xRange(1),xRange(end),size(z,2)+1),linspace(yRange(1),yRange(end),size(z,1)+1));
%     h = pcolor(xgrid, ygrid, [[z;NaN(1,size(z,2))],NaN(size(z,1)+1,1)]);
%     [xgrid,ygrid] = meshgrid(linspace(xRange(1),xRange(end),size(z,2)),linspace(yRange(1),yRange(end),size(z,1)));
%     h = pcolor(xgrid, ygrid, z);
%     h.EdgeColor = 'none';
    h=imagesc(ax,xRange,yRange,z);
    h.AlphaData = ~isnan(z);
    ax.YDir = 'normal';
    if ~isempty(plotProperties)
        set(h,plotProperties{:});
    end
end