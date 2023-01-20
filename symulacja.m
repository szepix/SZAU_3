clear all;
close all;
% w10(1,1)=-3.1831115022e-003; w1(1,1)=5.2291962209e-003; w1(1,2)=-1.4244422471e-002; w1(1,3)=1.6896823771e-001; w1(1,4)=1.8709170608e-001; 
% w10(2,1)=-4.2381264790e-001; w1(2,1)=3.2632157240e-002; w1(2,2)=2.1629090167e-001; w1(2,3)=3.9366067485e-001; w1(2,4)=4.0456545955e-002; 
% w10(3,1)=-1.6168204808e-002; w1(3,1)=4.8995860100e-002; w1(3,2)=1.0436267497e-001; w1(3,3)=3.0644456226e-001; w1(3,4)=4.1497954731e-001; 
% w10(4,1)=-4.4781519908e-001; w1(4,1)=-2.8476945483e-002; w1(4,2)=-1.6257054093e-001; w1(4,3)=-5.7177596651e-001; w1(4,4)=3.1248618260e-001; 
% w10(5,1)=-9.0245806472e-002; w1(5,1)=2.1562714448e-001; w1(5,2)=3.0672852957e-001; w1(5,3)=5.1548246549e-001; w1(5,4)=3.2852774822e-001; 
% w10(6,1)=-5.0497556426e-001; w1(6,1)=-4.6321698592e-002; w1(6,2)=-1.9661878624e-001; w1(6,3)=5.5530329039e-001; w1(6,4)=-2.5027786866e-001; 
% w10(7,1)=-2.5155284967e-001; w1(7,1)=3.6151028227e-003; w1(7,2)=9.1483282077e-002; w1(7,3)=-1.9221990750e-001; w1(7,4)=-1.2701636674e-001; 
% w10(8,1)=1.2500912218e-001; w1(8,1)=-1.1844385215e+000; w1(8,2)=-4.0666990538e-001; w1(8,3)=-1.1499389270e-001; w1(8,4)=1.6724159717e-001; 
% w10(9,1)=4.5965872106e-001; w1(9,1)=-6.3820960981e-001; w1(9,2)=-4.3976008211e-001; w1(9,3)=-2.4726624260e-001; w1(9,4)=-3.5147521298e-001; 
% w10(10,1)=1.4621967641e-001; w1(10,1)=1.5471799321e-003; w1(10,2)=3.0711606136e-003; w1(10,3)=3.1480804312e-001; w1(10,4)=-7.1794468618e-002; 
% w20=-7.7757547110e-002; w2(1)=1.6447536959e-001; w2(2)=6.4282820226e-001; w2(3)=-3.5945510289e-001; w2(4)=-8.6205069640e-001; w2(5)=1.1911357875e-001; w2(6)=8.6492689904e-001; w2(7)=-6.7941582573e-001; w2(8)=-7.1168975761e-002; w2(9)=1.0891019985e-001; w2(10)=1.2118790291e+000; 
x = load("x.mat");
x= x.x;
% x = [70.3139495312638	0.100000000000000	0.100000000000000	-769.228937646048	430.913790289524	-642.215194252002	503.237594439782	49.5754491711637	977.931265496537	-586.970123322851	1236.81815888216	-1590.49088142381	-1716.76628901576	-1044.12947971252	-1058.29207215615	1492.92741738870	-2740.36423140963	-1191.58299885098	-1478.30531000390	-1193.92732968092	1215.95894391160	-1089.61876031776	1609.29056351894	1319.03917156144	-165.716150482639	270.690338893931	1330.62152843574	5266.96607872161	-4812.49567039425	1082.38422968490	961.319077828777	144.004989016719	-647.561274701213	264.411852421964	635.595380367715	527.698573727442	-1017.00428200683	-1147.56680470009	1474.99328812330	436.812953288202	-1902.35353323122	82.7744389215420	-184.771121221567	273.191971208493	-599.062195596770	-541.929915591159	255.749950457595	584.830182016463	-1273.70181124886	-936.968853564161	-788.701166694112	926.728643652515	279.355936117110	-1570.38608499092	534.140087718130	1708.35918898135	74.3550409824820	-247.498549982473	-1960.59770233561	1387.52508452521	275.152178946009]
counter = 1;
for i=1:10
    w10(i,1) = x(counter);
    counter = counter + 1;
end
for i=1:10
    for j=1:4
        w1(i,j) = x(counter);
        counter = counter + 1;
    end
end
for i=1:10
    w2(i) = x(counter);
    counter = counter + 1;
end
w20 = x(counter);

% model_10_1

nazwa = 'test'
values = load('dane_wer.mat');
y_wer = values.y;
x_wer = values.u;
values = load('dane_ucz.mat');
y_ucz = values.y;
x_ucz = values.u;
ymod_wer = zeros(1, length(y_wer));
ymod_ucz = zeros(1, length(y_wer));
arx = 0;
oe = 1;
if oe
for k = 5:length(y_wer)
    x = [x_wer(k-3);x_wer(k-4);ymod_wer(k-1);ymod_wer(k-2)];
    ymod_wer(k) = w2*tanh(w1*x+w10)+w20;
end
plot(ymod_wer)
title("Dane weryfikujace OE")
hold on
plot(y_wer)
hold off
legend("Wyjscie modelu", "Wyjscie obiektu", "Location","northoutside", "Orientation","horizontal");
exportgraphics(gca, "dane_weryfikujace_" + nazwa + "_symulacja.pdf")
figure 
plot(ymod_wer, y_wer, '.')
title("Relacja wyjscia modelu z danymi weryfikujacymi")
exportgraphics(gca, "relacja_modelu_" + nazwa +  "_weryfikujace.pdf")
error_wer = norm(y_wer - ymod_wer)^2

figure
for k = 5:length(y_ucz)
    x = [x_ucz(k-3);x_ucz(k-4);ymod_ucz(k-1);ymod_ucz(k-2)];
    ymod_ucz(k) = w2*tanh(w1*x+w10)+w20;
end
plot(ymod_ucz)
title("Dane uczace OE")
hold on
plot(y_ucz)
error_ucz = norm(y_ucz - ymod_ucz)^2
hold off
legend("Wyjscie modelu", "Wyjscie obiektu", "Location","northoutside", "Orientation","horizontal");
exportgraphics(gca, "dane_uczace_" + nazwa + ".pdf")
figure

plot(ymod_ucz, y_ucz, '.')
title("Relacja wyjscia modelu z danymi uczacymi")
exportgraphics(gca, "relacja_modelu_" + nazwa +"_uczace.pdf")

end
if arx
y = zeros(1, length(y_wer));
for k = 5:length(y_wer)
    x = [x_wer(k-3);x_wer(k-4);y_wer(k-1);y_wer(k-2)];
    ymod_wer(k) = w2*tanh(w1*x+w10)+w20;
end
figure
plot(ymod_wer)
title("Dane weryfikujace ARX")
hold on
plot(y_wer)
hold off
legend("Wyjscie modelu", "Wyjscie obiektu", "Location","northoutside", "Orientation","horizontal");
exportgraphics(gca, "dane_weryfikujace_" + nazwa + "_symulacja.pdf")
figure 
plot(ymod_wer, y_wer, '.')
title("Relacja wyjscia modelu z danymi weryfikujacymi")
exportgraphics(gca, "relacja_modelu_" + nazwa +  "_weryfikujace.pdf")
error_wer = norm(y_wer - ymod_wer)^2

figure
for k = 5:length(y_ucz)
    x = [x_ucz(k-3);x_ucz(k-4);y_ucz(k-1);y_ucz(k-2)];
    ymod_ucz(k) = w2*tanh(w1*x+w10)+w20;
end
plot(ymod_ucz)
title("Dane uczace ARX")
hold on
plot(y_ucz)
hold off
legend("Wyjscie modelu", "Wyjscie obiektu", "Location","northoutside", "Orientation","horizontal");
exportgraphics(gca, "dane_uczace_" + nazwa + ".pdf")
figure

plot(ymod_ucz, y_ucz, '.')
title("Relacja wyjscia modelu z danymi uczacymi")
exportgraphics(gca, "relacja_modelu_" + nazwa +"_uczace.pdf")
error_ucz = norm(y_ucz - ymod_ucz)^2

end