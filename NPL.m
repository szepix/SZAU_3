function E = NPL(nastawy)
global N Nu lambda w1 w10 w2 w20 yz y u du d k K b a delta na nb tau
model_10_1
tau = 3;
nb = 4;
na = 2;
delta = 1e-5;
g1 = @(u)((exp(4.125*u)-1)/(exp(4.125*u)+1));
g2 = @(x) (1 - exp(-1.2*x));
alpha_1 = -1.422574;
alpha_2 = 0.466776;
beta_1 = 0.017421;
beta_2 = 0.013521;

N = round(nastawy(1));
Nu = round(nastawy(2));
lambda = nastawy(3);

umin = -1;
umax = 1;
n = 500;
n0 = 10;

x1 = zeros(n,1);
x2 = zeros(n,1);
u = zeros(n,1);
y = zeros(n,1);
yz = zeros(n,1);
z = [0.5 -1.1 0.25 -0.75 0];
for i=1:length(z)
    yz((i-1)*100+10:end,1)=z(i);
end
e = zeros(n,1);

for k=n0:n
    x1(k) = -alpha_1*x1(k-1)+x2(k-1)+beta_1*g1(u(k-3));
    x2(k) = -alpha_2*x1(k-1)+beta_2*g1(u(k-3));
    y(k)= g2(x1(k));
    wesn = [u(k-3) u(k-4) y(k-1) y(k-2)]';
    ym(k) = w20 + w2*tanh(w10+w1*wesn);
    d = y(k)-ym(k);
    funregnpl();
    du(k:k+Nu-1) = K*(yz(k)*ones(N,1)-y(k+1:k+N));
    u(k) = u(k-1) + du(k);
    u(k) = min(max(u(k),umin), umax);
end
y = y(1:n);
% f=figure;
E = norm(yz-y)^2;
% subplot(2,1,1)
% plot(u)
% title("Regulator NPL")
% legend(["Sterowanie"])
% 
% subplot(2,1,2)
% plot(y)
% hold on
% plot(yz)
% title("E= "+string(E))
% legend(["Wyjscie obiektu", "Wartosc zadana"], "Location", "best")

% exportgraphics(f, "NPL_N_30N_u_30lambda_1.pdf")
