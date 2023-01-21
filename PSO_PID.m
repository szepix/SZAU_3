options = optimoptions('particleswarm','SwarmSize',10, "MaxIterations", 100, "Display", 'iter', "MaxStallIterations", 100, "UseParallel",true);
x = particleswarm(@PID,3, [0.01 0.01 0.01], [100 1000 1000], options);
close all

