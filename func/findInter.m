function [xI,yI,ind] = findInter(x,y1,y2,useSpline)
% interpolate y1-y2 using a cubic spline and returns the x,y in which y1 intersects y2
    if (nargin < 4) || isempty(useSpline)
        useSpline = true;
    end
    if isa(y1,'function_handle')
        [xI,yI,ind] = findInter_func(x,y1,y2);
    else
        [xI,yI,ind] = findInter_data(x,y1,y2,useSpline);
    end
end

function [xI,yI,ind] = findInter_func(x,y1,y2)
    [x0,~,ind] = findInter_data(x,y1(x),y2(x),false);
    xI = [];
    yI = [];
    for i = 1:numel(x0)
        xI(i) = fzero(@(x)y1(x)-y2(x),x0(i),optimset('Display','off'));
        yI(i) = y1(xI(i));
    end
end

function [xI,yI,ind] = findInter_data(x,y1,y2,useSpline)
    xI = [];
    yI = [];
    returnInd = nargout >= 3;
    if returnInd
        ind = [];
    end
    if useSpline
        pp = spline(x,y2-y1);
        ff=@(r)ppval(pp,r);
    end
%     fzero, fminsearch
    n = numel(x);
    k = 0;
    if (y2(1) - y1(1)) == 0
        k = k + 1;
        xI(k) = x(1);
        yI(k) = y1(1);
        if returnInd
            ind(k) = 1;
        end
    end
    for i = 2:n
        if (y2(i) - y1(i)) == 0
            k = k + 1;
            xI(k) = x(i);
            yI(k) = y1(i);
            if returnInd
                ind(k) = i;
            end
        elseif (y2(i)-y1(i))*(y2(i-1)-y1(i-1)) < 0
            k = k + 1;
            if useSpline
                xx = (x(i-1)+x(i))/2;
%                 if isfinite(ff(xx))
                    xI(k) = fzero(ff,xx);
                    yI(k) = ppval(pp,xx);
%                 else
%                     xI(k) = xx;
%                     yI(k) = (y1(i-1)+y1(i)+y2(i-1)+y2(i))/4;
%                 end
            else
                xI(k) = (x(i-1)+x(i))/2;
                yI(k) = (y1(i-1)+y1(i)+y2(i-1)+y2(i))/4;
            end
            if returnInd
                ind(k) = i;
            end
        end
    end
end