clear; close all; clc

% Definir variáveis
syms t

% Definir sinais
x0t = 10^3*(heaviside(t+0.002) - heaviside(t-0.002));

x1t = (heaviside(t + 0.001) - heaviside(t - 0.001)) * (5.0e5*t + 500) +...
      (heaviside(t - 0.001) - heaviside(t - 0.003)) * (-5.0e5*t + 1500);

x2t = x0t*sign(t+1e-3);

x3t = (heaviside(t+0.003) - heaviside(t + 0.001)) .* (-5.0e5*t - 1500) +...
      (-500 *(heaviside(t + 0.001) - heaviside(t - 0.001))) .* sign(t) +...
      (heaviside(t - 0.001) - heaviside(t - 0.003)) .* (-5.0e5*t + 1500);


% Calcular sinais resultantes do produto e respetiva integral
i00 = double(int(x0t*x0t,t,-2e-3,2e-3));
i01 = double(int(x0t*x1t,t,-2e-3, 3e-3)); % CONFIRMAR COM TEÓRICO!!!
i02 = double(int(x0t*x2t,t,-2e-3,2e-3));
i03 = double(int(x0t*x3t,t,-3e-3,3e-3));

i10 = i01;
i11 = double(int(x1t*x1t,t,-1e-3,3e-3)); % CONFIRMAR COM TEÓRICO!!!
i12 = double(int(x1t*x2t,t,-2e-3,3e-3)); % CONFIRMAR COM TEÓRICO!!!
i13 = double(int(x1t*x3t,t,-3e-3,3e-3));

i20 = i02;
i21 = i12;
i22 = double(int(x2t*x2t,t,-2e-3,2e-3));
i23 = double(int(x2t*x3t,t,-3e-3,3e-3)); % CONFIRMAR COM TEÓRICO!!!

i30 = i03;
i31 = i13;
i32 = i23;
i33 = double(int(x3t*x3t,t,-3e-3,3e-3)); % CONFIRMAR COM TEÓRICO!!!


% Criar tabela prod. internos e energias
LabelLinhas = {'x_0(t)';'x_1(t)';'x_2(t)';'x_3(t)'}

x0t = [i00;i01;i02;i03]
x1t = [i10;i11;i12;i13]
x2t = [i20;i21;i22;i23]
x3t = [i30;i31;i32;i33]

% Calcular energias
E0 = i00;
E1 = i11;
E2 = i22;
E3 = i33;

Energia = [E0;E1;E2;E3];

T = table(LabelLinhas, x0t, x1t, x2t, x3t, Energia)

% Indicar sinais ortogonais entre si
for i = 1 : 4
    if x0t(i) == 0
        txt = sprintf("Os sinais x_0(t) e x_%d(t) são ortogonais.",i-1);
        disp(txt)
    end
    
end

for i = 1 : 4
    if x1t(i) == 0
        txt = sprintf("Os sinais x_1(t) e x_%d(t) são ortogonais.",i-1);
        disp(txt)
    end
    
end

for i = 1 : 4
    if x2t(i) == 0
        txt = sprintf("Os sinais x_2(t) e x_%d(t) são ortogonais.",i-1);
        disp(txt)
    end
    
end

for i = 1 : 4
    if x3t(i) == 0
        txt = sprintf("Os sinais x_3(t) e x_%d(t) são ortogonais.",i-1);
        disp(txt)
    end
    
end
