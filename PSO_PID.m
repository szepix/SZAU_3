options = optimoptions('particleswarm','SwarmSize',1000, "MaxIterations", 1000, "Display", 'iter', "MaxStallIterations", 100);
x = particleswarm(@PID,3, [0.01 0.01 0.01], [100 100 100], options);
close all

PID(x)
% g1 = @(u)((exp(4.125*u)-1)/(exp(4.125*u)+1));
% g2 = @(x) (1 - exp(-1.2*x));
% alpha_1 = -1.422574;
% alpha_2 = 0.466776;
% beta_1 = 0.017421;
% beta_2 = 0.013521;
% 
% 
% Kp = x(1);
% Ti = x(2);
% Td = x(3);
% T = 1;
% 
% r0 = Kp*(1+T/2/Ti+Td/T);
% r1 = Kp*(T/2/Ti - 2*Td/T - 1);
% r2 = Kp*Td/T;
% 
% n = 500;
% n0 = 10;
% 
% x1 = zeros(n,1);
% x2 = zeros(n,1);
% u = zeros(n,1);
% y = zeros(n,1);
% yz = zeros(n,1);
% z = [0.5 -1.1 0.25 -0.75 0];
% for i=1:length(z)
%     yz((i-1)*100+10:end,1)=z(i);
% end
% e = zeros(n,1);
% 
% for k=n0:n
%     x1(k) = -alpha_1*x1(k-1)+x2(k-1)+beta_1*g1(u(k-3));
%     x2(k) = -alpha_2*x1(k-1)+beta_2*g1(u(k-3));
%     y(k)= g2(x1(k));
%     e(k) = yz(k)-y(k);
%     u(k) = r0*e(k) + r1*e(k-1) + r2*e(k-2) + u(k-1);
% end
% plot(y)
% hold on
% plot(yz)
% 
% E = norm(yz-y)^2