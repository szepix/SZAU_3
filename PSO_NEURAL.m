options = optimoptions('particleswarm','SwarmSize',100, "MaxIterations", 1000, "Display", 'iter', "MaxStallIterations", 1000);
a = linspace(-1,-1,61);
b = linspace(1,1,61);
x = particleswarm(@NEURAL,61, a, b, options);
close all
