clear; close all; clc

syms t
tn = linspace(-0.004, 0.004, 1000) +eps;
tn_zkt = linspace(-0.02, 0.02, 1000) +eps;

while true

    k = input('Introduza o número do sinal a visualizar (0 a 3)\n(para sair, insira qualquer outro número): ');
    
    switch k
        case 0
            % xk 
            x0t = 10^3*(heaviside(t+0.002) - heaviside(t-0.002));
            x0tn = double(subs(x0t,t,tn));
            subplot(3,2,1), plot(tn,x0tn), xlim([-0.004, 0.004]), title('x_0(t)'), xlabel('t(s)'), grid on;
            %METER TÍTULOS NOS GRÁFICOS!!!
            
            % zk - CONFIRMAR
            a = -(k+1)/4;
            b = (-1)^k*(4*a*10^-1);
            z0t = subs(x0t,t,(a*t+b));
            %z0tn = double(subs(z0t,a*t+b,a*tn_zkt+b));
            %subplot(3,2,2), plot(a*tn_zkt+b,z0tn), title('z_0(t)'), xlabel('t(s)'), grid on;
            
            % xkpt
            x0mt = subs(x0t,t,-t);
            x0pt = (x0t + x0mt)/2;
            x0ptn = double(subs(x0pt,t,tn));
            subplot(3,2,3), plot(tn,x0ptn), xlim([-0.004, 0.004]), title('x_0_p(t)'), xlabel('t(s)'), grid on;
            
            % xkit
            x0it = (x0t - x0mt)/2;
            x0itn = double(subs(x0it,t,tn));
            subplot(3,2,4), plot(tn,x0itn), xlim([-0.004, 0.004]), title('x_0_i(t)'), xlabel('t(s)'), grid on;
            
            % derivada - CONFIRMAR!!!
            dx0t = diff(x0t);
            dx0tn = double(subs(dx0t,t,tn));
            subplot(3,2,5), plot(tn,dx0tn), xlim([-0.004, 0.004]), title('u_0(t)'), xlabel('t(s)'), grid on;
            
            % primitiva
            px0t = int(x0t);
            px0tn = double(subs(px0t,t,tn));
            subplot(3,2,6), plot(tn,px0tn), xlim([-0.004, 0.004]), title('v_0(t)'), xlabel('t(s)'), grid on;
        
        
        case 1
            
            
        case 2
            
            
        case 3
        
        otherwise
            break
        
    end
end
