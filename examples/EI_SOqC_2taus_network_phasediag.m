clearvars
close all

addpath ../func
addpath ../models/einet_soqc_full

% defining the critical point
rho_c = @(p1Range) zeros(size(p1Range));
W_c = @(par,pRange) zeros(size(pRange))+(par.p.*par.J-1./par.G)./par.q;
theta_c = @(par,pRange) zeros(size(pRange)) + par.I;
A_c = @(par,tauT) W_c(par,1).*(1+par.tauW./tauT); % critical value of A when tauT=tauW and uT=uW

% inline if
iif = @(cond,a,b) cond.*a+(~cond).*b;

get_elem = @(A,i,j,k) A( sub2ind(size(A),i,j,k) );

cp_precision = 5e-1; % how close to the critical point I want to be

saveOutputFigures = false;

tauW = 10000; % 1000, 2000, 10000

%% doing the calculations

% I want only the active stable state
s = -1;
r = -1;

% regime of the paper
if tauW == 1000
    tau_range = {'tauT',500,[100,2000]};
    A_range = {'A',1000,[20,40]};
    par = getSOqCMFEINetFullParamStruct(1,0.2,0.8,0.2,10,get_linspace_from_par_range(A_range),1000,get_linspace_from_par_range(tau_range),0.1);
end

% increasing tauW
if tauW == 2000
    tau_range = {'tauT',500,[100,2000]};
    A_range = {'A',1000,[20,40]};
    par = getSOqCMFEINetFullParamStruct(1,0.2,0.8,0.2,10,get_linspace_from_par_range(A_range),2000,get_linspace_from_par_range(tau_range),0.1);
end

if tauW == 10000
    tau_range = {'tauT',500,[1e2,1e4]};
    A_range = {'A',1000,[20,400]};
    par = getSOqCMFEINetFullParamStruct(1,0.2,0.8,0.2,10,get_linspace_from_par_range(A_range),1e4,get_linspace_from_par_range(tau_range),0.1);
end

% calculating the FP manifold
[fp,p1Range,p2Range,parName,Lambda] = getStableFPSurf(par,@fixedPointGLNetEISOqCFull,@eigenvalJacobGLNetEISOqCFull,{s,r},[],A_range,tau_range);
[lca,rca,ilca,irca] = calcStLimitCurveFromManifold(p1Range(1,:),p2Range(:,1)',fp.yS{1},[40,40]);
% if you check the eigenvalues at the point of bifurcation
%    their absolute values are 
%                 mean(abs(get_elem(Lambda{1},ilca.i,ilca.j,ones(size(ilca.i)))))
%    and they are complex
%                 mean(get_elem(Lambda{1},ilca.i,ilca.j,ones(size(ilca.i))))
% meaning that the stability limit line is a Neimark-Sacker bifurcation (subcritical because of the magnitude of the FP > 0)

% calculating the distance to the critical point
d_cp.rho = abs(fp.xS{1} - rho_c(p1Range));
d_cp.W = abs(fp.yS{1} - W_c(par,p1Range));
d_cp.theta =abs(fp.zS{1} - theta_c(par,p1Range));
d_cp.rho=d_cp.rho./max(d_cp.rho(:));d_cp.rho(d_cp.rho==0)=NaN;
d_cp.W=d_cp.W./max(d_cp.W(:));d_cp.W(d_cp.W==0)=NaN;
d_cp.theta=d_cp.theta./max(d_cp.theta(:));d_cp.theta(d_cp.theta==0)=NaN;

%%

fp_to_plot = 'zS';


fh = figure('Renderer','opengl');
ax1 = axes;
ih = plotManifoldXY(ax1,p1Range,p2Range,fp.(fp_to_plot){1},'imagesc',{},false);hold(ax1,'on');
lh_ns = plot(ax1,lca.x,lca.y,'-k','LineWidth',2,'DisplayName','N-S bifurcation');
lh_ac = plot(ax1,A_c(par,p2Range(:,2)),p2Range(:,2),'--r','LineWidth',2,'DisplayName','$A_c$');
colormap(fh,[0.9.*ones(1,3);brewerCMap(100,4)]);%colormap(fh,[0.8.*ones(1,3);brewerCMap(100,4)])
cb=colorbar(ax1,'Position', [0.14 0.5 0.014167 0.21286],'AxisLocation','in');
set(cb,'Ticks',minmax(cb.Ticks),'TickLabels',{[cb.TickLabels{1},' (super)'],[cb.TickLabels{end},' (SOqC)']},'TickLabelInterpreter','latex','FontSize',11);
set(cb.Title,'String','$\theta^*$','Rotation',0,'FontSize',16,'Interpreter','latex');%,'Position',[0.367,25.98,0]);
cb.Title.Position(1)=cb.Title.Position(1)+5;
set(ax1,'CLim',minmax(fp.(fp_to_plot){1}(:)'),'XTick',20:5:40,'YTick',unique([100,0:500:2000]));
ax1.YTickLabel = ax1.YTick./1e2;
xlabel('$A$','Interpreter','latex','FontSize',18);
ylabel('$\tau_\theta\,\,\,(10^2)$','Interpreter','latex','FontSize',18);
parTxt = strrep(strrep(strrep(getParamString(par,-2),'I','I^{\rm ext}'),'G','\Gamma'),'tauW','\tau_w');
text(ax1,lh_ac.XData(end-10),lh_ac.YData(end-10),'$A=A_c$','FontSize',14,'Interpreter','latex','Rotation',-60,'HorizontalAlignment','left','VerticalAlignment','top','Color','r');
text(ax1,lca.x(1),lca.y(1),'N-S line','FontSize',14,'Interpreter','latex','Rotation',-10,'HorizontalAlignment','right','VerticalAlignment','top');
text(ax1,20.5,140,parTxt,'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','bottom','FontSize',14)
text(ax1,27,900,'Periodic oscillations','Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',16,'Rotation',-30);
text(ax1,36,1900,{'Stochastic', 'oscillations'},'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',16,'Rotation',-30);
text(ax1,25.9,1600,{'Quasicritical','fluctuations'},'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','middle','FontSize',16,'Rotation',-42);
text(ax1,30.44,950,{'$\rho^*\sim\rho_c$','$W^*\sim W_c$','$\theta^*\sim I^{\rm ext}$'},'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','bottom','FontSize',16,'Rotation',-23);
% annotation(fh,'arrow',[0.739642857142856 0.843214285714285],[0.410000000000003 0.369047619047619]);
annotation(fh,'arrow',[0.331785714285714 0.274642857142857],[0.760476190476191 0.884285714285715]);
% annotation(fh,'arrow',[cb.Position(1), cb.Position(1)+cb.Position(3)*3.2],cb.Position(2).*ones(1,2));
% text(ax1,22.5,1060,'$W^*=W_c$','Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',14);

if saveOutputFigures
    saveFigure(gcf, '..\fig\phasediag_2taus_thetaS_color', 'png', false, {}, 600)
end

%%

fp_to_plot = 'xS';


fh = figure('Renderer','opengl');
ax1 = axes;
ih = plotManifoldXY(ax1,p1Range,p2Range,fp.(fp_to_plot){1},'imagesc',{},false);hold(ax1,'on');
lh_ns = plot(ax1,lca.x,lca.y,'-k','LineWidth',2,'DisplayName','N-S bifurcation');
lh_ac = plot(ax1,A_c(par,p2Range(:,2)),p2Range(:,2),'--r','LineWidth',2,'DisplayName','$A_c$');
colormap(fh,[0.9.*ones(1,3);flipud(brewerCMap(100,4))]);%colormap(fh,[0.8.*ones(1,3);brewerCMap(100,4)])
cb=colorbar(ax1,'Position', [0.14 0.5 0.014167 0.21286],'AxisLocation','in');
set(cb,'Ticks',minmax(cb.Ticks),'TickLabels',{[cb.TickLabels{1},' ($\rho^*\sim\rho_c$)'],[cb.TickLabels{end},' (super)']},'TickLabelInterpreter','latex','FontSize',11);
set(cb.Title,'String','$\rho^*$','Rotation',0,'FontSize',16,'Interpreter','latex');%,'Position',[0.367,25.98,0]);
cb.Title.Position(1)=cb.Title.Position(1)+5;
set(ax1,'CLim',minmax(fp.(fp_to_plot){1}(:)'),'XTick',20:5:40,'YTick',unique([100,0:500:2000]));
ax1.YTickLabel = ax1.YTick./1e2;
xlabel('$A$','Interpreter','latex','FontSize',18);
ylabel('$\tau_\theta\,\,\,(10^2)$','Interpreter','latex','FontSize',18);
parTxt = strrep(strrep(strrep(getParamString(par,-2),'I','I^{\rm ext}'),'G','\Gamma'),'tauW','\tau_w');
text(ax1,lh_ac.XData(end-10),lh_ac.YData(end-10),'$A=A_c$','FontSize',14,'Interpreter','latex','Rotation',-60,'HorizontalAlignment','left','VerticalAlignment','top','Color','r');
text(ax1,lca.x(1),lca.y(1),'N-S line','FontSize',14,'Interpreter','latex','Rotation',-10,'HorizontalAlignment','right','VerticalAlignment','top');
text(ax1,20.5,140,parTxt,'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','bottom','FontSize',14)
text(ax1,27,900,'Periodic oscillations','Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',16,'Rotation',-30);
text(ax1,36,1900,{'Stochastic', 'oscillations'},'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',16,'Rotation',-30);
text(ax1,25.9,1600,{'Quasicritical','fluctuations'},'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','middle','FontSize',16,'Rotation',-42);
text(ax1,30.44,950,{'$\rho^*\sim\rho_c$','$W^*\sim W_c$','$\theta^*\sim I^{\rm ext}$'},'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','bottom','FontSize',16,'Rotation',-23);
% annotation(fh,'arrow',[0.739642857142856 0.843214285714285],[0.410000000000003 0.369047619047619]);
annotation(fh,'arrow',[0.331785714285714 0.274642857142857],[0.760476190476191 0.884285714285715]);
% annotation(fh,'arrow',[cb.Position(1), cb.Position(1)+cb.Position(3)*3.2],cb.Position(2).*ones(1,2));
% text(ax1,22.5,1060,'$W^*=W_c$','Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',14);

if saveOutputFigures
    saveFigure(gcf, '..\fig\phasediag_2taus_rhoS_color', 'png', false, {}, 600)
end

%%

fp_to_plot = 'yS';


fh = figure('Renderer','opengl');
ax1 = axes;
ih = plotManifoldXY(ax1,p1Range,p2Range,fp.(fp_to_plot){1},'imagesc',{},false);hold(ax1,'on');
if tauW == 1e4
    lh_ns = plot(ax1,lca(end).x,lca(end).y,'-k','LineWidth',2,'DisplayName','N-S bifurcation');
    lh_ns_r = plot(ax1,rca(end).x,rca(end).y,':k','LineWidth',2,'DisplayName','N-S bifurcation');
else
    lh_ns = plot(ax1,lca.x,lca.y,'-k','LineWidth',2,'DisplayName','N-S bifurcation');
end
lh_ac = plot(ax1,A_c(par,p2Range(:,2)),p2Range(:,2),'--r','LineWidth',2,'DisplayName','$A_c$');
colormap(fh,[0.9.*ones(1,3);flipud(brewerCMap(100,4))]);%colormap(fh,[0.8.*ones(1,3);brewerCMap(100,4)])
cb=colorbar(ax1,'Position', [0.14 0.5 0.014167 0.21286],'AxisLocation','in');
set(cb,'Ticks',minmax(cb.Ticks),'TickLabels',{[cb.TickLabels{1},' ($W^*\sim W_c$)'],[cb.TickLabels{end},' (super)']},'TickLabelInterpreter','latex','FontSize',11);
set(cb.Title,'String','$W^*$','Rotation',0,'FontSize',16,'Interpreter','latex');%,'Position',[0.367,25.98,0]);
cb.Title.Position(1)=cb.Title.Position(1)+5;
if tauW == 1e4
    cb.Position = [0.8500 0.6238 0.0142 0.2129];
    set(ax1,'CLim',minmax(fp.(fp_to_plot){1}(:)'),'XTick',20:100:400,'YTick',unique([100,0:1000:10000]));
else
    set(ax1,'CLim',minmax(fp.(fp_to_plot){1}(:)'),'XTick',20:5:40,'YTick',unique([100,0:500:2000]));
end
ax1.YTickLabel = ax1.YTick./1e2;
xlabel('$A$','Interpreter','latex','FontSize',18);
ylabel('$\tau_\theta\,\,\,(10^2)$','Interpreter','latex','FontSize',18);
parTxt = strrep(strrep(strrep(getParamString(par,-2),'I','I^{\rm ext}'),'G','\Gamma'),'tauW','\tau_w');
if tauW == 1e4
    text(ax1,284.1,3.56e3,'Flip line','FontSize',14,'Interpreter','latex','Rotation',-30,'HorizontalAlignment','right','VerticalAlignment','top');
    text(ax1,99.2,1.6e3,'N-S line','FontSize',14,'Interpreter','latex','Rotation',-45,'HorizontalAlignment','right','VerticalAlignment','top');
    text(ax1,36.6,6.63e3,'$A=A_c$','FontSize',14,'Interpreter','latex','Rotation',-83,'HorizontalAlignment','left','VerticalAlignment','top','Color','r');
    text(ax1,167,7.24e3,parTxt,'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','bottom','FontSize',14)
    text(ax1,270,5.33e3,'n-cycles','Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',16,'Rotation',0);
    text(ax1,27,830,'Periodic oscillations','Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',16,'Rotation',0);
    text(ax1,131.9,8.9e3,{'Stochastic', 'oscillations'},'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',16,'Rotation',-70);
    text(ax1,62.4,6.83e3,{'Quasicritical','fluctuations'},'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','middle','FontSize',16,'Rotation',-75);
    text(ax1,99.8,2.18e3,{'$\rho^*\sim\rho_c$','$W^*\sim W_c$','$\theta^*\sim I^{\rm ext}$'},'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','bottom','FontSize',16,'Rotation',-23);
    annotation(fh,'arrow',[0.2189 0.2075],[0.6795 0.8176]);
else
    text(ax1,lca.x(1),lca.y(1),'N-S line','FontSize',14,'Interpreter','latex','Rotation',-10,'HorizontalAlignment','right','VerticalAlignment','top');
    text(ax1,lh_ac.XData(end-10),lh_ac.YData(end-10),'$A=A_c$','FontSize',14,'Interpreter','latex','Rotation',-60,'HorizontalAlignment','left','VerticalAlignment','top','Color','r');
    text(ax1,20.5,140,parTxt,'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','bottom','FontSize',14)
    text(ax1,27,900,'Periodic oscillations','Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',16,'Rotation',-30);
    text(ax1,36,1900,{'Stochastic', 'oscillations'},'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',16,'Rotation',-30);
    text(ax1,25.9,1600,{'Quasicritical','fluctuations'},'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','middle','FontSize',16,'Rotation',-42);
    text(ax1,30.44,950,{'$\rho^*\sim\rho_c$','$W^*\sim W_c$','$\theta^*\sim I^{\rm ext}$'},'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','bottom','FontSize',16,'Rotation',-23);
    annotation(fh,'arrow',[0.331785714285714 0.274642857142857],[0.760476190476191 0.884285714285715]);
end
% annotation(fh,'arrow',[0.739642857142856 0.843214285714285],[0.410000000000003 0.369047619047619]);
% annotation(fh,'arrow',[cb.Position(1), cb.Position(1)+cb.Position(3)*3.2],cb.Position(2).*ones(1,2));
% text(ax1,22.5,1060,'$W^*=W_c$','Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',14);

if saveOutputFigures
    saveFigure(gcf, '..\fig\phasediag_2taus_WS_color', 'png', false, {}, 600)
end

return

%% preliminary figures

% [lca,rca] = calcStLimitCurveFromManifold(p1Range(1,:),p2Range(:,1)',fp.xS{1},[4,4]);
% [bca,tca] = calcStLimitCurveFromManifold(p1Range(1,:),p2Range(:,1)',fp.xS{1},[4,4],'horiz');

% plotting the manifold
fh1 = figure('Position',[200,180,1200,300]);
ax_mn(1) = subplot(1,3,1);
ax_mn(2) = subplot(1,3,2);
ax_mn(3) = subplot(1,3,3);
plotManifoldXY(ax_mn(1),p1Range,p2Range,fp.xS{1})
plotManifoldXY(ax_mn(2),p1Range,p2Range,fp.yS{1})
plotManifoldXY(ax_mn(3),p1Range,p2Range,fp.zS{1})

% plotting the distance to the critical point
fh2 = figure('Position',[220,200,1200,300]);
ax_cp(1) = subplot(1,3,1);
ax_cp(2) = subplot(1,3,2);
ax_cp(3) = subplot(1,3,3);
plotManifoldXY(ax_cp(1),p1Range,p2Range,d_cp.rho)
plotManifoldXY(ax_cp(2),p1Range,p2Range,d_cp.W)
plotManifoldXY(ax_cp(3),p1Range,p2Range,d_cp.theta)

