function h = plotManifoldXY(xRange,yRange,z,pcolorProperties)
    if (nargin < 4) || isempty(pcolorProperties)
        pcolorProperties = {};
    end
    [xgrid,ygrid] = meshgrid(linspace(xRange(1),xRange(end),size(z,2)+1),linspace(yRange(1),yRange(end),size(z,1)+1));
    h = pcolor(xgrid, ygrid, [[z;NaN(1,size(z,2))],NaN(size(z,1)+1,1)]);
    h.EdgeColor = 'none';
    if ~isempty(pcolorProperties)
        set(h,pcolorProperties{:});
    end
end