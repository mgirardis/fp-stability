clearvars
close all

addpath func
addpath models/einet_soqc

% defining the critical point
rho_c = @(p1Range) zeros(size(p1Range));
W_c = @(par,pRange) zeros(size(pRange))+(par.p.*par.J-1./par.G)./par.q;
theta_c = @(par,pRange) zeros(size(pRange)) + par.I;
A_c = @(par,pRange) W_c(par,pRange).*2; % critical value of A when tauT=tauW and uT=uW

% inline if
iif = @(cond,a,b) cond.*a+(~cond).*b;

cp_precision = 5e-1; % how close to the critical point I want to be

%%

% I want only the active stable state
s = -1;
r = -1;
tau_range = {'T',1000,[1,2500]};
A_range = {'A',500,[20,80]};
par = getSOqCMFEINetParamStruct(1,0.2,0.8,0.2,10,get_linspace_from_par_range(A_range),get_linspace_from_par_range(tau_range),0.1);

% calculating the FP manifold
[fp,p1Range,p2Range,parName] = getStableFPSurf(par,@fixedPointGLNetEISOqC,@eigenvalJacobGLNetEISOqC,{s,r},[],A_range,tau_range);

% calculating the distance to the critical point
d_cp.rho = iif(abs(fp.xS{1} - rho_c(p1Range)) <= cp_precision,1,0);
d_cp.W = iif(abs(fp.yS{1} - W_c(par,p1Range)) <= cp_precision,1,0);
d_cp.theta = iif(abs(fp.zS{1} - theta_c(par,p1Range)) <= cp_precision,1,0);
d_cp.rho(d_cp.rho==0)=NaN;
d_cp.W(d_cp.W==0)=NaN;
d_cp.theta(d_cp.theta==0)=NaN;

%%

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