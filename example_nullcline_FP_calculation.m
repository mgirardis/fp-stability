clearvars
close all

addpath func

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% for the KT Tanh map
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% creates a set of parameters for the KTtanh map
% sets K = 0.6, T = 0.2, and H is the parameter over which we will trace the bifurcation diagram
% H is divided in 1000 points from -0.15 to 0.15
par = getKTzParamStruct(0.6,0.2,0,0,0,linspace(-0.15,0.15,1000));

%% calculates the FP of the KTtanh map
[xS,yS] = fixedPointKTTanh(par, [], []);

%% calculates the eigenvalues of the FPs
% notice that xS is a cell with 3 entries
% so we need a pair of eigenvalues for each entry in xS
par_ev = par;
par_ev.xS = xS; % we need to add this field to the struct par because the eigenval depends on xS
Lambda = eigenvalJacobKTTanh(par_ev); % this function already returns a pair for each entry in xS

%% determining the stability of the FP
% now we can determine which sections of xS{i} is stable or not
% the function below does the trick
allfpvars.xS = xS;
allfpvars.yS = yS;
allfpvars.zS = yS; % KTtanh has only x* and y*, so we just set z* = y* to avoid error in the function below
fp = getFixedPoints(par,allfpvars,Lambda);

%% plots the calculated FP 
[~,~,ax] = plotFPStruct([],fp); % this function does the magic of plotting the FP :)
title(ax,'Bifurcation over H for KT Tanh map');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% for the KTz Tanh map
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% creates a set of parameters for the KTtanh map
% sets K = 0.6, T = 0.1, delta=lambda=0.001, and xR is the parameter over which we will trace the bifurcation diagram
% xR is divided in 1000 points between -0.8 and 0
par = getKTzParamStruct(0.6,0.1,0.001,0.001,linspace(-0.8,0,1000),0);

%% calculates the FP of the KTtanh map
[xS,zS] = fixedPointKTzTanh(par, [], []);

%% calculates the eigenvalues of the FPs
% notice that xS is a cell with 3 entries
% so we need a pair of eigenvalues for each entry in xS
par_ev = par;
par_ev.xS = xS; % we need to add this field to the struct par because the eigenval depends on xS
par_ev.zS = zS;
Lambda = eigenvalJacobKTTanh(par_ev); % this function already returns a pair for each entry in xS

%% determining the stability of the FP
% now we can determine which sections of xS{i} is stable or not
% the function below does the trick
allfpvars.xS = xS;
allfpvars.yS = xS; % this comes from the theory
allfpvars.zS = zS; % KTztanh has only x* and z*, and y* = x*
fp = getFixedPoints(par,allfpvars,Lambda);

%% plots the calculated FP 
[~,~,ax] = plotFPStruct([],fp); % this function does the magic of plotting the FP :)
title(ax,'Bifurcation over x_R for KTz Tanh map');
