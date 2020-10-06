function axh = createLegend(fh, legText, legSymbol, legLine, legColor, boxArgs, textArgs, lineArgs, lineColWidth)
    if isempty(fh)
        fh = gcf;
    end
    if ((nargin < 6) || (isempty(boxArgs)))
        boxArgs = {};
    end
    if ((nargin < 7) || (isempty(textArgs)))
        textArgs = {};
    end
    if ((nargin < 8) || (isempty(lineArgs)))
        lineArgs = {};
    end
    if ((nargin < 9) || (isempty(lineColWidth)))
        lineColWidth = 60;
    end
    
    n = numel(legText);
    wLS = lineColWidth; % in pixels

    figure(fh);
    [ boxSt, boxArgs, cBox ] = getArgValue(boxArgs, 'box');
    [ eColor, boxArgs, cEC ] = getArgValue(boxArgs, 'edgecolor');
    [ bgColor, boxArgs, cBGC ] = getArgValue(boxArgs, 'color');
    [ posVal, boxArgs, cPos ] = getArgValue(boxArgs, 'position');
    [ fontSize, textArgs, cFS ]  = getArgValue(textArgs, 'fontsize');
    [ displace, textArgs, cDisp ]  = getArgValue(textArgs, 'displacement');
    [ lw, lineArgs, cLW ]  = getArgValue(lineArgs, 'LineWidth');
    if (cLW)
        if isscalar(lw)
            lw = lw .* ones(1,n);
        else
            if isvector(lw)
                if numel(lw) ~= n
                    error('createLegend:lineArgs:LineWidth', 'LineWidth should be either a scalar or a vector of size legText');
                end
            else
                error('createLegend:lineArgs:LineWidth', 'LineWidth should be either a scalar or a vector of size legText');
            end
        end
    else
        lw = ones(1,n);
    end
    if ~cFS
        fontSize = 9;
    end
    if ~cBox
        boxSt = 'on';
    end
    if strcmpi(boxSt, 'on')
        if ~cEC
            eColor = 'k';
        end
        if ~cBGC
            bgColor = [1,1,1];
        end
    else
        eColor = 'none';
        bgColor = 'none';
    end
    [w,h] = estimateWH(legText, fontSize);
    w = (w + wLS) ./ fh.Position(3);
    h = h ./ fh.Position(4);
    if cPos
        if numel(posVal) == 2
            posVal = [ posVal(1), posVal(2), w, h ];
        end
    else
        posVal = [1-w,1-h,w,h];
    end

    axh = axes('XTickLabel', [], 'XTick', [], 'XColor', eColor, 'YTickLabel', [], 'YTick', [], 'YColor', eColor, 'Box', boxSt, 'Color', bgColor, 'Position', posVal, boxArgs{:});
    
    axh.Units = 'pixels';
    axW_px = axh.Position(3);
    axh.Units = 'normalized';
    
    x0 = wLS ./ axW_px;
    dy = 1/n/2;
    
    Dx = 0;
    Dy = 0;
    if cDisp
        Dx = displace(1);
        Dy = displace(2);
    end

    hold(axh, 'all');
    for i = 1:n
        ss = strsplit(legSymbol{i},',');
        ll = strsplit(legLine{i},',');
        if numel(ss) ~= numel(ll)
            error('createLegend:legSymbol:legLine', 'number of lines and number of symbols for each legend element must match');
        end
        y = 1-dy - (i-1)*(1/n);
        ns = numel(ss);
        dx = x0 / ns;

        for j = 1:ns
            x0l = 5 / axW_px + (dx + 5 / axW_px) * (j - 1);
            x1l = (dx + 5 / axW_px) * j;
            if ~isempty(ll{j})
                line([x0l,x1l], [y,y], 'LineStyle', ll{j}, 'Marker', 'none', 'Color', legColor{j,i}, 'LineWidth', lw(i), lineArgs{:});
            end
            if ~isempty(ss{j})
                line((x0l + x1l) / 2, y, 'LineStyle', 'none', 'Marker', ss{j}, 'Color', legColor{j,i}, 'MarkerFaceColor', legColor{j,i}, lineArgs{:});
            end
        end
        text(x0 + 12 / axW_px + Dx, y + Dy, legText{i}, 'FontSize', fontSize, textArgs{:});
    end
    hold(axh, 'off');
end

function [w,h] = estimateWH(t, fontSize)
    n = numel(t);
    m = numel(t{1});
    for i = 2:n
        if numel(t{i}) > m
            m = numel(t{i});
        end
    end
    w = pointsToPixels(m * fontSize);
    h = pointsToPixels(n * fontSize);
end

function pixels = pointsToPixels(points)
    pixels = ceil((4/3) .* points);
end

function [val,argsOut,c] = getArgValue(args, arg)
    argsOut = args;
    ind = find(strcmpi(args,arg));
    if (~isempty(ind))
        val = argsOut{ind+1};
        argsOut(ind+1) = [];
        argsOut(ind) = [];
        c = true;
    else
        val = [];
        c = false;
    end
end