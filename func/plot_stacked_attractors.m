function [ lh, sh, slh, tx, lh_scale, tx_scale, stx ] = plot_stacked_attractors(ax, x, t_ind_of_x, t_ind_shift, t_scale, line_colors, symb_colors, pSymb, panel_txt, plot_line_args, plot_symb_args, plot_txt_args, scale_line_args, scale_txt_args, show_slope, slope_line_args, slope_txt, slope_txt_args, t_scale_txt_suffix)

    if isempty(ax)
        figure;
        ax=axes;
    end
    if (nargin < 3) || isempty(t_ind_of_x)
        t_ind_of_x = [];
    end
    if (nargin < 4) || isempty(t_ind_shift)
        t_ind_shift = 0;
    end
    if (nargin < 5) || isempty(t_scale)
        t_scale = 500;
    end
    if (nargin < 6) || isempty(line_colors)
        line_colors = cmap_tab10(numel(x));
    end
    if (nargin < 7) || isempty(symb_colors)
        symb_colors = 0.8.*ones(numel(x),3);
    end
    if (nargin < 8) || isempty(pSymb)
        pSymb = '';
    end
    if (nargin < 9) || isempty(panel_txt)
        panel_txt = repmat({''},numel(x),1);
    end
    if (nargin < 10) || isempty(plot_line_args)
        plot_line_args = {};
    end
    if (nargin < 11) || isempty(plot_symb_args)
        plot_symb_args = {};
    end
    if (nargin < 12) || isempty(plot_txt_args)
        plot_txt_args = {};
    end
    if (nargin < 13) || isempty(scale_line_args)
        scale_line_args = {};
    end
    if (nargin < 14) || isempty(scale_txt_args)
        scale_txt_args = {};
    end
    if (nargin < 15) || isempty(show_slope)
        show_slope = false;
    end
    if (nargin < 16) || isempty(slope_line_args)
        slope_line_args = {};
    end
    if (nargin < 17) || isempty(slope_txt_args)
        slope_txt = '';
    end
    if (nargin < 18) || isempty(slope_txt_args)
        slope_txt_args = {};
    end
    if (nargin < 19) || isempty(t_scale_txt_suffix)
        t_scale_txt_suffix = '';
    end

    plot_line_args  = get_cell_set_default(plot_line_args ,'LineWidth',1);
    slope_line_args = get_cell_set_default(slope_line_args,'LineWidth',1);
    plot_symb_args  = get_cell_set_default(plot_symb_args ,'LineWidth',1,'MarkerSize',3,'MarkerFaceColor','w');
    plot_txt_args   = get_cell_set_default(plot_txt_args  ,'Interpreter','latex');
    scale_line_args = get_cell_set_default(scale_line_args,'Color','k','LineWidth',3,'LineStyle','-');
    scale_txt_args  = get_cell_set_default(scale_txt_args ,'VerticalAlignment','bottom','HorizontalAlignment','left' ,'Color','k');
    slope_txt_args  = get_cell_set_default(slope_txt_args ,'VerticalAlignment','middle','HorizontalAlignment','right');
    
    if size(line_colors,1)<numel(x)
        line_colors = repmat(line_colors,ceil(numel(x)/size(line_colors,1)),1);
    end
    
    if size(symb_colors,1)<numel(x)
        symb_colors = repmat(symb_colors,ceil(numel(x)/size(symb_colors,1)),1);
    end
    
    %panelLetter = 'a':'z';
    %panelTxt = {{'CS','$x_R=%.2g$'},{'CS','$x_R=%.3g$'},{'Chaos','$x_R=%.3g...$'},{'ACS','$x_R=%.2g$'}};

    nSim = numel(x);
    
    use_same_scale = ~iscell(t_ind_of_x);
    if use_same_scale && any(isnan(t_ind_of_x))
        use_same_scale = true;
        t_ind_of_x     = [];
    end
    
    if isempty(t_ind_of_x)
        t_ind_of_x = 1:min(cellfun(@(xx)size(xx,1),x));
    end
    
    if isscalar(t_ind_shift)
        t_ind_shift = t_ind_shift.*ones(size(x));
    end
    
    %linearTransf
    
    if use_same_scale
        t_ind_of_x = repmat({t_ind_of_x},size(x));
    end
    
    lh       = gobjects(1,nSim);
    slh      = gobjects(1,nSim);
    sh       = gobjects(1,nSim);
    tx       = gobjects(1,nSim);
    stx      = gobjects(1,nSim);
    
    if use_same_scale
        lh_scale = gobjects;
    else
        lh_scale = gobjects(1,nSim);
    end
    
    hold(ax,'on');
    for i = 1:nSim
        t_ind  = t_ind_of_x{i};
        if isempty(t_ind)
            t_ind = 1:size(x{i},1);
        end
        if use_same_scale
            t_plot = 1:numel(t_ind);
        else
            [t_plot,t_transf] = linearTransf(t_ind,[],[0,1],true);
        end
        dx = (nSim-1)-(i-1);
        pl_args   = get_cell_set_default(plot_line_args ,'Color',line_colors(i,:));
        sl_args   = get_cell_set_default(slope_line_args,'Color',line_colors(i,:));
        sh_args   = get_cell_set_default(plot_symb_args ,'Color',symb_colors(i,:));
        tx_args   = get_cell_set_default(plot_txt_args  ,'Color',symb_colors(i,:));
        sltx_args = get_cell_set_default(slope_txt_args ,'Color',symb_colors(i,:));
        xx0 = 0.0;
        if show_slope
            sl_x = log(abs(diff(x{i}(t_ind+t_ind_shift(i),1))));
            %slh(i) = plot(ax,2:numel(t_ind),linearTransf(sl_x,[],[0,0.3])+dx,'-',sl_args{:});
            slh(i) = plot(ax,t_plot(2:end),linearTransf(sl_x,[],[0,0.3])+dx,'-',sl_args{:});
            xx0 = 0.3;
        end
        xx = linearTransf(x{i}(t_ind+t_ind_shift(i),1),[],[xx0,0.9])+dx;
        %lh(i) = plot(ax,1:numel(t_ind),xx    ,     '-',pl_args{:});
        lh(i) = plot(ax,t_plot,xx    ,     '-',pl_args{:});
        if ~isempty(pSymb)
            %sh(i) = plot(ax,1:numel(t_ind),xx,pSymb(i),sh_args{:});
            sh(i) = plot(ax,t_plot,xx,pSymb(i),sh_args{:});
        end
        %txt = panelTxt{i};
        %txt{1} = ['(',panelLetter(i),') ',txt{1}];
        %txt{2} = sprintf(txt{2},xR(i));
        %tx(i) = text(ax,get_frac(0.0,[1,numel(t_ind)]),dx+0.5+xx0,panel_txt{i},tx_args{:});
        if ~isempty(panel_txt{i})
            tx(i) = text(ax,0,dx+0.5+xx0,panel_txt{i},tx_args{:});
        end
        if show_slope && ~isempty(slope_txt)
            %stx(i) = text(ax,get_frac(0.0,[1,numel(t_ind)]),dx+0.5-xx0.*1.2,slope_txt,sltx_args{:});
            stx(i) = text(ax,0,dx+0.5-xx0.*1.2,slope_txt,sltx_args{:});
        end
        
        if ~use_same_scale
            t_scale_plot = t_transf.f([numel(t_ind)-t_scale,numel(t_ind)],t_transf);
            lh_scale = line(ax,t_scale_plot,dx.*ones(1,2),scale_line_args{:});
        end
    end
    yLimits = ax.YLim;
    t_ind   = t_ind_of_x{end};
    if use_same_scale
        t_scale_txt = [ sprintf('%g ts',t_scale), t_scale_txt_suffix ];
        lh_scale = line(ax,[numel(t_ind)-t_scale,numel(t_ind)],get_frac(-0.1,yLimits).*ones(1,2),scale_line_args{:});
        tx_scale = text(ax,numel(t_ind)-t_scale,get_frac(-0.1,yLimits),t_scale_txt,scale_txt_args{:});
    else
        t_scale_txt = [ sprintf('%g ts',t_scale), t_scale_txt_suffix ];
        tx_scale = text(ax,t_transf.f(numel(t_ind)-t_scale,t_transf),get_frac(-0.05,yLimits),t_scale_txt,scale_txt_args{:});
    end
    axis(ax,'tight');
    axis(ax,'off');

end


function x = get_frac(frac,range)
    x = min(range) + frac.*diff(minmax(range(:)'));
end