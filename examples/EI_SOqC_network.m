clearvars
close all

addpath ../func
addpath ../models/einet_soqc

%%

s = [1,1,-1,-1];
r = [1,-1,1,-1];
% tau_range = logspace(log10(0.1),log10(1e6),5000);
tau_range = linspace(0.1,500,10000);
par = getSOqCMFEINetParamStruct(1,0.2,0.8,0.2,10,73.5,tau_range,0.1);

fp = getFixedPoints(par,@fixedPointGLNetEISOqC,@eigenvalJacobGLNetEISOqC,{s,r},[],'\rho*,W*,\theta*');
fp=arrayfun(@(x)setfield(x,'parName','\tau'),fp);
plotFPStruct([],fp,[],true,true);