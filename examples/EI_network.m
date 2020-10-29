clearvars
close all

addpath ../func
addpath ../models/einet_static

theta = 1;
J0 = 10;
Gamma0 = 1;
pEx = 0.8;
qIn = 1 - pEx;
h0 = 0;
W0 = 1;
g0 = 3.5;
h_values = [-1,-0.6,0,0.4,1];
g_func = @(p,q,W,J) p./q - W./(q.*J);
Y_func = @(h,theta) 1 + h./theta;
W_func = @(p,q,g,J) (p-q.*g).*J;
h_func = @(Y,theta) theta.*(Y-1);

s = [1,1,-1,-1]; % this are just helper constants from the theory of the KT logistic map
r = [1,-1,1,-1];
fpName = '\rho*,,\Gamma*';
fpPlotOpt = {'FPUpStabLim',0.5};

%% fig 3 and 4A -- order param rho as a function of W for different h

mmW = [-8,8];
nCurves = numel(h_values);
W_tr = @(h,G) (1 + 2.*sqrt(-h.*G) - h.*G)./G;
rho_tr = @(h,G,W) (-1 - h.*G + W.*G)./(2.*W.*G);
pColors = lines(nCurves);

fh = figure;
ax1 = axes;
for i = 1:nCurves
    h = h_values(i);
    if h<0
        W_FP = W_tr(h,Gamma0);
        WW = [linspace(mmW(1),W_FP,5000),linspace(W_FP,mmW(2),10000)];
    else
        WW = linspace(mmW(1),mmW(2),5000);
    end
    par = getGLNetParamStruct(0,0,0,0,J0,Gamma0,...
                              [],[],[],[],[],[],[],[],...
                              h,WW,pEx,qIn);
    p = getFixedPoints(par, @fixedPointGLNetEI, @eigenvalJacobGLNetEI,{s,r},[],'\rho*,,\Gamma*');
    plotFPStruct(ax1,p,[],false,false,[],@(x)g_func(pEx,qIn,x,J0),'$g$',pColors(i,:),[],[],fpPlotOpt);
end