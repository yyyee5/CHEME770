%% CHEME7770 HW4 Problem 1c, use script to solve for Hill coefficients
clear
k1 = 0.1;
k2 = 10;
kD = linspace(0, 39); 

%% Solve for hill coeff for thetaB vs 1/kD
thetaB = 1 ./ (kD + 1);

thetaB_90 = 0.9 * (max(thetaB) - min(thetaB)) + min(thetaB); % 90% output
thetaB_10 = 0.1 * (max(thetaB) - min(thetaB)) + min(thetaB); % 10% output

% Solve for kD due to respective output percentage
kDthetaB90 = 1 / thetaB_90 - 1;
kDthetaB10 = 1 / thetaB_10 - 1;

% Solve for 1/kD
thetaB_input90 = 1 / kDthetaB90; % 90% input
thetaB_input10 = 1 / kDthetaB10; % 10% input

rho_thetaB = thetaB_input90 / thetaB_input10;

nH_thetaB = log10(81) / log10(rho_thetaB); % Hill coeff for thetaB

%% Solve for nH in x/y vs 1/kD using interpolation
xsoln1 = zeros(100, 2); % Store numeric values of x when k = 0.1
xsoln2 = zeros(100, 2); % Store numeric values of x when k = 10
ysoln1 = zeros(100, 2); % Store numeric values of y when k = 0.1
ysoln2 = zeros(100, 2); % Store numeric values of y when k = 10

syms x1 y1 x2 y2
for i = 1:100 % Solve for x at k=0.1 and k=10
    eqn1 = 5/(kD(i)+1) == x1/(1-x1)*(k1+1-x1)/(k1-x1);
    solx1 = solve(eqn1,x1);
    xsoln1(i, 1:2) = vpa(solx1);
    
    eqn2 = 5/(kD(i)+1) == x2/(1-x2)*(k2+1-x2)/(k2-x2);
    solx2 = solve(eqn2,x2);
    xsoln2(i, 1:2) = vpa(solx2);
end

for j = 1:100 % Solve for y at k=0.1 and k=10
    eqn3 = 50 * (1-xsoln1(j,1)) / (kD(j)+1) * (k1-xsoln1(j,1)) / ...
        (k1+1-xsoln1(j,1)) == y1 / (1-y1) * (k1+1-y1) / (k1+y1);
    soly1 = solve(eqn3,y1);
    ysoln1(j, 1:2) = vpa(soly1);
    
    eqn4 = 50 * (1-xsoln2(j,1)) / (kD(j)+1) * (k2-xsoln2(j,1)) / ...
        (k2+1-xsoln2(j,1)) == y2 / (1-y2) * (k2+1-y2) / (k2+y2);
    soly2 = solve(eqn4, y2);
    ysoln2(j, 1:2) = vpa(soly2);
end

% Solve for 90% and 10% output values
x90_k1 = 0.9 * (max(xsoln1(:,1)) - min(xsoln1(:,1))) + min(xsoln1(:,1));
x10_k1 = 0.1 * (max(xsoln1(:,1)) - min(xsoln1(:,1))) + min(xsoln1(:,1));
x90_k2 = 0.9 * (max(xsoln2(:,1)) - min(xsoln2(:,1))) + min(xsoln2(:,1));
x10_k2 = 0.1 * (max(xsoln2(:,1)) - min(xsoln2(:,1))) + min(xsoln2(:,1));

y90_k1 = 0.9 * (max(ysoln1(:,1)) - min(ysoln1(:,1))) + min(ysoln1(:,1));
y10_k1 = 0.1 * (max(ysoln1(:,1)) - min(ysoln1(:,1))) + min(ysoln1(:,1));
y90_k2 = 0.9 * (max(ysoln2(:,2)) - min(ysoln2(:,2))) + min(ysoln2(:,2));
y10_k2 = 0.1 * (max(ysoln2(:,2)) - min(ysoln2(:,2))) + min(ysoln2(:,2));

input = 1 ./ kD; % Input array

% Interpolate to find inputs at 90% and 10% output
x90_k1_input = interp1(xsoln1(:,1), input, x90_k1);
x10_k1_input = interp1(xsoln1(:,1), input, x10_k1);
x90_k2_input = interp1(xsoln2(:,1), input, x90_k2);
x10_k2_input = interp1(xsoln2(:,1), input, x10_k2);

y90_k1_kD = interp1(ysoln1(:,1), kD, y90_k1); 
% Solve for kD value first bc interpolating between 1/kD at kD=0 and
% 1/kD(2) gave Inf as answer
y90_k1_input = 1 / y90_k1_kD;
y10_k1_input = interp1(ysoln1(:,1), input, y10_k1);
y90_k2_input = interp1(ysoln2(:,2), input, y90_k2);
y10_k2_input = interp1(ysoln2(:,2), input, y10_k2);

% Solve for rho
rho_x1 = x90_k1_input / x10_k1_input;
rho_x2 = x90_k2_input / x10_k2_input;
rho_y1 = y90_k1_input / y10_k1_input;
rho_y2 = y90_k2_input / y10_k2_input;

% Solve for Hill coeff
nH_x1 = log10(81) / log10(rho_x1);
nH_x2 = log10(81) / log10(rho_x2);
nH_y1 = log10(81) / log10(rho_y1);
nH_y2 = log10(81) / log10(rho_y2);