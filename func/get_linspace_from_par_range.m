function r = get_linspace_from_par_range(par_range)
    if isValidCellRange(par_range)
        r = par_range{2};
    else
        r = linspace(par_range{3}(1),par_range{3}(2),par_range{2});
    end
end

function r = isValidCellRange(c)
% true if c is a cell of 2 elements, where the first is char and the second a numeric vector
    r = iscell(c) && (numel(c) == 2) && ischar(c{1})...
        && isvector(c{2}) && isnumeric(c{2});
end