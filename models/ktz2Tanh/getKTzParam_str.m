function s = getKTzParam_str(p,fields_to_keep,sep,as_latex,prefix,suffix)
    if (nargin < 2) || isempty(fields_to_keep)
        fields_to_keep = fieldnames(p);
    end
    if (nargin < 3) || isempty(sep)
        sep = ',';
    end
    if (nargin < 4) || isempty(as_latex)
        as_latex = false;
    end
    if (nargin < 5) || isempty(prefix)
        prefix = '';
    end
    if (nargin < 6) || isempty(suffix)
        suffix = '';
    end
    if ~iscell(fields_to_keep)
        fields_to_keep = {fields_to_keep};
    end
    [~,ind]  = intersect(fieldnames(p),fields_to_keep,'stable');
    c        = [fieldnames(p),cellfun(@num2str,struct2cell(p),'UniformOutput',    false)];
    s        = [prefix,fix_param_names(strjoin(reshape(arrayfun(@(k)get_param_str(strjoin(c(k,:),'='),as_latex),ind,'UniformOutput',false),1,[]),sep),as_latex),suffix];
end

function s = fix_param_names(s,as_latex)
    if as_latex
        s = strrep(strrep(strrep(s,'d','\delta'),'l','\lambda'),'xR','x_R');
    end
end

function s = get_param_str(s,as_latex)
    p1 = '';
    p2 = '';
    if as_latex
        p1 = '$';
        p2 = '$';
    end
    s = [p1,s,p2];
end