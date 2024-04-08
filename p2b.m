clear; close all; clc


while true

    k = input('Introduza o número do sinal a visualizar (0 a 3)\n(para sair, insira qualquer outro número): ');
    
    switch k
        case 0
            syms t
            tn = linspace(-0.004, 0.004, 1000)+eps;
            tn1 = linspace(-0.013,0.005,1000)+eps;
            tn2 = linspace(-0.003,0.003,1000)+eps;
            
            % xk 
            x0t = 10^3*(heaviside(t+0.002) - heaviside(t-0.002));
            x0tn = double(subs(x0t,t,tn));
            subplot(3,2,1), plot(tn,x0tn, 'LineWidth', 2), title('x_0(t)'), xlabel('t(s)'), grid on;
            axis([min(tn) max(tn) min(x0tn)*1.1 max(x0tn)*1.1])
            
            % zk
            
            a = -(k+1)/4;
            b = ((-1)^k)*(4*a*10^-3);
            z0t = simplify(subs(x0t,t,a*t+b));
            z0tn = double(subs(z0t,t,tn1));
            subplot(3,2,2), plot(tn1,z0tn, 'LineWidth', 2), title('z_0(t)'), xlabel('t(s)'), grid on;
            axis([min(tn1) max(tn1) min(z0tn)*1.1 max(z0tn)*1.1])
            
            % xkpt
            x0mt = subs(x0t,t,-t);
            x0pt = (x0t + x0mt)/2;
            x0ptn = double(subs(x0pt,t,tn2));
            subplot(3,2,3), plot(tn2,x0ptn, 'LineWidth', 2), title('x_0P(t)'), xlabel('t(s)'), grid on;
            axis([min(tn2) max(tn2) min(x0ptn)*1.1 max(x0ptn)*1.1])
            
            % xkit
            x0it = (x0t - x0mt)/2;
            x0itn = double(subs(x0it,t,tn2));
            subplot(3,2,4), plot(tn2,x0itn, 'LineWidth', 2), title('x_0I(t)'), xlabel('t(s)'), grid on;
            axis([min(tn2) max(tn2) -1000*1.1 1000*1.1])
            
            % derivada
            u0t = diff(x0t);
            u0tn = double(subs(u0t,t,tn));
            subplot(3,2,5), plot(tn,u0tn, 'LineWidth', 2), title('u_0(t)'), xlabel('t(s)'), grid on;
            hold on;
            stem(-0.002,1000,'^b', 'filled', 'LineWidth', 2)
            stem(0.002,-1000,'vb','filled', 'LineWidth', 2)
            axis([min(tn) max(tn) -1000*1.1 1000*1.1])
            
            % primitiva
            v0t = int(x0t);
            v0tn = double(subs(v0t,t,tn));
            subplot(3,2,6), plot(tn,v0tn, 'LineWidth', 2), title('v_0(t)'), xlabel('t(s)'), grid on;
            axis([min(tn) max(tn) min(v0tn)*1.1 max(v0tn)*1.1])
        
        
        case 1
            
            
        case 2
            
            
        case 3
        
        otherwise
            break
        
    end
end
