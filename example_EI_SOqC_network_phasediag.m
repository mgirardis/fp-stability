clearvars
close all

addpath func
addpath models\einet_soqc

%%

% s = [1,1,-1,-1];
% r = [1,-1,1,-1];
s = -1;
r = -1;
% tau_range = logspace(log10(0.1),log10(1e6),5000);
tau_range = linspace(0.1,500,100);
A_range = linspace(20,80,100);
par = getSOqCMFEINetParamStruct(1,0.2,0.8,0.2,10,A_range,tau_range,0.1);

[fp,p1Range,p2Range,parName] = getStableFPSurf(par,@fixedPointGLNetEISOqC,@eigenvalJacobGLNetEISOqC,{s,r},[],{'A',100,[20,80]},{'T',100,[1,2500]});

%%

fh = figure('Renderer','opengl');
ax1 = axes;
% ax2 = axes('Position',[0.4518 0.2757 0.3532 0.3600]);
a1 = pcolor(ax1,p1Range, p2Range, fp.xS{1});a1.EdgeColor = 'none';a1.HandleVisibility = 'off';
% a1 = pcolor(ax2,p1Range, p2Range, fp.xS{1});a1.EdgeColor = 'none';a1.HandleVisibility = 'off';
% hold(ax1,'all'); %hold(ax2,'all');
% a2 = pcolor(ax1,p1Range, p2Range, fp.xS{2});a2.EdgeColor = 'none';a2.HandleVisibility = 'off';
% a2 = pcolor(ax2,p1Range, p2Range, xS{2});a2.EdgeColor = 'none';a2.HandleVisibility = 'off';
