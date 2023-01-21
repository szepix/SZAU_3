[x,y]=meshgrid(-10:.01:10,-10:.01:10);
f=-abs(sin(x).*cos(y).*exp(abs(1-sqrt(x.^2+y.^2)/pi)));
mesh(x,y,f)
exportgraphics(gca, "Holder.pdf")