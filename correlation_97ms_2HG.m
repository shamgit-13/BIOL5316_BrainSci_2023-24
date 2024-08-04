%% Correlation for observed concentrations and true concentrations at 97ms for 2HG
% Example data (replace with your actual data)
obs = [0.792, 0.138, 0.902, 3.962, 5.211]; % observed concentrations 
concentrations = [0, 1, 2, 4, 8]; % Actual Concentrations in mM

% Calculate Pearson correlation coefficient
[r, p] = corr(obs', concentrations');

% Display the correlation coefficient and p-value
disp(['Pearson correlation coefficient: ', num2str(r)]);
disp(['P-value: ', num2str(p)]);

% Plotting the data and the correlation
figure;
scatter(obs, concentrations, 'filled');
xlabel('Observed Concentrations (mM)');
ylabel('Actual Concentration (mM)')
title('Correlation between Observed Concentration and True Concentrations of 2HG at 97ms');
grid on;

% Add a line of best fit
hold on;
coefficients = polyfit(obs, concentrations, 1);
fittedX = linspace(min(obs), max(obs), 200);
fittedY = polyval(coefficients, fittedX);
plot(fittedX, fittedY, 'r-', 'LineWidth', 1.5);
hold off;

% Display the correlation and p-value on the plot
text(mean(obs), mean(concentrations), ...
    ['r = ' num2str(r, 2) ', p = ' num2str(p, 2)], ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');


