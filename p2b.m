clear; close all; clc

while true

    k = input('Introduza o número do sinal a visualizar (0 a 3)\n(para sair, insira qualquer outro número): ');
    
    switch k
        case 0
            syms t
            tn = linspace(-4e-3, 4e-3, 1000)+eps;
            tn1 = linspace(-13e-3,5e-3,1000)+eps;
            tn2 = linspace(-3e-3,3e-3,1000)+eps;
            
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
            v0t = int(x0t,t,-inf,t);
            v0tn = double(subs(v0t,t,tn));
            subplot(3,2,6), plot(tn,v0tn, 'LineWidth', 2), title('v_0(t)'), xlabel('t(s)'), grid on;
            axis([min(tn) max(tn) min(v0tn)*1.1 max(v0tn)*1.1])
        
%--------------------------------------------------------------------------------------------------------------------------
        case 1
            syms t
            tn = linspace(-4e-3, 4e-3, 1000)+eps;
            tn1 = linspace(-3e-3,7e-3,1000)+eps;
            tn2 = linspace(-0.003,0.003,1000)+eps; % VERIFICAR
            
            % xk 
            x1t =(heaviside(t + 0.001) - heaviside(t - 0.001)) .* (5.0e5*t + 500) +...
            (heaviside(t - 0.001) - heaviside(t - 0.003)) .* (-5.0e5*t + 1500);
            x1tn = double(subs(x1t,t,tn));
            subplot(3,2,1), plot(tn,x1tn, 'LineWidth', 2), title('x_1(t)'), xlabel('t(s)'), grid on;
            axis([min(tn) max(tn) min(x1tn)*1.1 max(x1tn)*1.1])
            
            % zk
            
            a = -(k+1)/4;
            b = ((-1)^k)*(4*a*10^-3);
            z1t = simplify(subs(x1t,t,a*t+b));
            z1tn = double(subs(z1t,t,tn1));
            subplot(3,2,2), plot(tn1,z1tn, 'LineWidth', 2), title('z_1(t)'), xlabel('t(s)'), grid on;
            axis([min(tn1) max(tn1) min(z1tn)*1.1 max(z1tn)*1.1])
            
            % xkpt - VERIFICAR!!!
            x1mt = subs(x1t,t,-t);
            x1pt = (x1t + x1mt)/2;
            x1ptn = double(subs(x1pt,t,tn2));
            subplot(3,2,3), plot(tn2,x1ptn, 'LineWidth', 2), title('x_1P(t)'), xlabel('t(s)'), grid on;
            axis([min(tn2) max(tn2) min(x1ptn)*1.1 max(x1ptn)*1.1])
            
            % xkit - VERIFICAR!!!
            x1it = (x1t - x1mt)/2;
            x1itn = double(subs(x1it,t,tn2));
            subplot(3,2,4), plot(tn2,x1itn, 'LineWidth', 2), title('x_1I(t)'), xlabel('t(s)'), grid on;
            axis([min(tn2) max(tn2) -1000*1.1 1000*1.1])
            
            % derivada - VERIFICAR!!!
            u1t = diff(x1t);
            u1tn = double(subs(u1t,t,tn));
            subplot(3,2,5), plot(tn,u1tn, 'LineWidth', 2), title('u_1(t)'), xlabel('t(s)'), grid on;
            hold on;
            axis([min(tn) max(tn) -1000*1.1 1000*1.1])
            
            % primitiva
            v1t = int(x1t,t,-inf,t);
            v1tn = double(subs(v1t,t,tn));
            subplot(3,2,6), plot(tn,v1tn, 'LineWidth', 2), title('v_1(t)'), xlabel('t(s)'), grid on;
            axis([min(tn) max(tn) min(v1tn)*1.1 max(v1tn)*1.1])
            
            
        case 2
            syms t
            tn = linspace(-0.004, 0.004, 1000)+eps;
            tn1 = linspace(-8e-3,3e-3,1000)+eps;
            tn2 = linspace(-0.003,0.003,1000)+eps;
            
            % xk
            x0t = 10^3*(heaviside(t+0.002) - heaviside(t-0.002));
            x2t = x0t*sign(t+1e-3);
            x2tn = double(subs(x2t,t,tn));
            subplot(3,2,1), plot(tn,x2tn, 'LineWidth', 2), title('x_2(t)'), xlabel('t(s)'), grid on;
            axis([min(tn) max(tn) min(x2tn)*1.1 max(x2tn)*1.1])
            
            % zk
            
            a = -(k+1)/4;
            b = ((-1)^k)*(4*a*10^-3);
            z2t = simplify(subs(x2t,t,a*t+b));
            z2tn = double(subs(z2t,t,tn1));
            subplot(3,2,2), plot(tn1,z2tn, 'LineWidth', 2), title('z_2(t)'), xlabel('t(s)'), grid on;
            axis([min(tn1) max(tn1) min(z2tn)*1.1 max(z2tn)*1.1])
            
            % xkpt
            x2mt = subs(x2t,t,-t);
            x2pt = (x2t + x2mt)/2;
            x2ptn = double(subs(x2pt,t,tn2));
            subplot(3,2,3), plot(tn2,x2ptn, 'LineWidth', 2), title('x_2P(t)'), xlabel('t(s)'), grid on;
            axis([min(tn2) max(tn2) min(x2ptn)*1.1 max(x2ptn)*1.1])
            
            % xkit - VERIFICAR!!!
            x2it = (x2t - x2mt)/2;
            x2itn = double(subs(x2it,t,tn2));
            subplot(3,2,4), plot(tn2,x2itn, 'LineWidth', 2), title('x_2I(t)'), xlabel('t(s)'), grid on;
            axis([min(tn2) max(tn2) -1000*1.1 1000*1.1])
            
            % derivada - VERIFICAR!!!
            u2t = diff(x2t);
            u2tn = double(subs(u2t,t,tn));
            subplot(3,2,5), plot(tn,u2tn, 'LineWidth', 2), title('u_2(t)'), xlabel('t(s)'), grid on;
            hold on;
            stem(-2e-3,-1000,'vb','filled', 'LineWidth', 2)
            stem(-1e-3,1000,'^b','filled','LineWidth', 2)
            stem(2e-3,-1000,'vb','filled', 'LineWidth', 2)
            axis([min(tn) max(tn) -1000*1.1 1000*1.1])
            
            % primitiva
            v2t = int(x2t,t,-inf,t);
            v2tn = double(subs(v2t,t,tn));
            subplot(3,2,6), plot(tn,v2tn, 'LineWidth', 2), title('v_2(t)'), xlabel('t(s)'), grid on;
            axis([min(tn) max(tn) min(v2tn)*1.1 max(v2tn)*1.1])
            
            
        case 3
        
        otherwise
            break
        
    end
end
