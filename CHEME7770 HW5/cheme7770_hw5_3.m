%% CHEME 7770 HW5 Problem 3
clear
tspan1 = linspace(0, 50);
tspan2 = linspace(0, 150);
tspan3 = linspace(0, 500);
tspan4 = linspace(0,1050);


% E0 = [0.1/3 0.1/3 1/3 0 0 0 0];
% E0 = [-4.8805 -0.0886 0.4380 0.3092 -0.0469 0.7292 0.0378]; % l = 0.01
E0 = [0 5e-3 0.005 0 0 0 0];
% E0 = [-0.2409 3.4554e-4 0.0408 0.0695 0.0020 0.0899 0.0035]; % l = 0.1
[t,E] = ode45(@SolveODE2, tspan4, E0);


Activity = E(:,3) ./ E0(3);

plot(t, Activity)
xlabel("time (s)")
ylabel("Activity")