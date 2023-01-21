fun =@(x)-abs(sin(x(1)).*cos(x(2)).*exp(abs(1-sqrt(x(1).^2+x(2).^2)/pi)));
options = optimoptions('particleswarm','SwarmSize',100, "MaxIterations", 100)
x = particleswarm(fun,2, [-10 -10], [10 10], options);
[a,b]=meshgrid(-10:.01:10,-10:.01:10);
f=-abs(sin(a).*cos(b).*exp(abs(1-sqrt(a.^2+b.^2)/pi)));
mesh(a,b,f)
hold on
plot3(x(1),x(2), fun(x),'.','Color', "red", 'MarkerSize', 20)

exportgraphics(gca, "Holder4.pdf")