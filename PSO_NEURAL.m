options = optimoptions('particleswarm','SwarmSize',1000, "MaxIterations", 10000, "Display", 'iter', "MaxStallIterations", 1000);
a = linspace(-2,-2,61);
b = linspace(2,2,61);
x = particleswarm(@NEURAL,61, a, b, options);
x
