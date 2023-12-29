function [x,y] = remove_nan(x,y)
    ind = (~isnan(x)) & (~isnan(y));
    x   = x(ind);
    y   = y(ind);
end