function xData = GLNetAtrator(par,x0,tTrans,tTotal,glIterN,plotStyle,plotTimeEvol)
    if nargin < 6
        plotStyle = [];
    end
    if nargin < 7 || isempty(plotTimeEvol)
        plotTimeEvol = false;
    end
    if ischar(glIterN)
        nDim = 2;
        if strcmpi(glIterN, 'GLMFNet')
            xData = GLAtrator_internal(par,x0,nDim,tTrans,tTotal,@GLMFNetIter);
        elseif strcmpi(glIterN, 'GLNetEI')
            xData = GLAtrator_internal(par,x0,nDim,tTrans,tTotal,@GLNetEIIter);
        elseif strcmpi(glIterN, 'GLNetEI_Full')
            xData = GLAtrator_internal(par,x0,nDim,tTrans,tTotal,@GLNetEI_Full_Iter);
        elseif strcmpi(glIterN, 'GLMFNet_LHG')
            xData = GLAtrator_internal(par,x0,nDim,tTrans,tTotal,@GLMFNet_LHGIter);
        elseif strcmpi(glIterN, 'GLMFNet_Fac')
            xData = GLAtrator_internal(par,x0,nDim,tTrans,tTotal,@GLMFNet_FacIter);
        else
            error('GLNetAtrator:glIterN', 'glIterN not recognized iterator');
        end
    else
        nDim = numel(x0);
        xData = GLAtrator_internal(par,x0,nDim,tTrans,tTotal,glIterN);
    end
    if (~isempty(plotStyle))
        figure;
        if plotTimeEvol
            if tTrans == 0
                tInit = 0;
            else
                tInit = tTrans;
            end
            plot(tInit:tTotal, xData(:,1), plotStyle, 'MarkerSize', 2.5);
        else 
            plot(xData(:,1), xData(:,2), plotStyle, 'MarkerSize', 2.5);
        end
    end
end

function xData = GLAtrator_internal(par,x0,nDim,tTrans,tTotal,glIter)
    x = x0(1:nDim);
    for t = 1:tTrans
        x = glIter(par, x, t);
    end
    xData = zeros(tTotal-tTrans+1,nDim);
    xData(1,:) = x;
    for t = (tTrans+1):tTotal
        x = glIter(par, x, t);
        tIndex = t-tTrans+1;
        xData(tIndex,:) = x;
    end
    if (tTrans == 0)
        tTrans = 1;
    end
    %xData = xData(tTrans:tTotal,:);
end