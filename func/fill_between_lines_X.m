function ph = fill_between_lines_X(ax,X1,X2,Y,faceC,varargin)
% fills between curves X1(Y) and X2(Y)
%
    if any(isnan(X1)) || any(isnan(X2))
        ind = isnan(X1) | isnan(X2);
        Y  =  Y(~ind);
        X1 = X1(~ind);
        X2 = X2(~ind);
    end
    patch_args = get_cell_set_default(varargin,'EdgeColor','none','HandleVisibility', 'off');
    ph = patch(ax,[X1(:)' fliplr(X2(:)')], [Y(:)' fliplr(Y(:)')],  faceC, patch_args{:});
    %if numel(varargin)>0
    %    set(ph,varargin{:});
    %end
end