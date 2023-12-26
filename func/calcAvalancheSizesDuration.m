function [s,T] = calcAvalancheSizesDuration(rho,thresh,dt,subtract_thresh_from_size)
%"""
%calculates avalanche sizes and duration according to the PRE by Villegas et al 2019 PRE
%rho    -> # of active sites at each time step
%thresh -> threshold to apply to rho time series to extract avalanche sizes and duration
%dt     -> time scale (if 1 time step = 1 ms, then use dt = 1e-3)
%subtract_thresh_from_size -> if True, subtracts the threshold from the avalanche size (recommended by Villegas et al to keep correct scaling)
%
%returns
%s,T -> avalanche sizes, avalanche duration (each as numpy.ndarray)
%"""
    if (nargin < 2) || isempty(thresh)
        thresh = 0.0;
    end
    if (nargin < 3) || isempty(dt)
        dt = 1.0;
    end
    if (nargin < 4) || isempty(subtract_thresh_from_size)
        subtract_thresh_from_size = true;
    end
    assert(isscalar(isnumeric(thresh)),'rho_th must be a scalar real number');
    
    % the crossing of the threshold
    f = (rho(1:(end-1))-thresh).*(rho(2:end)-thresh);
    k_start = find( (f <= 0) & (rho(1:(end-1))<=thresh)  ) + 1; % index of the start of an avalanche
    k_end = find( (f <= 0) & (rho(2:end)<=thresh)  ) + 1; % index of the end of an avalanche
    s = [];
    T = [];
    if isempty(k_start) || isempty(k_end)
        warning('no avalanches found with given threshold');
        return;
    end
    if k_end(1) <= k_start(1)
        k_end = k_end(2:end);
    end
    if k_start(end) > k_end(end)
        k_start = k_start(1:(end-1));
    end
    if (numel(k_start) > 0) && (numel(k_end) > 0)
        if subtract_thresh_from_size
            th = thresh;
        else
            th = 0.0;
        end
        m = min(numel(k_start),numel(k_end));
        s = arrayfun(@(a,b) sum(rho(a:b)-th),k_start(1:m),k_end(1:m));
        T = (k_end(1:m) - k_start(1:m)) .* dt;
        T=T(s>=1.0);
        s=s(s>=1.0);
        return;
    end
    warning('no avalanches found with given threshold');
end