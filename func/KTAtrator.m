function xData = KTAtrator(par,x0,tTrans,tTotal,ktIterN,plotStyle,plotTimeEvol,ignore_H_KTz)
    if nargin < 6
        plotStyle = [];
    end
    if nargin < 7 || isempty(plotTimeEvol)
        plotTimeEvol = false;
    end
    if nargin < 8 || isempty(ignore_H_KTz)
        ignore_H_KTz = false;
    end
    if ignore_H_KTz
        par.H = 0.0;
    end
    if ischar(ktIterN)
        %if ~isempty(strfind(ktIterN, 'KTz'))
        %    nDim = 3;
        %else
        %    nDim = 2;
        %end
        nDim = numel(x0);
        if ~isempty(strfind(ktIterN, 'KTLog'))
            xData = KTAtratorLocal(par,x0,nDim,tTrans,tTotal,@KTLogIterLocal);
        elseif ~isempty(strfind(ktIterN, 'KTzLog'))
            xData = KTAtratorLocal(par,x0,nDim,tTrans,tTotal,@KTzLogIterLocal);
        elseif ~isempty(strfind(ktIterN, 'KTTanh'))
            xData = KTAtratorLocal(par,x0,nDim,tTrans,tTotal,@KTTanhIterLocal);
        elseif ~isempty(strfind(ktIterN, 'KTzTanh'))
            xData = KTAtratorLocal(par,x0,nDim,tTrans,tTotal,@KTzTanhIterLocal);
        elseif ~isempty(strfind(ktIterN, 'KT2Tanh'))
            xData = KTAtratorLocal(par,x0,nDim,tTrans,tTotal,@KT2TanhIterLocal);
        elseif ~isempty(strfind(ktIterN, 'KTz2Tanh'))
            xData = KTAtratorLocal(par,x0,nDim,tTrans,tTotal,@KTz2TanhIterLocal);
        else
            error('KTAtrator:ktIterN', 'ktIterN not recognized');
        end
    else
        nDim = numel(x0);
        xData = KTAtratorLocal(par,x0,nDim,tTrans,tTotal,ktIterN);
    end
    if (~isempty(plotStyle))
        figure;
        if plotTimeEvol
            plot(-1+tTrans+(1:size(xData,1)), xData(:,1), plotStyle, 'MarkerSize', 2.5);
        else 
            plot(xData(:,1), xData(:,2), plotStyle, 'MarkerSize', 2.5);
        end
    end
end

function xData = KTAtratorLocal(par,x0,nDim,tTrans,tTotal,ktIter)
    x = x0(1:nDim);
    for t = 1:tTrans
        x = ktIter(par, x, t);
    end
    xData = zeros(tTotal-tTrans+1,nDim);
    xData(1,:) = x;
    for t = (tTrans+1):tTotal
        x = ktIter(par, x, t);
        tIndex = t-tTrans+1;
        xData(tIndex,:) = x;
    end
    if (tTrans == 0)
        tTrans = 1;
    end
    %xData = xData(tTrans:tTotal,:);
end

function v = getParValAt(p,t)
    v = p(mod(t-1,numel(p))+1);
end

function x = KTLogIterLocal(par, x, t)
    arg = (x(1) - par.K.*x(2) + par.H + getParValAt(par.I,t)) ./ par.T;
    x(2) = x(1);
    x(1) = arg ./ (1.0 + abs(arg));
end

function x = KTzLogIterLocal(par, x, t)
    arg = (x(1) - par.K.*x(2) + x(3) + par.H + getParValAt(par.I,t)) ./ par.T;
    x(2) = x(1);
    x(3) = (1-par.d).*x(3) - par.l.*(x(1) - par.xR);
    x(1) = arg ./ (1.0 + abs(arg));
end

%function x = KTzLogIterLocal_ignoreH(par, x, t)
%    arg = (x(1) - par.K.*x(2) + x(3) + getParValAt(par.I,t)) ./ par.T;
%    x(2) = x(1);
%    x(3) = (1-par.d).*x(3) - par.l.*(x(1) - par.xR);
%    x(1) = arg ./ (1.0 + abs(arg));
%end

function x = KTTanhIterLocal(par, x, t)
    xAnt = x(2);
    x(2) = x(1);
    x(1) = tanh((x(1) - par.K.*xAnt + par.H + getParValAt(par.I,t)) ./ par.T);
end

function x = KTzTanhIterLocal(par, x, t)
    xAnt = x(1);
    x(1) = tanh((xAnt - par.K.*x(2) + x(3) + par.H + getParValAt(par.I,t)) ./ par.T);
    x(2) = xAnt;
    x(3) = (1-par.d).*x(3) - par.l.*(xAnt - par.xR);
end

%function x = KTzTanhIterLocal_ignoreH(par, x, t)
%    xAnt = x(1);
%    x(1) = tanh((xAnt - par.K.*x(2) + x(3) + getParValAt(par.I,t)) ./ par.T);
%    x(2) = xAnt;
%    x(3) = (1-par.d).*x(3) - par.l.*(xAnt - par.xR);
%end

function x = KT2TanhIterLocal(par, x, t)
    xAnt = x(1);
    x(1) = tanh((x(1) - par.K.*x(2) + par.Q + getParValAt(par.I,t)) ./ par.T);
    x(2) = tanh( (xAnt+par.H)./par.T );
end

function x = KTz2TanhIterLocal(par, x, t)
    xAnt = x(1);
    x(1) = tanh((x(1) - par.K.*x(2) + x(3) + par.Q + getParValAt(par.I,t)) ./ par.T);
    x(2) = tanh( (xAnt+par.H)./par.T );
    x(3) = (1-par.d).*x(3) - par.l.*(xAnt - par.xR);
end