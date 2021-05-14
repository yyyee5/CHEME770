%% CHEME 7770: HW6 Q1C: Create phase portraits + nullclines
clear
figure(1)
hold on
tspan = 0:1:10;
u0 = 0:1:10;
v0 = 0:1:10;


for i = 1:11
    for j = 1:11
        R0 = [u0(i), v0(j)];
        [t,R] = ode45(@SolveODE, tspan, R0);
        
        for t = 1:9
            f = (R(t+1,1) - R(t,1));
            g = (R(t+1,2) - R(t,2));
            M = quiver(R(t,1), R(t,2), f, g, 'k');
            set(M, 'AutoScale', 'on', 'AutoScaleFactor', 0.3, 'MaxHeadSize', 2);
        end
    end
end

xlabel('u')
ylabel('v')
title('HW6 Problem 1C: n = 2')


% Plot nullclines
u = linspace(0,10);
v = linspace(0,10);

alpha = 10;
n = 2;

nullcline1 = alpha ./ (1 + v.^n); % = u = f
nullcline2 = alpha ./ (1 + u.^n); % = v = g
plot(nullcline1, v, 'LineWidth', 2, 'Color', 'b')
plot(u, nullcline2, 'LineWidth', 2,'Color', 'r')