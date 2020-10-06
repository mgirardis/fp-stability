function xx = repeatElements(x,n)
% n = vector same size as x
% repeats n(i) times each element x(i) and returns it in the same order as in x
    N = sum(n); % total number of elements
    ind = zeros(1,N);
    ind(1:n(1)) = ones(1,n(1));
    s = n(1);
    for k = 2:numel(n)
        ind((s+1):(s+n(k))) = k.*ones(1,n(k));
        s = s + n(k);
    end
    xx = x(ind);
end