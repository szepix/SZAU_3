options = optimoptions('particleswarm','SwarmSize',100, "MaxIterations", 1000, "Display", 'iter', "MaxStallIterations", 100, "UseParallel",true);
x = particleswarm(@NPL,3, [0.1 0.1 0.1], [100 100 100], options);
x
% close all
% NPL(x)