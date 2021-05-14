function dRdt = SolveODE(t,R)
alpha = 10;
n = 2;
dRdt = [alpha / (1 + R(2)^n) - R(1); alpha / (1 + R(1)^n) - R(2)];
% dRdt = [f; g]
end