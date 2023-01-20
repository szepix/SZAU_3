options = optimoptions('particleswarm','SwarmSize',100, "MaxIterations", 100, "Display", 'iter', "MaxStallIterations", 10);
x = particleswarm(@NPL,3, [0.1 0.1 0.1], [100 100 100], options);
close all
NPL(x)