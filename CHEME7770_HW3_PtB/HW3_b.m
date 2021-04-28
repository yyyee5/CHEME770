%% Solve for residual matrix
% Matrix A and S were created in 

% A is atom matrix
% col = [C H N O P S]
% row = [H2O ATP NADPH NADP+ O2 PHOSPHATE DIPHOSPHATE AMP L-ASP L-ORN H+
% UREA FUMARATE CARBAMOYL_PHOSPHATE L-CIT NO L-ARG N(OMEGA)-HYDROX]
A = importdata('AtomMatrix.xlsx');

% S is stoich matrix
S = importdata('Network.dat');


% E is residual matrix
E = A' * S;

% First 6 rxns of E are from the main part of the network and are all
% zeros, therefore showing that the urea cycle within the box in fig. 1 is
% elementally balanced. However, the remainder of E are non-zeros, showing
% that chemicals that flows in/out of the box are not balanced. Correcting
% the balance of chemicals entering/exiting the system requires including
% the exterior chemicals in the atom and stoichiometric matrix.