%% CHEME7770 HW4 problem 1D, solve for percentage output change
% Use data produced by CHEME7770_HW4_1d.m

xchange1 = (interp1(kD, xsoln1(:,1), 1/0.15) - interp1(kD, xsoln1(:,1), 10)) ...
    / interp1(kD, xsoln1(:,1), 10) * 100;

xchange2 = (interp1(kD, xsoln2(:,1), 1/0.15) - interp1(kD, xsoln2(:,1), 10)) ...
    / interp1(kD, xsoln2(:,1), 10) * 100;

ychange1 = (interp1(kD, ysoln1(:,1), 1/0.15) - interp1(kD, ysoln1(:,1), 10)) ...
    / interp1(kD, ysoln1(:,1), 10) * 100;

ychange2 = (interp1(kD, ysoln2(:,2), 1/0.15) - interp1(kD, ysoln2(:,2), 10)) ...
    / interp1(kD, ysoln2(:,2),10) * 100;

ychange3 = (interp1(kD, ysoln1(:,1), 1/0.1) - interp1(kD, ysoln1(:,1), 1/0.05)) ...
    / interp1(kD, ysoln1(:,1), 1/0.05) * 100;

ychange4 = (interp1(kD, ysoln2(:,2), 1/0.1) - interp1(kD, ysoln2(:,2), 1/0.05)) ...
    / interp1(kD, ysoln2(:,2), 1/0.05) * 100;