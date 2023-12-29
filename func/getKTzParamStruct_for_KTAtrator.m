function p = getKTzParamStruct_for_KTAtrator(par)
    p  = struct('K',0,'T',0,'d',0,'l',0,'xR',0,'H',0,'Q',0,'I',0);
    fn = fieldnames(par);
    for k = 1:numel(fn)
        l = fn{k};
        p.(l) = par.(l);
    end
end