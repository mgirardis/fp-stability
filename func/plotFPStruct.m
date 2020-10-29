function [h,hEV,axhFP,evAx] = plotFPStruct(axhFP, fp, lineSt, plotEV, useSameFigForEV, axEV, xAxisScale, xAxisLabel, lineColor, fpToPlot, showUnstable, plotArgs)
% axhFP           ->                          if provided, plots in this axis
% fp              -> (only required argument) the fp struct generated by getFixedPoints
% lineSt          -> (not required)           line style (see below for specification)
% plotEV          -> (not required)           if true, plots eigenvalues too
% useSameFigForEV -> (not required)           if true, plots eigenvalues in the same fig (needs plotEV==true)
% axEV            ->                          if provided, plots EV in this axis (needs plotEV==true)
% xAxisScale      -> (not required)           constant multiplied by x-axis (parameter value) (useful to rescale x-axis)
% xAxisLabel      -> (not required)           useful if you set xAxisScale ~= 1 (then you set this parameter to include xAxisScale to the x-axis label)
% lineColor       -> (not required)           color of the FP lines (default is black)
% fpToPlot        -> (not required)           which fp to plot (default is xS, but can be any, or all)
% showUnstable    -> (not required)           if set, shows unstable FP (default is true)
% plotArgs        -> (not required)           additional args to the plot function (it is a cell of type {'param',value,'param',value} )
%
%lineSt = { line_style_stable, line_style_unstable, line_style_saddle }
% if plotEV true, then plot eigen values of fixed points
% if plotEV = vector of indices, plot only eigen values corresponding to FP identified by the indices in plotEV
%
% returns:
% h -> cell of line handlers for the FP lines
% hEV -> cell of line handlers for the eigenval lines (if plotted)
% axhFP -> axis handler for the FP plot
% evAx -> axis handler for the eigenval plot
%
    if (nargin < 3) || isempty(lineSt)
        lineSt = { '-', ':', '--' };
    end
    if (nargin < 4) || isempty(plotEV)
        plotEV = false;
    end
    if (nargin < 5) || isempty(useSameFigForEV)
        useSameFigForEV = false;
    end
    if (nargin < 6) || isempty(axEV)
        axEV = [];
    end
    if (nargin < 7) || isempty(xAxisScale)
        xAxisScale = 1; % constant to be multiplied to the x-axis values in all the plots
    end
    if (nargin < 8) || isempty(xAxisLabel)
        xAxisLabel = ''; % useful if xAxisScale is set
    end
    if (nargin < 9) || isempty(lineColor)
        lineColor = [0,0,0]; % useful if xAxisScale is set
    end
    if (nargin < 10) || isempty(fpToPlot)
        fpToPlot = {'xS'}; % plots only xS; this list can contain 'x','y','z' for separate plots of each of the fixed points
    end
    if (nargin < 11) || isempty(showUnstable)
        showUnstable = true;
    end
    if (nargin < 12) || isempty(plotArgs)
        plotArgs = cellfun(@(x){},cell(1,numel(fp)),'UniformOutput',false);
    end
    [fp_up_st_lim,plotArgs] = getParamValue('FPUpStabLim',plotArgs,true);
    if isempty(fp_up_st_lim)
        fp_up_st_lim = Inf;
    end
    [fp_down_st_lim,plotArgs] = getParamValue('FPDownStabLim',plotArgs,true);
    if isempty(fp_down_st_lim)
        fp_down_st_lim = -Inf;
    end
    [fp_ud_lim_ls,plotArgs] = getParamValue('FPUDLimLineStyle',plotArgs,true);
    if isempty(fp_ud_lim_ls)
        fp_ud_lim_ls = '-.';
    end
    if ~isCellOfCells(plotArgs)
        plotArgs = repmat({plotArgs},1,numel(fp));
    end
    if numel(fpToPlot)>1
        if ~isempty(axhFP)
            if numel(axhFP) ~= numel(fpToPlot)
                n = numel(axhFP);
                axhFP = [axhFP(:)',gobjects(1,numel(fpToPlot)-numel(axhFP))];
                for i = (n+1):numel(axhFP)
                    figure;
                    axhFP(i) = axes;
                end
            end
        end
    end
    if isempty(axhFP)
        axhFP = gobjects(1,numel(fpToPlot));
        for i = 1:numel(fpToPlot)
            figure;
            axhFP = axes;
        end
    end
    ae = gobjects(1,numel(fpToPlot));
    [h,hEV,~,ae(1)] = plotFPStruct_internal(axhFP(1), fp, lineSt, plotEV, useSameFigForEV, axEV, xAxisScale, xAxisLabel,...
                                            lineColor, fpToPlot{1}, getFPName(fp(1).fpName,fpToPlot{1}), showUnstable,...
                                            plotArgs, fp_up_st_lim, fp_down_st_lim, fp_ud_lim_ls);
    if ~useSameFigForEV
        plotEV = false;
    end
    if numel(fpToPlot)>1
        hh=h;
        he=hEV;
        h = cell(1,numel(fpToPlot));
        hEV = cell(1,numel(fpToPlot));
        h{1} = hh;
        hEV{1} = he;
    end
    for i = 2:numel(fpToPlot)
        [h{i},hEV{i},~,ae(i)] = plotFPStruct_internal(axhFP(i), fp, lineSt, plotEV, useSameFigForEV, axEV, xAxisScale, xAxisLabel,...
                                                      lineColor, fpToPlot{i}, getFPName(fp(1).fpName,fpToPlot{i}), showUnstable,...
                                                      plotArgs, fp_up_st_lim, fp_down_st_lim, fp_ud_lim_ls);
    end
    evAx = ae;
end

function r = isCellOfCells(c)
    r = (iscell(c) && ~isempty(c)) && all(reshape(cellfun(@iscell,c),[],1));
end

function [h,hEV,axhFP,evAx] = plotFPStruct_internal(axhFP, fp, lineSt, plotEV, useSameFigForEV, axEV, xAxisScale, xAxisLabel, lineColor, fpToPlot, fpName, showUnstable, plotArgs, fp_up_st_lim, fp_down_st_lim, fp_ud_lim_ls)
    if isa(xAxisScale,'function_handle')
        xAxisScaleFunc = xAxisScale;
    else
        xAxisScaleFunc = @(x)xAxisScale.*x;
    end
    if ~iscell(lineSt)
        lineSt = { lineSt };
    end
    if numel(lineSt) == 1
        lineSt{2} = ':';
        lineSt{3} = '--';
    end
    if numel(lineSt) == 2
        lineSt{3} = '--';
    end
    h = {};
    hold(axhFP, 'all')
    haveHandleVis = false;
    hvis = 'off';
    for i = 1:numel(fp)
        if ~showUnstable && ~strcmp(fp(i).type, 'stable') 
            continue;
        end
        if strcmp(fp(i).type, 'stable')
            ls = lineSt{1};
        elseif strcmp(fp(i).type, 'unstable')
            ls = lineSt{2};
        else
            ls = lineSt{3};
        end
        [x,y,ls] = getFPCurves(xAxisScaleFunc(fp(i).par),fp(i).(fpToPlot),fp_down_st_lim,fp_up_st_lim,ls,fp_ud_lim_ls);
        for j = 1:numel(x)
            if haveHandleVis
                hvis = 'off';
            else
                haveHandleVis = true;
                hvis = 'on';
            end
            h{end+1} = plot(axhFP, x{j}, y{j}, ls{j}, 'LineWidth', 2, 'Color', lineColor, 'HandleVisibility', hvis, plotArgs{i}{:});
        end
        %h{end+1} = plot(axhFP, fp(i).par.*xAxisScale, fp(i).(fpToPlot), ls, 'LineWidth', 2, 'Color', lineColor, plotArgs{i}{:});
    end
    if isempty(xAxisLabel)
        xlabel(axhFP,fp(1).parName);
    else
        if contains(xAxisLabel,'$')
            interpreter = 'latex';
        else
            interpreter = 'tex';
        end
        xlabel(axhFP,xAxisLabel, 'Interpreter', interpreter);
    end
    ylabel(axhFP,fpName);
    hold(axhFP, 'off')
    if plotEV
        c = getEVCurves(fp,plotEV);
        hEV = cell(1,numel(c));
        if useSameFigForEV
            if isempty(axEV)
                axhFP.Position(4) = (4/5) * axhFP.Position(4);
                axhFP.Position(2) = 1-axhFP.Position(4);
                evAx = axes;
                evAx.Position = axhFP.Position;
                axhFP.XTick = [];
                evAx.Position(4) = 1 - axhFP.Position(4) - 0.1;
                evAx.Position(2) = evAx.Position(2) - evAx.Position(4);
            else
                evAx = axEV;
            end
            hold(evAx,'on');
            for i = 1:numel(c)
                hEV{i} = plot(evAx, xAxisScaleFunc(c(i).x), c(i).y, c(i).param{:});
            end
            hold(evAx,'off');
            evAx.XLim = axhFP.XLim;
            evAx.YLim = minmax( reshape([c(:).y],1,[]) );
        else
            if isempty(axEV)
                figure
                evAx = axes;
            else
                evAx = axEV;
            end
            hold(evAx, 'on');
            for i = 1:numel(c)
                hEV{i} = plot(evAx, xAxisScaleFunc(c(i).x), c(i).y, c(i).param{:});
            end
            hold(evAx, 'off');
        end
        legend(evAx,{c(:).legend});
        if isempty(xAxisLabel)
            xlabel(evAx,fp(1).parName);
        else
            xlabel(evAx,xAxisLabel);
        end
        ylabel(evAx,'\Lambda');
        if useSameFigForEV
            evAx.Legend.Position(1) = axhFP.Position(1) + axhFP.Position(3);
        end
    else
        hEV = [];
        evAx = gobjects(1);
    end
end

function [x,y,ls] = getFPCurves(xx,yy,lowerLim,upperLim,lsStd,lsUD)
    x = {};
    y = {};
    ls = {};
    indU = yy>upperLim;
    indD = yy<lowerLim;
    ind  = ~indU & ~indD;
    indU = breakIntoContIntervals(find(indU),1);
    indD = breakIntoContIntervals(find(indD),1);
    ind  = breakIntoContIntervals(find(ind),1);
    if numel(ind) > 0
        for i = 1:numel(ind)
            x{end+1} = xx(ind{i});
            y{end+1} = yy(ind{i});
            ls{end+1} = lsStd;
        end
    end
    if numel(indU) > 0
        for i = 1:numel(indU)
            x{end+1} = xx(indU{i});
            y{end+1} = yy(indU{i});
            ls{end+1} = lsUD;
        end
    end
    if numel(indD) > 0
        for i = 1:numel(indD)
            x{end+1} = xx(indD{i});
            y{end+1} = yy(indD{i});
            ls{end+1} = lsUD;
        end
    end
end

function k = breakIntoContIntervals(ind,parWindow)
    if isempty(ind)
        k = [];
        return
    end
    k = {};
    ji = 1;
    for i = 2:numel(ind)
        if ((ind(i) - ind(i-1)) > parWindow)
            k{end+1} = ind(ji:(i-1));
            ji = i;
        end
    end
    k{end+1} = ind(ji:end);
end

function n = getFPName(nn,fpn)
    if nargin < 2
        fpn = '';
    end
    if contains(nn,',')
        n = strsplit(nn,',','CollapseDelimiters',false);
        if ~isempty(fpn)
            if strcmpi(fpn,'xS')
                n = n{1};
            elseif strcmpi(fpn,'yS')
                n = n{2};
            elseif strcmpi(fpn,'zS')
                if numel(n) >= 3
                    n = n{3};
                else
                    n = 'z*';
                end
            else
                n = 'x*';
            end
        end
    else
        n = nn;
    end
end

function cc = getEVCurves(fp,plotEV)
    if isnumeric(plotEV)
        ind = plotEV;
    else
        ind = 1:numel(fp);
    end
    c = {};
    colors = lines(numel(ind));
    k = 0;
    for i = ind
        k = k + 1;
        ev_R = real(fp(i).ev);
        ev_I = imag(fp(i).ev);
        ev_A = abs(fp(i).ev);
        nEV = size(fp(i).ev,1);
        if all(abs(diff(ev_R)) < 1e-8) % the real parts of both EV are equal
            lInd = strrep(regexprep(num2str(1:nEV),'\s+',' '),' ',',');
            c{end+1} = struct('x', fp(i).par, 'y', ev_R(1,:), 'legend', ['Real[\Lambda_{',lInd,'}^{FP',num2str(i),'}]'],'param',[]);
            c{end}.param = {'LineStyle', '--', 'LineWidth', 2, 'Color', colors(k,:)};
        else
            for j = 1:nEV
                c{end+1} = struct('x', fp(i).par, 'y', ev_R(j,:), 'legend', ['Real[\Lambda_{',num2str(j),'}^{FP',num2str(i),'}]'],'param',[]);
                c{end}.param = {'LineStyle', '--', 'LineWidth', 2, 'Color', colors(k,:)};
            end
        end
        if all(abs(diff(ev_I)) < 1e-8) % the real parts of both EV are equal
            lInd = strrep(regexprep(num2str(1:nEV),'\s+',' '),' ',',');
            c{end+1} = struct('x', fp(i).par, 'y', ev_I(1,:), 'legend', ['Imag[\Lambda_{',lInd,'}^{FP',num2str(i),'}]'],'param',[]);
            c{end}.param = {'LineStyle', ':', 'LineWidth', 2, 'Color', colors(k,:)};
        else
            for j = 1:nEV
                c{end+1} = struct('x', fp(i).par, 'y', ev_I(j,:), 'legend', ['Imag[\Lambda_{',num2str(j),'}^{FP',num2str(i),'}]'],'param',[]);
                c{end}.param = {'LineStyle', ':', 'LineWidth', 2, 'Color', colors(k,:)};
            end
        end
        if all(abs(diff(ev_A)) < 1e-8) % the real parts of both EV are equal
            lInd = strrep(regexprep(num2str(1:nEV),'\s+',' '),' ',',');
            c{end+1} = struct('x', fp(i).par, 'y', ev_A(1,:), 'legend', ['|\Lambda_{',lInd,'}^{FP',num2str(i),'}|'],'param',[]);
            c{end}.param = {'LineStyle', '-', 'LineWidth', 3, 'Color', colors(k,:)};
        else
            for j = 1:nEV
                c{end+1} = struct('x', fp(i).par, 'y', ev_A(j,:), 'legend', ['|\Lambda_{',num2str(j),'}^{FP',num2str(i),'}|'],'param',[]);
                c{end}.param = {'LineStyle', '-', 'LineWidth', 3, 'Color', colors(k,:)};
            end
        end
    end
    cc = repmat(struct('x',[],'y',[],'legend',[],'param',[]),numel(c),1);
    for i = 1:numel(c)
        cc(i) = c{i};
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