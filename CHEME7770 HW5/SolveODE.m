function dDdt = SolveODE(t,D)
dDdt = [1 / (1 + 10*(D(2)^2 / (0.1 + D(2)^2))^2) - D(1); ...
    1 / (1 + 10*(D(1)^2 / (0.1 + D(1)^2))^2) - D(2)];
end