function isi = findISI(x, xThresh)
    t1 = 0;
    t2 = 0;
    ts = 0;
    tsA = 0;
    crossCounter = 0;
    n = length(x) - 1;
    i = 1;
    while (x(i) > xThresh) % garantindo que o loop principal começara com x(i)<xThresh
        i = i + 1;
    end
    k = 0;
    isiTemp = zeros(1,size(x,1));
    nISI = 0;
    while (i <= n) % loop principal
        iplus = i + 1;
        if ((x(i)-xThresh) * (x(iplus)-xThresh) < 0) % cruzou o eixo x = xThresh
            if (mod(crossCounter,2) == 0) % como começou abaixo de x = 0, crossCounter par significa subindo
                t1 = (i + iplus) / 2.0;
            else % crossCounter impar significa descendo
                t2 = (i + iplus) / 2.0;
                ts = (t1 + t2) / 2.0;
                k = k + 1;
                isiTemp(k) = ts - tsA;
                tsA = ts;
                nISI = nISI + 1;
            end
            crossCounter = crossCounter + 1;
        end
        i = i + 1;
    end
    isi = isiTemp(2:nISI);
end