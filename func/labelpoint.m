function [ht,hl] = labelpoint(pt,str,marker,txtArgs,lineArgs,axh)
    if (nargin < 3) || isempty(marker)
        marker = '.';
    end
    if (nargin < 4) || isempty(txtArgs)
        txtArgs = {};
    end
    if (nargin < 5) || isempty(lineArgs)
        lineArgs = {};
    end
    if (nargin < 6) || isempty(axh)
        axh = gca;
    end
    x = pt(1);
    y = pt(2);
    hl = line(axh,x,y);
    hl.Marker = marker;
    if ~isempty(lineArgs)
        set (hl,lineArgs{:});
    end
    ht = text(axh,x,y,str);
    ht.HorizontalAlignment = 'center';
    ht.VerticalAlignment = 'bottom';
    if ~isempty(txtArgs)
        set (ht,txtArgs{:});
    end
end