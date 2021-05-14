%% CHEME 7770 HW 6 Problem 1D and 1E
% Solve for u, v, and eigenvalues at center steady state

clear
syms u lambda

alpha = 10;
n = 2;

eqn = u == alpha / (1 + (alpha / (1 + u^n))^n);

S = solve(eqn, u)

U = double(S);


for i = 1:length(U)
    J = [-1, -alpha*n*U(i)^(n-1) / (1 + U(i)^n)^2; ...
    -alpha*n*U(i)^(n-1) / (1 + U(i)^n)^2, -1];
    
    lambda = eig(J)
end