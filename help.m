%EX12 - Enunciados Aulas TP

%zn - sinal numérico
%zt - sinal simbólico
%ztn - sinal numérico obtido a partir do simbólico

%% Sinal Numérico
%os limites do lispace são o tempo em que existe o sinal!
tn = linspace(-1,1.5,1000)+eps;
zn = 2*(heaviside(tn+0.5) - heaviside(tn)) + (2*tn-1) .* (heaviside(tn) - heaviside(tn-1));

figure(121)
plot(tn,zn,'r-','LineWidth',2);
grid on;
title('Sinal z(t)','FontSize',10), xlabel('t(s)');
axis([min(tn) max(tn) min(zn)*1.1 max(zn)*1.1]);


%% Sinal Simbólico
syms t
zt = 2*(heaviside(t+0.5) - heaviside(t)) + (2*t-1) * (heaviside(t) - heaviside(t-1));
ztn = double(subs(zt,t,tn));

figure(121)
hold on;
plot(tn,ztn,'k--','LineWidth',2);
legend('z_n','z_{tn}');
axis([min(tn) max(tn) min(ztn)*1.1 max(ztn)*1.1]);
hold off;


%% Cálculo e Representação de ZP(t) e ZI(t)
zpt = simplify((zt + subs(zt,t,-t))/2)
zit = simplify((zt - subs(zt,t,-t))/2)

tn1 = linspace(-1.5,1.5,1000)+eps;

zpn = double(subs(zpt,t,tn1));
zin = double(subs(zit,t,tn1));

figure(122)
subplot(3,2,1), plot(tn,ztn,'k-', 'LineWidth', 2)
grid on;
title('z(t)', 'FontSize', 12), xlabel('t(s)');
axis([min(tn) max(tn) min(ztn)*1.1 max(ztn)*1.1]);

subplot(3,2,3), plot(tn1,zpn,'r-', 'LineWidth', 2)
grid on;
title('z_P(t)', 'FontSize', 12), xlabel('t(s)');
axis([min(tn1) max(tn1) min(zpn)*1.1 max(zpn)*1.1]);

subplot(3,2,4), plot(tn1,zin,'r-', 'LineWidth', 2)
grid on;
title('z_I(t)', 'FontSize', 12), xlabel('t(s)');
axis([min(tn1) max(tn1) min(zin)*1.1 max(zin)*1.1]);


%% Cálculo e Representação de w(t)
wt = simplify(subs(zt,t,-0.5*(t-6)));

tn2 = linspace(3,8,1000)+eps;
wn = subs(wt,t,tn2);

subplot(3,2,2), plot(tn2,wn,'b-', 'LineWidth', 2)
grid on;
title('w(t)', 'FontSize', 12), xlabel('t(s)');


%% Cálculo e Representação de v1(t) e v2(t)
v1t = simplify(diff(zt,t));
v2t = simplify(int(zt,t,-inf,t));

v1tn = double(subs(v1t,t,tn));
v2tn = double(subs(v2t,t,tn));

figure(122)
subplot(3,2,5), plot(tn,v1tn,'m-', 'LineWidth', 2)
grid on;
title('v_1(t)', 'FontSize', 12), xlabel('t(s)');
hold on;
stem(-0.5,2,'^m','filled', 'LineWidth', 2)
stem([0 1],[-3 -1],'vm','filled', 'LineWidth', 2)
axis([min(tn) max(tn) -3*1.1 2*1.1]);

subplot(3,2,6), plot(tn,v2tn,'m-', 'LineWidth', 2)
grid on;
title('v_2(t)', 'FontSize', 12), xlabel('t(s)');
axis([min(tn) max(tn) min(v2tn)*1.1 max(v2tn)*1.1]);

