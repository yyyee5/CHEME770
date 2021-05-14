%% CHEME 7770 Problem 3B
% Plot Nb vs gamma and S vs gamma
clear
% Given parameters from Table 1
N2t = 1e5; % 1/cell
N1t = 1e5; % 1/cell
Amax = 1e-6; % cm2
kappa = 0.1; % dyn/cm [=] g/s2
tau = 2e-6; % cm
T = 310.15; % K
K_L = 1e-8; % cm2
kb = 1.38e-16; % cm2 g / s2 K
L = 2e-6; % cm
A1 = 2e-6; % cm2
A2 = 2e-6; % cm2

% gamma = linspace(1e-15, 2.53e-10);
gamma = linspace(1e-15, 0.6350e-7);

for i = 1:100
    syms S Nb Ac 
    K = K_L * exp(-1/2 * kappa * (S - L)^2 / kb / T);
    eqn1 = Nb / Ac == (N1t - Nb)/A1 * (N2t - Nb)/A2 * K;
    eqn2 = Nb / Ac == (gamma(i)/kb/T/S)*exp(-S/tau);
    eqn3 = Nb / Ac == gamma(i) * (S + tau) * exp(-S/tau) / kappa / tau / S^2 / (S-L);

    eqns = [eqn1, eqn2, eqn3];
    var = [S Nb Ac];
    S_sol = solve(eqns, var);
    
    S_double(:,i) = double(S_sol.S);
    Nb_double(:,i) = double(S_sol.Nb);
    Ac_double(:,i) = double(S_sol.Ac);
end

S_count = 0;
Nb_count = 0;
Ac_count = 0;
for j = 1:100
    if S_double(3, j) >= 0
        S_count = S_count + 1;
    end
    Nb_diff = N2t - Nb_double(3,j);
    if Nb_diff >= 0
        Nb_count = Nb_count + 1;
    end
    Ac_diff = Amax - Ac_double(3,j);
    if Ac_diff >= 0
        Ac_count = Ac_count + 1;
    end
end

S_count
Nb_count
Ac_count

figure(1)
plot(gamma, S_double(3, :))
xlabel('\gamma')
ylabel('S')

figure(2)
plot(gamma, Nb_double(3, :))
xlabel('\gamma')
ylabel('N_b')