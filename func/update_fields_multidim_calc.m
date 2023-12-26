function par = update_fields_multidim_calc(par,parName,parVal)
% updates the fields in the datafile d struct according to the pairs of parameters and values given in the cells
% parName, parVal
% also updates the shape of Poisson input r for the purpose of calculating phase diagrams
%
    [parName,parVal] = ensure_cell(parName,parVal);
    if has_parName(parName)
        par = set_fields(par,parName,parVal);
        %k = has_one_parVal_vector(parName,parVal);
        %if (k > 0) && ( isvector(r) && (numel(r)>1) )
        %    d.(parName{k}) = repmat(parVal{k}(:),1,numel(r));
        %    r = repmat(reshape(r,1,[]),numel(parVal{k}),1);
        %end
    end
end

function [parName,parVal] = ensure_cell(parName,parVal)
    if ~iscell(parName)
        parName = {parName};
        parVal = {parVal};
    end
end

function r=has_parName(parName)
    if iscell(parName)
        r = all(cellfun( @has_parName, parName ));
    else
        r = ischar(parName) && ~isempty(parName);
    end
end

function r=has_one_parVal_vector(parName,parVal)
    if ~iscell(parName)
        parVal = {parVal};
    end
    k = find(any(cellfun( @has_one_parVal_vector_internal, parVal )));
    if numel(k)>1
        error('has_one_parVal_vector:parVal','you can only set one vector paramater');
    end
    if numel(k)==1
        r = k;
    else
        r = false;
    end
end

function r=has_one_parVal_vector_internal(parVal)
    r = isnumeric(parVal) && isvector(parVal) && (~isscalar(parVal));
end

function s = set_fields(s,fields,values)
    if ~iscell(fields)
        fields = {fields};
        values = {values};
    end
    for i = 1:numel(fields)
        f = fields{i};
        s.(f) = values{i};
    end
end