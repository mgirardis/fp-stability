function r = isiDistribution(isi)
    r = struct('P',[],'isi',[]);
    if nargin == 0
        return;
    end
    mm = floor(minmax(isi(:)'));
    mm(2) = mm(2) + 1;
    [r.P,r.isi] = histcounts(isi,mm(1):mm(2),'Normalization','probability');
    r.isi(end) = [];
end