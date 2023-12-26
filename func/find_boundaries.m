function [k_start,k_end] = find_boundaries(r)
    f = (r(1:(end-1))-0.5).*(r(2:end)-0.5);
    k_start = find( (f <= 0) & (r(1:(end-1))<=0.5)  ) + 1; % index of the start of an avalanche
    k_end   = find( (f <= 0) & (r(2:end)    <=0.5)  ) + 1; % index of the end of an avalanche
    if isempty(k_start) || isempty(k_end)
        warning('no avalanches found with given threshold');
        return;
    end
    %if k_end(1) <= k_start(1)
    %    k_end = k_end(2:end);
    %end
    %if k_start(end) > k_end(end)
    %    k_start = k_start(1:(end-1));
    %end
end
