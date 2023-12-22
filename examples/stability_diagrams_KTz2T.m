clearvars
close all

addpath func
addpath models/ktz2Tanh

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% for the KT 2 Tanh map
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% creates a set of parameters for the KTtanh map
% sets K = 0.6, T = 0.2, and H is the parameter over which we will trace the bifurcation diagram
                           %(K  ,  T, d, l, xR, H)
                           %(K  ,  T, d, l, xR, H, Z)
par = getKTz2TanhParamStruct(0.6,0.2, 0, 0,  0, -0.2, linspace(-0.15,0.15,1000));

%% calculates the FP of the KTtanh map
fp = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],true); % true because y == x in this model

%% plots the calculated FP 
[~,~,ax] = plotFPStruct([],fp); % this function does the magic of plotting the FP :)
title(ax,'Bifurcation over Z for KT2Tanh map');

%% K vs T diagram: calculating stability limit between Ferro and Mod phases for H=0 and Z=0

par       = getKTz2TanhParamStruct(linspace(0.2,2,30),linspace(0.02,0.62,200), 0, 0,  0, 0, 0);
[KSt,TSt] = find_KT2Tanh_StabLimFerro(par,par.K,par.T,100,1e-3,100); % [KSt,TSt] = find_KT2Tanh_StabLimFerro_bisection(par,par.K,par.T,100,1e-6);
dlmwrite('KT2Tanh_stlim_ferro_H0_Q0.txt','#K_St_Ferro_Q0_H0=','');
dlmwrite('KT2Tanh_stlim_ferro_H0_Q0.txt',KSt,'-append','delimiter',',');
dlmwrite('KT2Tanh_stlim_ferro_H0_Q0.txt','#T_St_Ferro_Q0_H0=','-append','delimiter','');
dlmwrite('KT2Tanh_stlim_ferro_H0_Q0.txt',TSt,'-append','delimiter',',');

par       = getKTz2TanhParamStruct(linspace(0.2,2,30),linspace(0.02,0.62,200), 0, 0,  0, 0, 0);
[KSt,TSt] = find_KT2Tanh_StabLimMod(par,minmax(par.K),   par.T,    30,1e-2,4,40000,50000,1e-6,50);
dlmwrite('KT2Tanh_stlim_mod_H0_Q0.txt','#K_St_Mod_Q0_H0=','');
dlmwrite('KT2Tanh_stlim_mod_H0_Q0.txt',KSt,'-append','delimiter',',');
dlmwrite('KT2Tanh_stlim_mod_H0_Q0.txt','#T_St_Mod_Q0_H0=','-append','delimiter','');
dlmwrite('KT2Tanh_stlim_mod_H0_Q0.txt',TSt,'-append','delimiter',',');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% for the KTz Tanh map
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% creates a set of parameters for the KTztanh map
% sets K = 0.6, T = 0.2, and H is the parameter over which we will trace the bifurcation diagram
%par = getKTzParamStruct(0.6,0.1,0.001,0.001,linspace(-0.8,0,1000),0);
                           %(K  ,  T ,    d,    l,  xR  ,     H, Z)
par = getKTz2TanhParamStruct(0.6,0.35,0.006,0.004, -0.98,  -0.2, linspace(0.01,1.5,1000));

%% calculates the FP of the KTztanh map
fp = getFixedPoints(par,@fixedPointKTz2Tanh,@eigenvalJacobKTz2Tanh,[],[],[],[],[],false); % true because y == x in this model

%% plots the calculated FP 
[~,~,ax] = plotFPStruct([],fp); % this function does the magic of plotting the FP :)
title(ax,'Bifurcation over Z for KTz2Tanh map');
