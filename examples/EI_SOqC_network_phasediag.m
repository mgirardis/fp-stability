clearvars
close all

addpath ../func
addpath ../models/einet_soqc

% defining the critical point
rho_c = @(p1Range) zeros(size(p1Range));
W_c = @(par,pRange) zeros(size(pRange))+(par.p.*par.J-1./par.G)./par.q;
theta_c = @(par,pRange) zeros(size(pRange)) + par.I;
A_c = @(par,tauW,tauT) W_c(par,1).*(1+tauW./tauT); % critical value of A when tauT=tauW and uT=uW

% inline if
iif = @(cond,a,b) cond.*a+(~cond).*b;

get_elem = @(A,i,j,k) A( sub2ind(size(A),i,j,k) );

cp_precision = 5e-1; % how close to the critical point I want to be

%% doing the calculations

% I want only the active stable state
s = -1;
r = -1;
tau_range = {'T',500,[100,2000]};
A_range = {'A',1000,[20,40]};
par = getSOqCMFEINetParamStruct(1,0.2,0.8,0.2,10,get_linspace_from_par_range(A_range),get_linspace_from_par_range(tau_range),0.1);

% calculating the FP manifold
[fp,p1Range,p2Range,parName,Lambda] = getStableFPSurf(par,@fixedPointGLNetEISOqC,@eigenvalJacobGLNetEISOqC,{s,r},[],A_range,tau_range);
[lca,rca,ilca,irca] = calcStLimitCurveFromManifold(p1Range(1,:),p2Range(:,1)',fp.yS{1},[40,40]);
% if you check the eigenvalues at the point of bifurcation
%    their absolute values are 
%                 mean(abs(get_elem(Lambda{1},ilca.i,ilca.j,ones(size(ilca.i)))))
%    and they are complex
%                 mean(get_elem(Lambda{1},ilca.i,ilca.j,ones(size(ilca.i))))
% meaning that the stability limit line is a Neimark-Sacker bifurcation (subcritical because of the magnitude of the FP > 0)

% calculating the distance to the critical point
d_cp.rho = iif(abs(fp.xS{1} - rho_c(p1Range)) <= cp_precision,1,0);
d_cp.W = iif(abs(fp.yS{1} - W_c(par,p1Range)) <= cp_precision,1,0);
d_cp.theta = iif(abs(fp.zS{1} - theta_c(par,p1Range)) <= cp_precision,1,0);
d_cp.rho(d_cp.rho==0)=NaN;
d_cp.W(d_cp.W==0)=NaN;
d_cp.theta(d_cp.theta==0)=NaN;

%%

fh = figure('Renderer','opengl');
ax1 = axes;
ih = plotManifoldXY(ax1,p1Range,p2Range,fp.yS{1},'imagesc',{},false);hold(ax1,'on');
lh_ns = plot(ax1,lca.x,lca.y,'-k','LineWidth',2,'DisplayName','N-S bifurcation');
lh_ac = plot(ax1,A_c(par,p2Range(:,2),p2Range(:,2)),p2Range(:,2),'--r','LineWidth',2,'DisplayName','$A_c$');
colormap(fh,[0.9.*ones(1,3);flipud(brewerCMap(100,5))]);%colormap(fh,[0.8.*ones(1,3);brewerCMap(100,4)])
cb=colorbar(ax1,'Position', [0.179 0.61 0.014167 0.21286]);
set(cb.Label,'String','$W^*$','Rotation',0,'FontSize',16,'Interpreter','latex','Position',[0.367,20.98,0]);
set(ax1,'CLim',minmax(fp.yS{1}(:)'),'XTick',20:5:40,'YTick',unique([100,0:500:2000]));
ax1.YTickLabel = ax1.YTick./1e2;
xlabel('$A$','Interpreter','latex','FontSize',18);
ylabel('$\tau\,\,\,(10^2)$','Interpreter','latex','FontSize',18);
parTxt = strrep(strrep(getParamString(par,-2),'I','I^{\rm ext}'),'G','\Gamma');
text(ax1,lh_ac.XData(end-10),lh_ac.YData(end-10),'$A=A_c$','FontSize',14,'Interpreter','latex','Rotation',90,'HorizontalAlignment','right','VerticalAlignment','bottom','Color','r');
text(ax1,lh_ns.XData(10),lh_ac.YData(10),'N-S line','FontSize',14,'Interpreter','latex','Rotation',15,'HorizontalAlignment','left','VerticalAlignment','bottom');
text(ax1,20.5,1150,parTxt,'Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',14)
text(ax1,24,700,{'Periodic','oscillations'},'Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','top','FontSize',16);
text(ax1,35,700,{'Stochastic', 'oscillations'},'Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','top','FontSize',16);
annotation(fh,'arrow',[cb.Position(1), cb.Position(1)+cb.Position(3)*3.2],(cb.Position(2)+cb.Position(4)/2).*ones(1,2));
text(ax1,22.5,1550,'$W^*=W_c$','Interpreter','latex','HorizontalAlignment','left','VerticalAlignment','top','FontSize',14);

saveFigure(gcf, '..\fig\phasediag_eq_taus', 'png', false, {}, 600)

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

