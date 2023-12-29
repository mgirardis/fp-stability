function ph = fill_between_lines_Y(ax,X,Y1,Y2,faceC,varargin)
% fills between curves Y1(X) and Y2(X)
%
    %if ischar(faceC)
    %    faceC = get_color_from_char(faceC);
    %end
    %if isrow(faceC) && ((numel(faceC) == 3) || (numel(faceC) == 4))
    %    % faceC is a single color
    %    faceC  = repmat(faceC,numel(X),1);
    %    %get_fc = @(fc,ind) fc(ind,:);
    %end
    %if isscalar(faceC)
    %    faceC  = reshape(faceC.*ones(size(X)),[],1);
    %    %get_fc = @(fc,ind) fc(ind);
    %end
    %if any(isnan(Y1)) || any(isnan(Y2))
    %    ind   = isnan(Y1) | isnan(Y2);
    %    X     =     X(~ind);
    %    Y1    =    Y1(~ind);
    %    Y2    =    Y2(~ind);
    %    faceC = faceC(~ind,:);
    %    %faceC = get_fc(fc,~ind);
    %end
    %X     = [  X(:); flipud( X(:)) ];
    %Y     = [ Y1(:); flipud(Y2(:)) ];
    %faceC = [ faceC; flipud(faceC) ];
    %ph = patch(ax,X,Y,faceC,'EdgeColor','none','HandleVisibility', 'off');
    if any(isnan(Y1)) || any(isnan(Y2))
        ind   = isnan(Y1) | isnan(Y2);
        X     =     X(~ind);
        Y1    =    Y1(~ind);
        Y2    =    Y2(~ind);
    end
    X     = [  X(:); flipud( X(:)) ];
    Y     = [ Y1(:); flipud(Y2(:)) ];
    patch_args = get_cell_set_default(varargin,'EdgeColor','none','HandleVisibility', 'off');
    ph = patch(ax,X',Y',faceC,patch_args{:});
    %if numel(varargin)>0
    %    set(ph,varargin{:});
    %end
end

function v = get_color_from_char(c)
    cv_map = struct('r',[1 0 0],'g',[0 1 0],'b',[0 0 1],'c',[0 1 1],'m',[1 0 1],'y',[1 1 0],'k',[0 0 0],'w',[1 1 1]);
    v = cv_map.(c);
end