%% CHEME 7770 HW4 Problem 1b, plot responses
kD = linspace(0, 39); % Max input chosen bc higher values causes y array to
% contain negative values ( y should be betweenn 0 and 1 bc normalized)
k = 10; % Change value to plot for both k=0.1 and k=10

% Plot thetaB vs 1/kD
thetaB = 1 ./ (kD + 1);
figure(1)
plot(1./kD, thetaB)
xlabel('1/\kappa_D')
ylabel('\theta_B')
title('\theta_B vs. 1/\kappa_D with k = 10')
thetaB(2)

% Plot x* vs 1/kD
xsoln = zeros(100, 2); % Store numeric values of x
syms x y
figure(2)
for i = 1:100
    eqn1 = 5/(kD(i)+1) == x/(1-x)*(k+1-x)/(k-x);
    solx = solve(eqn1,x);
    xsoln(i, 1:2) = vpa(solx);
end

plot(1./kD, xsoln(1:end, 1)) 
% Used col 1 of x bc solutions should be less than 1 due to normalizing
xlabel('1/\kappa_D')
ylabel('x*')
title('x* vs. 1/\kappa_D with k = 10')


% Plot y* vs 1/kD
ysoln = zeros(100, 2); % Store numeric values of y
figure(3)
for j = 1:100
    eqn2 = 50 * (1-xsoln(j,1)) / (kD(j)+1) * (k-xsoln(j,1)) / (k+1-xsoln(j,1)) == ...
        y / (1-y) * (k+1-y) / (k+y);
    soly = solve(eqn2,y);
    ysoln(j, 1:2) = vpa(soly);
end

plot(1./kD, ysoln(1:end, 2))
% For k = 0.1, used col 1 bc col 2 is greater than 1
% For k = 10, used col 2 bc col 1 has negative values
xlabel('1/\kappa_D')
ylabel('y*')
title('y* vs. 1/\kappa_D with k = 10')

% Plot all outputs in one figure
figure(4)
plot(1./kD, thetaB)
hold on
plot(1./kD, xsoln(1:end, 1)) 
plot(1./kD, ysoln(1:end, 2))
xlabel('1/\kappa_D')
ylabel('Output')
legend('\theta_B', 'x*', 'y*')
title('k = 10')
hold off