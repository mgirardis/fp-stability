function c = brewerCMap(N,colorScheme,randColors)
    if (nargin < 2) || isempty(colorScheme)
        colorScheme = 1;
    end
    if (nargin < 3) || isempty(randColors)
        randColors = false;
    end
    if colorScheme == 1
        T = hex2rgb({'#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69','#fccde5','#d9d9d9','#bc80bd','#ccebc5','#ffed6f'});
    elseif colorScheme == 2
        T = hex2rgb({'#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928'});
    elseif colorScheme == 3
        T = hex2rgb({'#67001f','#b2182b','#d6604d','#f4a582','#fddbc7','#f7f7f7','#d1e5f0','#92c5de','#4393c3','#2166ac','#053061'});
    elseif colorScheme == 4
        T = hex2rgb({'#84b9ff','#e0d572','#f76a6a'});
    else%if colorScheme == 5
        T = hex2rgb({'#84b9ff','#f76a6a','#e0d572'});
    end
    nBase = size(T,1);
    if N <= nBase
        c = T(1:N,:);
        return;
    end
    x = round(linspace(0,N,nBase));
    c = interp1(x./N,T,linspace(0,1,N));
    if randColors
        c = c(randperm(N),:);
    end
end
