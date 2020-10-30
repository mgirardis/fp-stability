function h = plotManifoldXY(ax,xRange,yRange,z,plotFunc,plotProperties,makeNaNTransparent)
    if isempty(ax)
        ax = axes;
    end
    if (nargin < 5) || isempty(plotFunc)
        plotFunc = 'imagesc'; % 'imagesc' or 'pcolor'
    end
    if (nargin < 6) || isempty(plotProperties)
        plotProperties = {};
    end
    if (nargin < 7) || isempty(makeNaNTransparent)
        makeNaNTransparent = true;
    end
    assert(any(strcmpi(plotFunc,{'imagesc','pcolor'})),'plotFunc must be either imagesc or pcolor');
    if strcmpi(plotFunc,'pcolor')
        [xgrid,ygrid] = fix_XY_range_pcolor(xRange,yRange,z);
        h = pcolor(xgrid, ygrid, [[z;NaN(1,size(z,2))],NaN(size(z,1)+1,1)]);
        h.EdgeColor = 'none';
    else
        [xRange,yRange] = fix_XY_range_imagesc(xRange,yRange,z);
        h=imagesc(ax,xRange,yRange,z);
        if makeNaNTransparent
            h.AlphaData = ~isnan(z);
        end
        ax.YDir = 'normal';
    end
    if ~isempty(plotProperties)
        set(h,plotProperties{:});
    end
end

function [xRange,yRange] = fix_XY_range_imagesc(xRange,yRange,z)
    if isvector(xRange)
        if numel(xRange) ~= size(z,2)
            xx = minmax(xRange(:)');
            xRange = linspace(xx(1),xx(2),size(z,2));
        end
    else
        xx = minmax(xRange(:)');
        xRange = linspace(xx(1),xx(2),size(z,2));
    end
    if isvector(yRange)
        if numel(yRange) ~= size(z,2)
            yy = minmax(yRange(:)');
            yRange = linspace(yy(1),yy(2),size(z,1));
        end
    else
        yy = minmax(yRange(:)');
        yRange = linspace(yy(1),yy(2),size(z,1));
    end
end

function [xRange,yRange] = fix_XY_range_pcolor(xRange,yRange,z)
    if isvector(xRange) || isvector(yRange)
        if isvector(xRange)
            xx = [xRange(1),xRange(end)];
        else
            xx = minmax(xRange(:)');
        end
        if isvector(yRange)
            yy = [yRange(1),yRange(end)];
        else
            yy = minmax(yRange(:)');
        end
        [xRange,yRange] = meshgrid(linspace(xx(1),xx(2),size(z,2)+1),linspace(yy(1),yy(2),size(z,1)+1));
    end
end