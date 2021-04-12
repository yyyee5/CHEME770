%% Experimental dataset for PFK activity
data = dlmread('Data-3-5-AMP.txt');

AMP_conc = data(1:end, 1);
overall_rate = data(1:end, 2);
confidence = data(1:end, 3);

%% plot(AMP_conc, overall_rate);
errorbar(AMP_conc, overall_rate, confidence);
xlabel('3'' - 5'' - AMP Concentration (mM)')
ylabel('Reaction Rate (\muM/h)')
hold on

%% Solve for computational overall rate
w1 = 0.0451;
w2 = 47.298;
AMP_conc = linspace(0,1);
r = 69.5798;
n = 5;
K = 0.2;


total_r = zeros(1, 100);
f = zeros(1, 100);

for i = 1:100
    f(i) = AMP_conc(i)^n / (K^n + AMP_conc(i)^n);
    total_r(i) = r * (w1 + w2 * f(i)) / (1 + w1 + w2*f(i));
    
    % Reached 3'-5'-AMP concentration for max reaction rate, no changes in
    % reaction rate occurs at higher 3'-5'-AMP concentrations
    if AMP_conc(i) >= 0.405
        total_r(i) = total_r(i-1);
    end
end

plot(AMP_conc, total_r)
legend('Measured rate', 'Estimated computed rate')