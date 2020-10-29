clearvars
close all

addpath ../func
addpath ../models/ktz

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% for the KT Log map
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% creates a set of parameters for the KTLog map
% sets K = 0.6, T = 0.2, and H is the parameter over which we will trace the bifurcation diagram
par = getKTzParamStruct(0.6,0.2,0,0,0,linspace(-0.05,0.05,2000));

%% calculates the FP of the KTLog map
s = [1,1,-1,-1]; % this are just helper constants from the theory of the KT logistic map
r = [1,-1,1,-1];
fp = getFixedPoints(par,@fixedPointKTLog,@eigenvalJacobKTLog,{s,r});

%% plots the calculated FP 
[~,~,ax] = plotFPStruct([],fp); % this function does the magic of plotting the FP :)
title(ax,'Bifurcation over H for KT Logistic map');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% for the KTz Log map
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% creates a set of parameters for the KTzLog map
% sets K = 0.6, T = 0.2, and H is the parameter over which we will trace the bifurcation diagram
par = getKTzParamStruct(0.6,0.1,0.001,0.001,linspace(-0.6,0,2000),0);

%% calculates the FP of the KTzLog map
s = [1,1,-1,-1]; % this are just helper constants from the theory of the KT logistic map
r = [1,-1,1,-1];
fp = getFixedPoints(par,@fixedPointKTzLog,@eigenvalJacobKTzLog,{s,r});

%% plots the calculated FP 
[~,~,ax] = plotFPStruct([],fp); % this function does the magic of plotting the FP :)
title(ax,'Bifurcation over x_R for KTz Logistic map');