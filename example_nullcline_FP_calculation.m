clearvars
close all

addpath func
addpath models\ktz

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% for the KT Tanh map
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% creates a set of parameters for the KTtanh map
% sets K = 0.6, T = 0.2, and H is the parameter over which we will trace the bifurcation diagram
par = getKTzParamStruct(0.6,0.2,0,0,0,linspace(-0.15,0.15,1000));

%% calculates the FP of the KTtanh map
fp = getFixedPoints(par,@fixedPointKTTanh,@eigenvalJacobKTTanh);

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

%% creates a set of parameters for the KTztanh map
% sets K = 0.6, T = 0.2, and H is the parameter over which we will trace the bifurcation diagram
par = getKTzParamStruct(0.6,0.1,0.001,0.001,linspace(-0.8,0,1000),0);

%% calculates the FP of the KTztanh map
fp = getFixedPoints(par,@fixedPointKTzTanh,@eigenvalJacobKTzTanh);

%% plots the calculated FP 
[~,~,ax] = plotFPStruct([],fp); % this function does the magic of plotting the FP :)
title(ax,'Bifurcation over x_R for KTz Tanh map');