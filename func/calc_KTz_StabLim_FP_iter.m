function [p1St,p2St] = calc_KTz_StabLim_FP_iter(par,p1Name,p1Values,p2Name,p2Values,ktIterName,n_IC,tTrans,tTotal,t_sample,xTol)
    % given a field H and an array of K_values and T_values
    % we calculate the stability limits
    %
    %
    if (nargin < 7) || isempty(n_IC)
        n_IC = 5;
    end
    if (nargin < 8) || isempty(tTrans)
        tTrans = 40000;
    end
    if (nargin < 9) || isempty(tTotal)
        tTotal = 50000;
    end
    if (nargin < 10) || isempty(t_sample)
        t_sample = 50;
    end
    if (nargin < 11) || isempty(xTol)
        xTol = 1e-6;
    end
    x0          = linspace(-0.99,0.99,n_IC);
    %[p1St,p2St] = meshgrid(p1Values,p2Values);
    r           = zeros(numel(p2Values),numel(p1Values));
    k           = 0;
    for i = 1:numel(p1Values)
        p1      = p1Values(i);
        for j = 1:numel(p2Values)
            k = k + 1;
            p2      = p2Values(j);
            par     = update_fields_multidim_calc(par,{p1Name,p2Name},{p1,p2});
            r(k)    = double(isFP_many_IC(x0,par,tTrans,tTotal,t_sample,xTol,ktIterName));
        end
    end
    % for each row of r
    p1St = cell(size(p1Values));
    p2St = NaN(size(p1Values));
    for i = 1:numel(p2Values)
        [k1,k2]       = find_boundaries(r(i,:));
        if isempty(k1) && isempty(k2)
            continue;
        end
        boundaries = sort([k1,k2]);
        p1St{i} = cellfun(@(b)mean(b),get_elem_and_previous(p1Values,boundaries,true));
        p2St(i) = p2Values(i);
    end
    ind  = ~isnan(p2St);
    p1St = p1St(ind);
    p2St = p2St(ind);
end

function s = select_elem(x,k)
    if isscalar(k)
        s = x(k);
    else
        s = arrayfun(@(m)select_elem(x,m),k,'UniformOutput',false);
    end
end

function r = get_elem_and_previous(x,k,ensure_cell)
    if isscalar(k)
        i = k-1;
        if k <= 1
            i = k;
        end
        r = [x(i),x(k)];
        if ensure_cell
            r = {r};
        end
    else
        r = arrayfun(@(m)get_elem_and_previous(x,m,false),k,'UniformOutput',false);
    end
end

function [k_start,k_end] = find_boundaries(r)
    f       = (r(1:(end-1))-0.5).*(r(2:end)-0.5);
    k_start = find( (f <= 0) & (r(1:(end-1))<=0.5)  ) + 1; % index of the start of an avalanche
    k_end   = find( (f <= 0) & (r(2:end)    <=0.5)  ) + 1; % index of the end of an avalanche
end

function r = isFP_many_IC(x0,par,tTrans,tTotal,t_sample,xTol,ktIterName)
    r = true;
    for i = 1:numel(x0)
        %xx0 = [ x0(i), x0(i) ];
        xx0 = get_IC(x0,ktIterName);
        x   = KTAtrator_mex(getKTzParamStruct_for_KTAtrator(par),xx0,tTrans,tTotal,ktIterName,'',false,false);
        r   = r && isFP(x(:,1),t_sample,xTol);
    end
end

function r = isFP(x,t_sample,xTol)
    ind = (numel(x) - t_sample):numel(x);
    r   = mean(abs(diff([reshape(x(ind(1:(end-1))),1,[]);reshape(x(ind(2:end)),1,[])],1,1))) < xTol;
end

function x0 = get_IC(x0,ktIterName)
    if contains(ktIterName,'z')
        x0 = [x0,x0,x0];
    else
        x0 = [x0,x0];
    end
end