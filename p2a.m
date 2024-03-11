% TRABALHO 1 - Sinais e Sistemas
% Problema 2 - a)
clear; close all; clc;

%%Criar pontos
tn = linspace(-0.004,0.004,1000);

%%x0t
x0t = 1000*(heaviside(tn + 0.002) - heaviside(tn - 0.002));
subplot(1,4,1),plot(tn,x0t), grid on, xlabel('t(s)'), title('x0t');

%%x1t
x1t = (heaviside(tn + 0.001) - heaviside(tn - 0.001)) .* (5.0e5*tn + 500) +...
    (heaviside(tn - 0.001) - heaviside(tn - 0.003)) .* (-5.0e5*tn + 1500);
subplot(1,4,2),plot(tn,x1t), grid on, xlabel('t(s)'), title('x1t');

%%x2t
x2t = x0t .* sign(tn+0.001); 
subplot(1,4,3), plot(tn,x2t), grid on, xlabel('t(s)'), title('x2t');

%%x3t
x3t = (heaviside(tn+0.003) - heaviside(tn + 0.001)) .* (-5.0e5*tn - 1500) +...
    (-500 *(heaviside(tn + 0.001) - heaviside(tn - 0.001))) .* sign(tn) +...
    (heaviside(tn - 0.001) - heaviside(tn - 0.003)) .* (-5.0e5*tn + 1500);
subplot(1,4,4), plot(tn, x3t), grid on, xlabel('t(s)'), title('x3t');

