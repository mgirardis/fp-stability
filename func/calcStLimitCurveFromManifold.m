function [leftCurveArray,rightCurveArray] = calcStLimitCurveFromManifold(xRange,yRange,z,new_curve_tolerance,scan_direction)
% z      -> matrix, stable FP manifold defined over the domain (xRange,yRange)
% xRange -> vector, x domain for z
% yRange -> vector, y domain for z
%
% z is equal to NaN where the FP is not stable (either saddle or unstable)
% this function finds the boundary between stable and not stable FP in z
% from left to right, and top to bottom on the domain (x,y)
    if (nargin < 4) || isempty(new_curve_tolerance)
        % new_curve_tolerance(1) = tolerance for horizontal (x) axis
        % new_curve_tolerance(2) = tolerance for vertical (y) axis
        new_curve_tolerance = [1,1]; % if a point col idx is new_curve_tolerance away from any of the curves, add another curve
    end
    if (nargin < 5) || isempty(scan_direction)
        scan_direction = 'vert'; % 'vert' or 'horiz' % scans figure horizontally or vertically
    end
    assert(any(strcmpi(scan_direction,{'vert','horiz'})),'scan_direction must be either ''horiz'' or ''vert''');
    if strcmpi(scan_direction,'horiz')
        z = z';
    end
    if isscalar(new_curve_tolerance)
        new_curve_tolerance = [new_curve_tolerance,new_curve_tolerance];
    else
        new_curve_tolerance = new_curve_tolerance(1:2);
    end
    
    nan2ones = @(z_line) 1-2.*double(isnan(z_line));
    leftBoundary = @(z_line) (nan2ones(z_line(1:(end-1))).*nan2ones(z_line(2:end))<0) & isnan(z_line(1:(end-1)));
    rightBoundary = @(z_line) (nan2ones(z_line(1:(end-1))).*nan2ones(z_line(2:end))<0) & isnan(z_line(2:end));
    m = size(z,1);
    leftCurveArray = curve([],[]);
    rightCurveArray = curve([],[]);
    lc_col_idx = NaN; % last col index added to each curve in leftCurveArray
    rc_col_idx = NaN; % last col index added to each curve in rightCurveArray
    lc_row_idx = NaN; % last row index added to each curve in leftCurveArray
    rc_row_idx = NaN; % last row index added to each curve in rightCurveArray
    for i = 1:m % for each line in z
        kl = find(leftBoundary(z(i,:))); % finds all the indices for left boundaries
        kr = find(rightBoundary(z(i,:))); % finds all the indices for right boundaries
        
        % updating curve indices
        if ~isempty(kl)
            [leftCurveArray,lc_row_idx,lc_col_idx] = add_points_to_curve(leftCurveArray,kl,lc_row_idx,lc_col_idx,new_curve_tolerance,kr,xRange,yRange(i),i);
        end
        
        if ~isempty(kr)
            [rightCurveArray,rc_row_idx,rc_col_idx] = add_points_to_curve(rightCurveArray,kr,rc_row_idx,rc_col_idx,new_curve_tolerance,kl,xRange,yRange(i),i);
        end
    end
    leftCurveArray(1)=[];
    rightCurveArray(1)=[];
    
    if strcmpi(scan_direction,'horiz')
        leftCurveArray = invertCurves(leftCurveArray);
        rightCurveArray = invertCurves(rightCurveArray);
    end
end

function c = invertCurves(c)
    for i = 1:numel(c)
        xx = c(i).x;
        c(i).x = c(i).y;
        c(i).y = xx;
    end
end

function [curveArr,row_idx,col_idx] = add_points_to_curve(curveArr,kmain,row_idx,col_idx,new_curve_tolerance,kcompl,xRange,y,i)
    for k = kmain
        n = getClosestCurve(i,k,row_idx,col_idx,new_curve_tolerance,kcompl);
        if n > numel(curveArr)
            curveArr = expandVector(curveArr,1,curve([],[]));
            col_idx(end+1) = NaN;
            row_idx(end+1) = NaN;
        end
        curveArr(n) = add_point(curveArr(n),(xRange(k)+xRange(k+1))/2,y);
        col_idx(n) = k;
        row_idx(n) = i;
    end
end

function n = getClosestCurve(i,k,row_idx,col_idx,new_curve_tolerance,complBoundIdx)
    n = find((abs(k - col_idx)<=new_curve_tolerance(1)) & (abs(i - row_idx)<=new_curve_tolerance(2)),1);
    if isempty(n)
        n = numel(col_idx)+1;
    end
%     [delta_idx,n] = min(abs(k - col_idx));
%     mm = minmax([k,col_idx(n)]);
%     if (delta_idx > new_curve_tolerance) && any(  (complBoundIdx > mm(1)) & (complBoundIdx < mm(2)) )
%         % we only start a new curve if there is one complementary curve in between k and col_idx(n) that minimizes the distance between k and col_idx
%         n = numel(col_idx)+1;
%         return
%     end
%     if abs(row_idx(n)-i) > new_curve_tolerance
%         % we add a new curve if the curves are separated along the vertical direction as well
%         n = numel(col_idx)+1;
%     end
end

function v = expandVector(v,n,el) 
% add n times the el to the end of v
    v((numel(v)+1):(numel(v) + n)) = repmat(el,n,1);
end

function c = add_point(c,x,y)
    c.x(end+1) = x;
    c.y(end+1) = y;
end

function s = curve(x,y)
    s = struct('x',x,'y',y);
end