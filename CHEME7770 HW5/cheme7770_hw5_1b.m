%% CHEME 7770: HW5 Q1B: Create phase portraits + nullclines
clear
figure(2)
hold on
tspan = 1:1:10;

D1 = 0:0.2:1;
D2 = 0:0.2:1;


for i = 1:6
    for j = 1:6
        D0 = [D1(i), D2(j)];
        [t,D] = ode45(@SolveODE, tspan, D0);
%         plot(D(:,1), D(:,2), 'k')
        for t = 1:9
            U = (D(t+1,1) - D(t,1));
            V = (D(t+1,2) - D(t,2));
            M = quiver(D(t,1), D(t,2), U, V, 'k');
            set(M, 'AutoScale', 'on', 'AutoScaleFactor', 0.3, 'MaxHeadSize', 2);
        end
    end
end

xlabel('D_1')
ylabel('D_2')
title('HW5 Problem 1B')
axis([0, 1, 0, 1])

% Plot nullclines
d1 = linspace(0,1);
d2 = linspace(0,1);
nullcline_D1 = 1 ./ (1 + 10.*(d2.^2 ./ (0.1 + d2.^2)).^2);
nullcline_D2 = 1 ./ (1 + 10.*(d1.^2 ./ (0.1 + d1.^2)).^2);
plot(nullcline_D1, d2, 'r')
plot(d1, nullcline_D2, 'b')