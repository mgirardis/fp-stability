function saveFigure(fh, figNames, figFormat, closeFig, figArgs, printFigResolution)
    if (nargin < 4) || isempty(closeFig)
        closeFig = true;
    end
    if (nargin < 5) || isempty(figArgs)
        figArgs = {};
    end
    if (nargin < 6) || isempty(printFigResolution)
        printFigResolution = false;
    end
    warning('off','MATLAB:print:FigureTooLargeForPage');
    n = numel(fh);
    if (n > 1)
        if ~iscell(figNames) || (numel(figNames) < n)
            error('saveFigures:figNames','you must provide one name for each figure');
        end
    end
    if n == 1
        if ~iscell(figNames)
            figNames = { figNames };
        end
    end
    if strcmpi(figFormat,'tiff') || strcmpi(figFormat,'tif')
        if ~printFigResolution
            printFigResolution = 600;
        end
    end
    for i = 1:n
        [~,~,ext] = fileparts(figNames{i});
        if ~strcmpi(ext, figFormat)
            figNames{i} = [ figNames{i}, '.', figFormat ];
        end
        fh(i).Color = 'w';
        fh(i).PaperPositionMode = 'auto';
        fig_pos = fh(i).PaperPosition;
        fh(i).PaperSize = [fig_pos(3) fig_pos(4)];
        if ~isempty(figArgs)
            set(fh(i),figArgs{:});
            drawnow
        end
        if printFigResolution
            if ~isnumeric(printFigResolution)
                printFigResolution = 300;
            end
            print(fh(i), figNames{i}, ['-d',figFormat], '-cmyk', '-noui', ['-r',num2str(printFigResolution)]);
        else
            saveas(fh(i), figNames{i}, figFormat);
        end
%         if strcmpi(figFormat,'pdf')
%             print(fh(i),figNames{i},'-dpdf','-bestfit')
%         else
%             saveas(fh(i), figNames{i}, figFormat);
%         end
        if closeFig
            close(fh(i));
        end
    end
    warning('on','MATLAB:print:FigureTooLargeForPage');
end