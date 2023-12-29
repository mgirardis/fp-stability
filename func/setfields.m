function S = setfields(S,varargin)
    n = numel(varargin)/2;
    for i = 1:2:n
        S.(varargin{i}) = varargin{i+1};
    end
end