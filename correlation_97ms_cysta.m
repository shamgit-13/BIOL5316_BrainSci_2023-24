%% Correlation for observed concentrations and true concentrations at 97ms for cystathionine
% Example data (replace with your actual data)
obs = [2.397, 1.089, 2.247, 5.5, 3.511]; % observed concentrations 
concentrations = [0, 0.5, 1, 2, 4]; % Actual Concentrations in mM

% Calculate Pearson correlation coefficient
[r, p] = corr(obs', concentrations');

% Display the correlation coefficient and p-value
disp(['Pearson correlation coefficient: ', num2str(r)]);
disp(['P-value: ', num2str(p)]);

% Plotting the data and the correlation
figure;
scatter(concentrations, obs, 'filled', 'black');
ylabel('Observed Concentrations (mM)');
xlabel('Actual Concentration (mM)')
title('Correlation Between Observed and True Concentrations of Cystathionine');
grid on;

% Add a line of best fit
hold on;
coefficients = polyfit(concentrations, obs, 1);
fittedX = linspace(min(concentrations), max(concentrations), 200);
fittedY = polyval(coefficients, fittedX);
plot(fittedX, fittedY, 'r-', 'LineWidth', 1.5);
hold off;

% Display the correlation and p-value on the plot
text(mean(obs), mean(concentrations), ...
    ['r = ' num2str(r, 2) ', p = ' num2str(p, 2)], ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');


