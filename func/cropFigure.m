function fh1 = cropFigure(fh,padd,deleteOriginal)
% crops the extra borders of figure fh, leaving the figure boundary very tight with respect to the inner axes
%
% fh -> figure handler
% padd -> 1x1 or 1x2 vector with padding pixels in the form [horizontal, vertical]; if 1x1 padd then its the same for horizontal and vertical
% deleteOriginal -> if true, deletes fh
%
% returns: fh1 -> a figure handler to a copy of fh (fh may be deleted)
    if (nargin < 1) || isempty(fh)
        fh = gcf;
    end
    if (nargin < 2) || isempty(padd)
        padd = [0,0];
    end
    if (nargin < 3) || isempty(deleteOriginal)
        deleteOriginal = true;
    end
    if numel(padd) == 1
        padd = [padd,padd];
    elseif numel(padd)>2
        padd = reshape(padd(1:2),1,[]);
    end
    fh1 = gobjects(size(fh));
    for i = 1:numel(fh)
        fh1(i) = cropFigure_internal(fh(i),padd,deleteOriginal);
    end
end

function fh1 = cropFigure_internal(fh,padd,deleteOriginal)
    changeUnits = false;
    oldUnit = '';
    if ~strcmpi(fh.Units,'pixels')
        oldUnit = fh.Units;
        fh.Units = 'pixels';
        changeUnits = true;
        drawnow
    end
    c = getAllGoodChildren(fh);
%     c = fh.Children;
    nC = numel(c);

    % calculate size of the new figure
    p0 = getCumulativeChildrenSize(c);
    wh = fh.Position(3:4);
    p0 = p0 .* repmat(wh,1,2) + [0,0,padd]; % p0 in pixels
    
    % calculate new position of the children objects inside p0
    p = zeros(nC,4);
    for i = 1:nC
        p(i,:) = [ (c(i).Position(1:2).*wh+padd./2 - p0(1:2)) , c(i).Position(3:4).*wh ]./repmat(p0(3:4),1,2);
    end

    fh1 = copyfig(fh);

    % resize new figure
    fh1.Position(3:4) = p0(3:4);
    
    c1 = getAllGoodChildren(fh1);

    % reposition objects
    for i = 1:numel(c1)
        c1(i).Position = p(i,:);
        drawnow
    end

    if deleteOriginal
        delete(fh);
    end
    if changeUnits
        fh1.Units = oldUnit;
    end
end

function p0 = getCumulativeChildrenSize(c)
    p = NaN(numel(c),4);
    for i = 1:numel(c)
        if isa(c(i),'matlab.graphics.axis.Axes') % if isGoodChild(c(i)) %
            if ~strcmpi(c(i).Units,'normalized')
                warning('cropFigure:AxisUnits','Axis units are not normalized, cropFigure may not work properly');
                c(i).Units = 'normalized';
                drawnow
            end
            pp = c(i).Position;
            m = c(i).TightInset;
%             if isProperty(c,'TightInset')
%                 m = c(i).TightInset;
%             else
%                 m = zeros(1,4);
%             end
            p(i,1) = pp(1) - sum(m([1,3]));
            p(i,2) = pp(2) - sum(m([2,4]));
            p(i,3) = pp(3) + sum(m([1,3]));
            p(i,4) = pp(4) + sum(m([2,4]));
        end
    end
    p(any(isnan(p),2),:) = [];
    p0 = [ min(p(:,1:2),[],1), (max(p(:,1:2)+p(:,3:4),[],1)-min(p(:,1:2),[],1)) ];
end

function r = isProperty(obj,p)
    r = any(strcmp(properties(obj),p));
end

function c = getAllGoodChildren(fh)
    c = getGoodChildren(fh);
    r = hasAnnPane(c);
    for i = 1:numel(r)
        cc = getGoodChildren(c(r(i)));
        c((end+1):(end+numel(cc))) = cc;
    end
    r = hasAnnPane(c);
    c(r) = [];
end

function c = getGoodChildren(h)
    c = allchild(h);
    if ~isempty(c)
        c(~isGoodChild(c)) = [];
    end
end

function r = isGoodChild(c)
    if numel(c) > 1
        r = false(size(c));
        for i = 1:numel(c)
            r(i) = isGoodChild_single(c(i));
        end
    else
        r = isGoodChild_single(c);
    end
end

function r = isGoodChild_single(c)
    r = isa(c,'matlab.graphics.axis.Axes') || isa(c,'matlab.graphics.illustration.Legend') || isa(c,'matlab.graphics.shape.Line') || isa(c,'matlab.graphics.shape.internal.AnnotationPane');
end

function r = hasAnnPane(c)
    r = find(isa_many(c,'matlab.graphics.shape.internal.AnnotationPane'));
end

function r = isa_many(c,t)
    if numel(c)>1
        r = false(size(c));
        for i = 1:numel(c)
            r(i) = isa(c(i),t);
        end
    else
        r = isa(c,t);
    end
end

function fh = copyfig(fh)
%COPYFIG Create a copy of a figure, without changing the figure
%
% Examples:
%   fh_new = copyfig(fh_old)
%
% This function will create a copy of a figure, but not change the figure,
% as copyobj sometimes does, e.g. by changing legends.
%
% IN:
%    fh_old - The handle of the figure to be copied. Default: gcf.
%
% OUT:
%    fh_new - The handle of the created figure.

% Copyright (C) Oliver Woodford 2012, Yair Altman 2015

% 26/02/15: If temp dir is not writable, use the dest folder for temp
%           destination files (Javier Paredes)
% 15/04/15: Suppress warnings during copyobj (Dun Kirk comment on FEX page 2013-10-02)
% 09/09/18: Fix issue #252: Workaround for cases where copyobj() fails for any reason
%
% Copyright (c) 2014, Oliver J. Woodford, Yair M. Altman
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
% 
% * Redistributions of source code must retain the above copyright notice, this
%   list of conditions and the following disclaimer.
% 
% * Redistributions in binary form must reproduce the above copyright notice,
%   this list of conditions and the following disclaimer in the documentation
%   and/or other materials provided with the distribution.
% 
% * Neither the name of the {organization} nor the names of its
%   contributors may be used to endorse or promote products derived from
%   this software without specific prior written permission.
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
% FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
% DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
% SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
% OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
% OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

    % Set the default
    if nargin == 0
        fh = gcf;
    end
    % Is there a legend?
    useCopyobj = isempty(findall(fh, 'Type', 'axes', 'Tag', 'legend'));
    if useCopyobj
        % Safe to copy using copyobj
        oldWarn = warning('off'); %Suppress warnings during copyobj (Dun Kirk comment on FEX page 2013-10-02)
        try
            fh = copyobj(fh, 0);
        catch
            % Fix issue #252: Workaround for cases where copyobj() fails for any reason
            useCopyobj = false;  % if copyobj() croaks, use file save/load below
        end
        warning(oldWarn);
    end
    if ~useCopyobj
        % copyobj will change the figure, so save and then load it instead
        tmp_nam = [tempname '.fig'];
        try
            % Ensure that the temp dir is writable (Javier Paredes 26/2/15)
            fid = fopen(tmp_nam,'w');
            fwrite(fid,1);
            fclose(fid);
            delete(tmp_nam);  % cleanup
        catch
            % Temp dir is not writable, so use the current folder
            [dummy,fname,fext] = fileparts(tmp_nam); %#ok<ASGLU>
            fpath = pwd;
            tmp_nam = fullfile(fpath,[fname fext]);
        end
        hgsave(fh, tmp_nam);
        fh = hgload(tmp_nam);
        delete(tmp_nam);
    end
end
