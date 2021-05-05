function dEdt = SolveODE2(t, E)
%SolveODE2 Solve system of ODEs for HW5 problem 3
l = 10;
% rate constants
Vmax = 0.02;
alpha1neg = l / (1 + l);
alpha1pos = 1 / (1 + l);
a_bp = 0.1;
d_bp = 0.01;
k_bp = 1;
a_b = 1;
d_b = 1;
k_b = 0;
beta1 = 2.5*l / (1 + l);
k_1pos = 1;
k_1neg = 1;

eqn1 = -Vmax*E(2) + k_b*E(6)*E(4) + k_bp*E(7)*E(5);
eqn2 = Vmax*E(1) - alpha1pos*E(2) + alpha1neg*E(3) + beta1*(E(6)*E(4) + ...
    E(7)*E(5));
eqn3 = alpha1pos*E(2) - (alpha1neg + a_bp*E(5) + a_b*E(4))*E(3) + ...
    d_bp*E(7)*E(5) + d_b*E(6)*E(4);
eqn4 = k_b*E(6)*E(1) + beta1*E(6)*E(2) + (d_b*E(6) - a_b*E(4) - k_1pos*E(4))*E(3) ...
    + k_1neg*E(5);
eqn5 = k_bp*E(7)*E(1) + beta1*E(7)*E(2) + (d_bp*E(7) - a_bp*E(5) + k_1pos*E(4))*E(3) ...
    - k_1neg*E(5);
eqn6 = a_b*(E(3) + E(4)) - (d_b + k_b + beta1)*E(6);
eqn7 = a_bp*(E(3) + E(5)) - (d_bp + k_bp + beta1)*E(7);

dEdt = [eqn1; eqn2; eqn3; eqn4; eqn5; eqn6; eqn7];
end

