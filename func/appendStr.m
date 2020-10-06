function c = appendStr(c,Suffix,Prefix)
    if nargin == 1
        return;
    end
    if (nargin < 3) || isempty(Prefix)
        Prefix = '';
    end
    if ~iscell(Suffix)
        Suffix = char(Suffix);
    end
    if iscell(c)
        if iscell(Suffix)
            if numel(Suffix) ~= numel(c)
                error('number of elements of suffix must equal number of elements of c');
            end
        else
            Suffix = cellfun(@(x)Suffix,cell(size(c)),'UniformOutput',false);
        end
        if iscell(Prefix)
            if numel(Prefix) ~= numel(c)
                error('number of elements of Prefix must equal number of elements of c');
            end
        else
            Prefix = cellfun(@(x)Prefix,cell(size(c)),'UniformOutput',false);
        end
        for i = 1:numel(c)
            c{i} = appendStr_internal(Prefix{i},char(c{i}),Suffix{i});
        end
    else
        c = appendStr_internal(Prefix,char(c),Suffix);
    end
end

function c = appendStr_internal(Prefix,c,Suffix)
    c = [Prefix(:)',c(:)',Suffix(:)'];
end
