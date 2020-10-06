function [W,h] = joinFlipCurves(W1,hF1,W2,hF2)
    nn = @(hh) ~isinf(hh) & ~isnan(hh);
    k = nn(hF1);
    WF1 = W1(k);
    hF1 = hF1(k);
    k = nn(hF2);
    WF2 = W2(k);
    hF2 = hF2(k);
    W=[fliplr(WF2),WF1];
    h=[fliplr(hF2),hF1];
end