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
fp = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],false); % true because y == x in this model

%% plots the calculated FP 
[~,~,ax] = plotFPStruct([],fp); % this function does the magic of plotting the FP :)
title(ax,'Bifurcation over Z=Q for KT2Tanh map');

%% K vs T diagram: calculating stability limit between Ferro and Mod phases for H=0 and Z=Q=0

par       = getKTz2TanhParamStruct(linspace(0.2,2,30),linspace(0.02,0.62,200), 0, 0,  0, 0, 0);
[KSt,TSt] = find_KT2Tanh_StabLimFerro_H0Q0(par,par.K,par.T,100,1e-3,100); % [KSt,TSt] = find_KT2Tanh_StabLimFerro_bisection(par,par.K,par.T,100,1e-6);
write_txt_for_Mathematica('KT2Tanh_stlim_ferro_H0_Q0.txt',{'K_St_Ferro_Q0_H0','T_St_Ferro_Q0_H0'},{KSt,TSt});

par       = getKTz2TanhParamStruct(linspace(0.2,2,30),linspace(0.02,0.62,200), 0, 0,  0, 0, 0);
[KSt,TSt] = find_KT2Tanh_StabLimMod_H0Q0(par,minmax(par.K),   par.T,    30,1e-2,4,40000,50000,1e-6,50);
write_txt_for_Mathematica('KT2Tanh_stlim_mod_H0_Q0.txt',{'K_St_Mod_Q0_H0','T_St_Mod_Q0_H0'},{KSt,TSt});

%% K vs T for H=0 stability limits from the FP calculation 
% this is just to check whether calc_StabLim_KT2Tanh_QTK is returning the correct stability limits
% since these are analytical and are shown in the Mathematica file
par              = getKTz2TanhParamStruct(linspace(0.02,1,300),linspace(0.02,1,300), 0, 0,  0, 0, 0);
[KSt,TSt,QSt]    = calc_StabLim_KT2Tanh_QTK(0,par.K,par.T,false);
[KStMod,TStMod]  = calc_KTz_StabLim_FP_iter(par,'K',par.K,'T',par.T,'KT2Tanh',1,30000,40000,50,1e-6);

QSt_c = matCell2Mat(QSt(:));
[n,~]=find(abs(QSt_c)<=1e-3);
figure;plot(KSt(n),TSt(n),'.');xlabel('K');ylabel('T');
hold on;
plot(matCell2Mat( KStMod'),TStMod,'.r');
title('H=0; Z=Q=0');

% Visualizing the bifurcations for H=0,Q=0
par  = getKTz2TanhParamStruct(linspace(0.02,1,3000), 0.2, 0, 0,  0, 0, 0);
fp5  = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],false);
[~,~,ax]=plotFPStruct([],fp5,[],true,true);
text(ax,ax.XLim(2),ax.YLim(2),sprintf('T=%g',par.T),'HorizontalAlignment','right','VerticalAlignment','top');

% checking limit cycles
K_probe = linspace(0.02,0.8,15);
x=arrayfun(@(K)KTAtrator_mex(  getKTzParamStruct_for_KTAtrator(setfield(par,'K',K))  ,[-0.1,-0.1],0,100,'KT2Tanh','',true,false),K_probe,'UniformOutput',false);
plot_stacked_attractors([], x, [], [], 20, [], [], [], arrayfun(@(K)sprintf('$K=%.4g$',K),K_probe,'UniformOutput',false),[],[],{'Color','k','HorizontalAlignment','right'})
title(sprintf('V(t); T=%g',par.T));

par  = getKTz2TanhParamStruct(linspace(0.02,1,3000), 0.7, 0, 0,  0, 0, 0);
fp6  = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],false);
[~,~,ax]=plotFPStruct([],fp6,[],true,true);
text(ax,ax.XLim(2),ax.YLim(2),sprintf('T=%g',par.T),'HorizontalAlignment','right','VerticalAlignment','top');

% checking limit cycles
K_probe = linspace(0.02,0.8,15);
x=arrayfun(@(K)KTAtrator_mex(  getKTzParamStruct_for_KTAtrator(setfield(par,'K',K))  ,[-0.1,-0.1],0,100,'KT2Tanh','',true,false),K_probe,'UniformOutput',false);
plot_stacked_attractors([], x, [], [], 20, [], [], [], arrayfun(@(K)sprintf('$K=%.4g$',K),K_probe,'UniformOutput',false),[],[],{'Color','k','HorizontalAlignment','right'})
title(sprintf('V(t); T=%g',par.T));

%% K vs T for H=-0.2 stability limits from the FP calculation 
% this is just too check whether calc_StabLim_KT2Tanh_QTK is returning the correct stability limits
% since these are analytical and are shown in the Mathematica file
par              = getKTz2TanhParamStruct(linspace(0.02,1,300),linspace(0.02,1,300), 0, 0, 0, -0.2, 0);
[KSt,TSt,QSt]    = calc_StabLim_KT2Tanh_QTK(par.H,par.K,par.T,false);
[KStMod,TStMod]  = calc_KTz_StabLim_FP_iter(par,'K',par.K,'T',par.T,'KT2Tanh',1,30000,40000,50,1e-6);

QSt_c = matCell2Mat(QSt(:));
[n,~]=find(abs(QSt_c)<=1e-3);

figure;plot(KSt(n),TSt(n),'.');xlabel('K');ylabel('T');
hold on;
plot(matCell2Mat( KStMod'),TStMod,'.r');
title('H=-0.2; Z=Q=0');


% lower branch Fold (former subcritical pitchfork when H=0, lower = ">")
[KStQ0_1,TStQ0_1]   = find_curve(KSt(n),TSt(n),[0.02,0.94755853],[0.023277592,0.9410033445],[],20,1,1e-3,25,10);
[KStQ0_2,TStQ0_2]   = find_curve(KSt(n),TSt(n),[0.937725752,0.02],[0.92789298,0.02327759197],[],10,1,1e-3,25,10);
[KStQ0_1,ind]       = unique([KStQ0_1;KStQ0_2]);
TStQ0_1             = [TStQ0_1;TStQ0_2];
TStQ0_1             = TStQ0_1(ind);
% subcritical Neimark-Sacker
[KStQ0_3,TStQ0_3]   = find_curve(KSt(n),TSt(n),[0.432976589,0.37070234],[0.43953177,0.3608695652],[],30,1,1e-3,25,30);
% Unstable fold (upper = "<")
[KStQ0_4,TStQ0_4]   = find_curve(KSt(n),TSt(n),[0.242876254,0.02],[0.24943,0.0232776],[],20,1,1e-5,25,10);
% supercritical NS (upper branch FP)
KStMod = cell2mat(KStMod');
TStMod = TStMod(:);

write_txt_for_Mathematica('KT2Tanh_stlim_TvsK_H-0.2_Q0.txt',  {'Q'                           ,'H',...
                                                               'K_StLim_FP1_Low_Fold'        ,'T_StLim_FP1_Low_Fold'   ,...
                                                               'K_StLim_Mod_SubNS'           ,'T_StLim_Mod_SubNS'      ,...
                                                               'K_StLim_FP2_UnsFold'         ,'T_StLim_FP2_UnsFold'    ,...
                                                               'K_StLim_Mod_SuperNS_Up'      ,'T_StLim_Mod_SuperNS_Up' },...
                                                                 {par.Z   ,par.H,...
                                                                  KStQ0_1 ,TStQ0_1,...
                                                                  KStQ0_3 ,TStQ0_3,...
                                                                  KStQ0_4 ,TStQ0_4,...
                                                                  KStMod  ,TStMod
                                                                  });
%% Visualizing the bifurcations for H=-0.2,Q=0
par  = getKTz2TanhParamStruct(linspace(0.02,1,3000), 0.2, 0, 0, 0, -0.2, 0);
fp7  = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],false);
[~,~,ax]=plotFPStruct([],fp7,[],true,true);
text(ax,ax.XLim(2),ax.YLim(2),sprintf('T=%g',par.T),'HorizontalAlignment','right','VerticalAlignment','top');

% checking limit cycles
K_probe = linspace(0.3,0.7,15);
x=arrayfun(@(K)KTAtrator_mex(  getKTzParamStruct_for_KTAtrator(setfield(par,'K',K))  ,[-0.1,-0.1],0,100,'KT2Tanh','',true,false),K_probe,'UniformOutput',false);
plot_stacked_attractors([], x, [], [], 20, [], [], [], arrayfun(@(K)sprintf('$K=%.4g$',K),K_probe,'UniformOutput',false),[],[],{'Color','k','HorizontalAlignment','right'})
title(sprintf('V(t); T=%g',par.T));

par  = getKTz2TanhParamStruct(linspace(0.02,1,3000), 0.3314, 0, 0, 0, -0.2, 0);
fp8  = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],false);
[~,~,ax]=plotFPStruct([],fp8,[],true,true);
text(ax,ax.XLim(2),ax.YLim(2),sprintf('T=%g',par.T),'HorizontalAlignment','right','VerticalAlignment','top');

% checking limit cycles
K_probe = linspace(0.35,0.55,15);
x=arrayfun(@(K)KTAtrator_mex(  getKTzParamStruct_for_KTAtrator(setfield(par,'K',K))  ,[-0.1,-0.1],0,100,'KT2Tanh','',true,false),K_probe,'UniformOutput',false);
plot_stacked_attractors([], x, [], [], 20, [], [], [], arrayfun(@(K)sprintf('$K=%.4g$',K),K_probe,'UniformOutput',false),[],[],{'Color','k','HorizontalAlignment','right'})
title(sprintf('V(t); T=%g',par.T));
                                   
par  = getKTz2TanhParamStruct(linspace(0.02,1,3000), 0.5, 0, 0, 0, -0.2, 0);
fp9  = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],false);
[~,~,ax]=plotFPStruct([],fp9,[],true,true);
text(ax,ax.XLim(2),ax.YLim(2),sprintf('T=%g',par.T),'HorizontalAlignment','right','VerticalAlignment','top');

% checking limit cycles
K_probe = linspace(0.2,0.5,15);
x=arrayfun(@(K)KTAtrator_mex(  getKTzParamStruct_for_KTAtrator(setfield(par,'K',K))  ,[-0.1,-0.1],0,100,'KT2Tanh','',true,false),K_probe,'UniformOutput',false);
plot_stacked_attractors([], x, [], [], 20, [], [], [], arrayfun(@(K)sprintf('$K=%.4g$',K),K_probe,'UniformOutput',false),[],[],{'Color','k','HorizontalAlignment','right'})
title(sprintf('V(t); T=%g',par.T));

%% T vs Q=Z stability limit diagram for H=-0.2
par              = getKTz2TanhParamStruct(0.6,linspace(0.02,1,300), 0, 0,  0, -0.2, 0);
[KSt,TSt,QSt]=calc_StabLim_KT2Tanh_QTK(par.H,par.K,par.T,false);
% Z is the external field Q for KT2Tanh
par              = getKTz2TanhParamStruct(0.6,linspace(0.02,1,300), 0, 0,  0, -0.2, linspace(-0.7,0.7,300));
[TStMod,QStMod]  = calc_KTz_StabLim_FP_iter(par,'T',par.T,'Z',par.Z,'KT2Tanh',1,30000,40000,50,1e-6);

% isolating curves
% lower fold (ev: 1,>1): unstable-saddle collision
[QSt1,TSt1]   = find_curve(matCell2Mat(QSt(:)),TSt,[-0.73914,0.02]     ,[-0.7310947,0.02327759]     ,[],10,1,1e-5,20,10);
% lower stable FP (ev: 1,0) "degenerate"-fold (Lambda1=1; Lambda2=0; real): stable-saddle collision (and beginning of limit cycle for large T)
[QSt2,TSt2]   = find_curve(matCell2Mat(QSt(:)),TSt,[-0.3112504,0.53130],[-0.31028645,0.52802675585] ,[],10,1,1e-5,20,10);
% upper stable FP (ev: 1,0) "degenerate"-fold (Lambda1=1; Lambda2=0; real): stable-saddle collision (and beginning of limit cycle for large T)
[QSt3,TSt3]   = find_curve(matCell2Mat(QSt(:)),TSt,[-0.3370670,0.02]   ,[-0.32852958887,0.0232776]  ,[],10,1,1e-5,20,10);
% lower fold (ev: 1,>1): unstable-saddle collision
[QSt4,TSt4]   = find_curve(matCell2Mat(QSt(:)),TSt,[0.347271,0.02]     ,[-0.3285296,0.0232776]      ,[],60,1,1e-5,20,10);

TStMod = matCell2Mat(TStMod');
TStMod1 = TStMod(:,1);
TStMod2 = TStMod(:,2);


figure;axes;hold on;%plot(matCell2Mat(QSt(:)),TSt,'.');xlabel('Q');ylabel('T');hold on;
plot(QSt1,TSt1,'-r');
plot(QSt2,TSt2,'-b');
plot(QSt3,TSt3,'-m');
plot(QSt4,TSt4,'-g');
plot(QStMod,TStMod1,'-y');
plot(QStMod,TStMod2,'-c');
xlabel('Q');ylabel('T');



write_txt_for_Mathematica('KT2Tanh_stlim_TvsQ_H-0.2_K0.6.txt',{'K'                                  ,'H',...
                                                               'T_StLim_FP1_Low_Fold_UnsSad'        ,'Q_StLim_FP1_Low_Fold_UnsSad' ,...
                                                               'T_StLim_FP2_Low_DegeFold_StableSad' ,'Q_StLim_FP2_Low_DegeFold_StableSad' ,...
                                                               'T_StLim_FP3_Up_DegeFold_StableSad'  ,'Q_StLim_FP3_Up_DegeFold_StableSad' ,...
                                                               'T_StLim_FP4_Up_Fold_UnsSad'         ,'Q_StLim_FP4_Up_Fold_UnsSad' ,...
                                                               'T_StLim_Mod1_Low_SubNS'             ,'Q_StLim_Mod1_Low_SubNS',...
                                                               'T_StLim_Mod2_Up_SuperNS'            ,'Q_StLim_Mod2_Up_SuperNS'},...
                                                                 {par.K  ,par.H,...
                                                                  TSt1   ,QSt1,...
                                                                  TSt2   ,QSt2,...
                                                                  TSt3   ,QSt3,...
                                                                  TSt4   ,QSt4,...
                                                                  TStMod1,QStMod,...
                                                                  TStMod2,QStMod
                                                                  });
                                                          
%% Visualizing the bifurcations for H=-0.2,K=0.6
par = getKTz2TanhParamStruct(0.6, 0.1, 0, 0,  0, -0.2, linspace(-0.7,0.4,3000));
fp1  = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],false);
fp1  = arrayfun(@(s)setfield(s,'parName','Q'),fp1);
[~,~,ax]=plotFPStruct([],fp1,[],true,true);
text(ax,ax.XLim(2),ax.YLim(2),sprintf('T=%g',par.T),'HorizontalAlignment','right','VerticalAlignment','top');


par = getKTz2TanhParamStruct(0.6, 0.3, 0, 0,  0, -0.2, linspace(-0.7,0.4,3000));
fp2  = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],false);
fp2  = arrayfun(@(s)setfield(s,'parName','Q'),fp2);
[~,~,ax]=plotFPStruct([],fp2,[],true,true);
text(ax,ax.XLim(1),ax.YLim(2),sprintf('T=%g',par.T),'HorizontalAlignment','left','VerticalAlignment','top');
% checking limit cycles
Q_probe = linspace(-0.5,0.2,10);
x=arrayfun(@(Q)KTAtrator_mex(  getKTzParamStruct_for_KTAtrator(setfield(par,'Z',Q))  ,[-0.1,-0.1],0,100,'KT2Tanh','',true,false),Q_probe,'UniformOutput',false);
plot_stacked_attractors([], x, [], [], 20, [], [], [], arrayfun(@(Q)sprintf('$Q=%.4g$',Q),Q_probe,'UniformOutput',false),[],[],{'Color','k','HorizontalAlignment','right'})
title(sprintf('V(t); T=%g',par.T));


par = getKTz2TanhParamStruct(0.6, 0.42, 0, 0,  0, -0.2, linspace(-0.5,0.3,4000));
fp3  = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],false);
fp3  = arrayfun(@(s)setfield(s,'parName','Q'),fp3);
[~,~,ax]=plotFPStruct([],fp3,[],true,true);
text(ax,ax.XLim(1),ax.YLim(2),sprintf('T=%g',par.T),'HorizontalAlignment','left','VerticalAlignment','top');
% checking limit cycles
Q_probe = linspace(-0.45,0.25,20);
x=arrayfun(@(Q)KTAtrator_mex(  getKTzParamStruct_for_KTAtrator(setfield(par,'Z',Q))  ,[-0.1,-0.1],0,100,'KT2Tanh','',true,false),Q_probe,'UniformOutput',false);
plot_stacked_attractors([], x, [], [], 20, [], [], [], arrayfun(@(Q)sprintf('$Q=%.4g$',Q),Q_probe,'UniformOutput',false),[],[],{'Color','k','HorizontalAlignment','right'});

par = getKTz2TanhParamStruct(0.6, 0.65, 0, 0,  0, -0.2, linspace(-0.7,0.4,3000));
fp4  = getFixedPoints(par,@fixedPointKT2Tanh,@eigenvalJacobKT2Tanh,[],[],[],[],[],false);
fp4  = arrayfun(@(s)setfield(s,'parName','Q'),fp4);
[~,~,ax]=plotFPStruct([],fp4,[],true,true);
text(ax,ax.XLim(1),ax.YLim(2),sprintf('T=%g',par.T),'HorizontalAlignment','left','VerticalAlignment','top');
% checking limit cycles
Q_probe = linspace(-0.3,0.15,10);
x=arrayfun(@(Q)KTAtrator_mex(  getKTzParamStruct_for_KTAtrator(setfield(par,'Z',Q))  ,[-0.1,-0.1],0,100,'KT2Tanh','',true,false),Q_probe,'UniformOutput',false);
plot_stacked_attractors([], x, [], [], 20, [], [], [], arrayfun(@(Q)sprintf('$Q=%.4g$',Q),Q_probe,'UniformOutput',false),[],[],{'Color','k','HorizontalAlignment','right'})



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
