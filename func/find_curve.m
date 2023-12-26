function [x,y] = find_curve(X,Y,x0y0,x1y1,search_radius,search_range,dim,eqTol,search_radius_npoints,search_radius_mult)
    % given an IC [x0,y0], and a radius around any point,
    % we first add the nearest point within epsilon, and then
    % follow the gradient adding points within epsilon distance of the curve
    % X,Y           -> data points; either both are vectors (same numel); or vector,matrix, or matrix, matrix; in these cases: size(X,dim) == size(Y,dim)
    % x0y0          -> initial point [x0,y0]; both x0,y0 must be in X and Y data, respectively
    % x1y1          -> second initial point [x1,y1]; also must be part of X,Y data; used to calculate initial search direction
    %                  search_dir = x1y1 - x0y0; the gradient vector
    % search_radius -> distance within to search for the next point
    % search_range  -> (in degrees) circular sector around search_dir to search for the next point in the curve
    % dim           -> dimension in matrices X,Y along which the curve is defined
    %                   e.g. if dim==1 (rows), then X(:,i), Y(:,i) is a curve
    % eqTol         -> equality tolerance: a pair (x1,y1) is considered equal to (x2,y2) if abs(x1-x2)<eqTol and abs(y1-y2)<eqTol
    % search_radius_npoints,search_radius_mult -> if search_radius is empty, use these parameters to try and determine the search radius from the data
    if (nargin < 5) || isempty(search_radius)
        search_radius = [];
    end
    if (nargin < 6) || isempty(search_range)
        search_range = 180; % range around s_dir (in degrees)
    end
    if (nargin < 7) || isempty(dim)
        dim = 1;
    end
    if (nargin < 8) || isempty(eqTol)
        eqTol = 1e-6;
    end
    if (nargin < 9) || isempty(search_radius_npoints)
        search_radius_npoints = 20;
    end
    if (nargin < 10) || isempty(search_radius_mult)
        search_radius_mult = 10;
    end
    search_range = (search_range.*pi/180)/2; % half to each side of s_dir
    assert(any(dim==[1,2]),'dim must be 1 for curves defined along rows; or 2 for curves defined along cols');
    if isvector(X) && isvector(Y)
        assert(numel(X)==numel(Y),'the numel of X,Y arrays must match');
    end
    if ~isvector(X) || ~isvector(Y)
        assert(size(X,dim)==size(Y,dim),'the size of X,Y arrays must match along dim');
    end
    
    % organizing data
    dim2    = 3 - dim; % dim along which lie separate curves (dim==1, then dim2==2; if dim==2, then dim2==1)
    [X,Y]   = collapse_curves(X,Y,dim,dim2);
    [X,Y]   = remove_nan(X,Y);
    
    % starting variables
    N       = numel(X);
    r       = [X,Y];
    r0      = x0y0;
    rc      = NaN(N,2); % curve to be detected
    checked = false(N,1);
    
    if isempty(search_radius)
        search_radius = calc_search_radius(r,search_radius_npoints,search_radius_mult);
    end

    % getting initial point
    k       = find_point(r,r0,eqTol);
    if isempty(k)
        error('find_curve:x0y0','x0y0 not found');
    end
    
    % updating initial point
    r0         = r(k(1),:);
    k1         = find_point(r,x1y1,eqTol);
    search_dir = grad_vector(r0,r(k1(1),:)); % initially searches to the right
    checked(k) = true;
    % adding initial point
    [rc,pos]   = add_points(rc,r(k,:),0);
    %ctr = 0;
    % looking for the other points
    while ~all(checked)
        %ctr = ctr + 1;
        %disp(ctr)
        % looking for the next point
        k = find_next_point(r,r0,search_dir,search_radius,search_range,checked);
        if isempty(k)
            % nothing found, exit
            break;
        end
        % if something was found, then look for all other "equal" points
        k          = [k;find_point(r,r(k,:),eqTol)]; % finds all points equal to the next

        % adding the points to the curve
        [rc,pos]   = add_points(rc,r(k,:),pos);
        
        % the search direction must be updated for the next pass
        search_dir = grad_vector(r0,r(k(1),:)); % updating search direction
        
        % the reference point is updated for the next pass
        r0         = r(k(1),:); % updating start point
        
        % marking the added points as checked
        checked(k) = true; % updating checked points
    end
    
    % organizing output
    rc       = rc(~any(isnan(rc),2),:);
    %[x,ind]  = sort(rc(:,1));
    %y        = rc(ind,2);
    rc       = unique(rc,'rows');
    x        = rc(:,1);
    y        = rc(:,2);
end

% function r = remove_points(r,r0,eqTol)
%     k = find_point(r,r0,eqTol);
%     r(k,:)=[];
% end
% 
% function rf = find_most_distant_point(r0,r)
%     d = zeros(size(r,1),1);
%     for i = 1:numel(d)
%         d(i) = vecnorm(r(i,:)-r0,2,2);
%     end
%     [~,k] = max(d);
%     rf    = r(k,:);
% end

function srad = calc_search_radius(r,search_radius_npoints,search_radius_mult)
    [~,ind] = sort(r(:,1));
    r(:,1)  = r(ind,1);
    r(:,2)  = r(ind,2);
    k       = randperm(size(r,1)-1,search_radius_npoints);
    srad    = search_radius_mult.*mean(vecnorm(r(k+1,:) - r(k,:),2,2));
end

function [rf,k] = find_closest_point(r0,r)
    d = zeros(size(r,1),1);
    for i = 1:numel(d)
        d(i) = vecnorm(r(i,:)-r0,2,2);
    end
    [~,k] = min(d);
    rf    = r(k,:);
end

function [rc,pos] = add_points(rc,r,pos)
    rc((pos+1):(pos+size(r,1)),:) = r;
    pos                           = pos + size(r,1);
end

function res = is_in_range(r0,r1,search_dir,search_radius,search_range)
    theta = angle_vec(search_dir,r1-r0);
    d     = vecnorm(r1-r0,2,2);
    res   = (d<search_radius) && (theta<search_range);
end

function k = find_next_point(r,r0,search_dir,search_radius,search_range,checked)
    k = [];
    for i = 1:size(r,1)
        if is_in_range(r0,r(i,:),search_dir,search_radius,search_range) && ~checked(i)
            k(end+1,1) = i;
        end
    end
    [~,n] = find_closest_point(r0,r(k,:));
    k = k(n);
end

function s = grad_vector(r1,r2)
    s = r2 - r1;
    s = s./vecnorm(s,2,2);
end

function theta = angle_vec(r1,r2)
    c       = dot(r1,r2)./(vecnorm(r1).*vecnorm(r2));
    c(c> 1) =  1; % fixing for precision
    c(c<-1) = -1; % fixing for precision
    theta   = acos(c);
end

function k = find_point(r,r0,eqTol)
    if size(r0,1) > 1
        k = cell2mat(arrayfun(@(n)find_point(r,r(n,:),eqTol),1:size(r0,1),'UniformOutput',false)');
    else
        k = find(all(abs(r-r0)<eqTol,2));
    end
end

function [x,y] = collapse_curves(X,Y,dim,dim2)
    n_curves = max(size(X,dim2),size(Y,dim2));
    N        = max(numel(X),numel(Y));
    x        = zeros(N,1);
    y        = zeros(N,1);
    k1       = 0;
    for i = 1:n_curves
        [xa,ya] = get_curve(X,Y,dim,i);
        k2       = k1 + numel(xa);
        k1       = k1 + 1;
        x(k1:k2) = reshape(xa,1,[]);
        y(k1:k2) = reshape(ya,1,[]);
        k1       = k2;
    end
end

function [X,Y] = remove_nan(X,Y)
    ind = ~isnan(X) & ~isnan(Y);
    X   = X(ind);
    Y   = Y(ind);
end

function [x,y] = get_curve(X,Y,dim,k)
    x = get_points(X,dim,k);
    y = get_points(Y,dim,k);
end

function x = get_points(X,dim,k)
    if isvector(X)
        x = X;
    else
        if dim == 1
            x = X(:,k);
        else
            x = X(k,:);
        end
    end
end