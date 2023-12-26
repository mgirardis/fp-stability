function write_txt_for_Mathematica(fileName, varNames, varValues, header)
    if (nargin < 4) || isempty(header)
        header = '';
    end
    [~,~,ext] = fileparts(fileName);
    if isempty(ext)
        fileName = [fileName,'.txt'];
    end
    if ~iscell(varNames)
        varNames  = {varNames};
        varValues = {varValues};
    end
    if ~isempty(header)
        dlmwrite(fileName,header,'');
    end
    for i = 1:numel(varNames)
        if isempty(header)
            if i == 1
                opts = {''};
            else
                opts = {'-append','delimiter',''};
            end
        else
            opts = {'-append','delimiter',''};
        end
        dlmwrite(fileName,['#',varNames{i},'='],opts{:});
        dlmwrite(fileName,reshape(varValues{i},1,[]) ,'-append','delimiter',',');
    end
end