u = linspace(0,10);
v = linspace(0,10);

alpha = 10;
n1 = 1;
n2 = 2;

nullcline1 = alpha ./ (1 + v.^n1); % = u = f
nullcline2 = alpha ./ (1 + u.^n1); % = v = g

figure(1)
plot(nullcline1, v)
hold on
plot(u, nullcline2)
xlabel('u')
ylabel('v')
title('n = 1')
legend('f(u,v) = 0', 'g(u,v) = 0')
hold off

figure(2)
nullcline3 = alpha ./ (1 + v.^n2); % = u = f
nullcline4 = alpha ./ (1 + u.^n2); % = v = g
plot(nullcline3, v)
hold on
plot(u, nullcline4)
xlabel('u')
ylabel('v')
title('n = 2')
legend('f(u,v) = 0', 'g(u,v) = 0')
hold off