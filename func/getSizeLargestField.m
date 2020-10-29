function sz = getSizeLargestField(p)
    f = fieldnames(p);
    [~,k] = max(structfun(@(x)max(size(x)),p));
    sz = size(p.(f{k}));
end