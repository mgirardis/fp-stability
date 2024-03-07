function lc_mm = get_limit_cycle_minmax(x,ampTol,x_col_ind)
    if (nargin < 2) || isempty(ampTol)
        ampTol = 1e-4;
    end
    if (nargin < 3) || isempty(x_col_ind)
        x_col_ind = 1;
    end
    x_is_cell = iscell(x);
    if ~x_is_cell
        x = {x};
    end
    lc_mm         = cell2mat(cellfun(@(xx)minmax(xx(:,x_col_ind)'),x,'UniformOutput',false)');
    limCycleAmp = diff(lc_mm,[],2);
    lc_mm(limCycleAmp<ampTol,:) = NaN;
end