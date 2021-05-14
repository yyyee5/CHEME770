%% CHEME 7770 HW6 Problem 3A
% Solve for critical compressibility coeff for glycocalyx
clear
% Given parameters from Table 1
N2t = 1e5; % 1/cell
N1t = 0; %1e5; % 1/cell
Amax = 1e-6; % cm2
kappa = 0.1; % dyn/cm [=] g/s2
tau = 1e-6; % cm
T = 310.15; % K
K_L = 1e-8; % cm2
kb = 1.38e-16; % cm2 g / s2 K
L = 2e-6; % cm
A1 = 2e-6; % cm2
A2 = 2e-6; % cm2

syms S

% eqn = S * 2e-6 * 2e-6 / 1.38e-16 / 310.15 / 1e-8 == (1e-5 - S * 1e-6 / 1.38e-16 / 310.15)^2;
eqn = S*A1*A2/kb/T/K_L == (N2t - S*Amax/kb/T)*(N1t - S*Amax/kb/T);

S_ans = solve(eqn, S);

S_double = double(S_ans)

gamma = S_double * L / exp(-L/tau)