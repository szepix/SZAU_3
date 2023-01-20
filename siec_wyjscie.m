function [y] = siec_wyjscie(x)
    global w10 w20 w1 w2;
    y = w2*tanh(w1*x+w10)+w20;
end