clearvars
close all

addpath func

% suppose z is the FP manifold defined on x,y
z = triu(ones(50,60));
z(z==0)=NaN;
z=z-fliplr(z);
z=[z,z,z];
z=[z;flipud(z)];

% the range of parameters
xRange = linspace(-2,2,size(z,2));
yRange = linspace(0,5,size(z,1));

% determining the stability limit curves from the FP manifold
[lca,rca] = calcStLimitCurveFromManifold(xRange,yRange,z);

% plotting the FP manifold
plotManifoldXY([],xRange,yRange,z);
hold(gca,'on')

% plotting the left st lim curves in red
for i = 1:numel(lca)
    plot(lca(i).x,lca(i).y,'-r','LineWidth',2);
end

% plotting the right st lim curves in blue
for i = 1:numel(rca)
    plot(rca(i).x,rca(i).y,'-b','LineWidth',2);
end