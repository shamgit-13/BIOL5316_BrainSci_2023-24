observed_ratio=[0, 0.19, 0.224, 1.12, 0.383, 0.997, 0.438, 0.23, 0.266, 1, 1.096;
    0, 0.278, 0.138, 1.167, 0.392, 1.047, 0.447, 0.2, 0.259, 1, 1.069;
    0.453, 0.663, 0.173, 1.093, 0.038, 1.208, 0.591, 0.166, 0.217, 1, 1.052;
    0.328, 0.334, 0.182, 1.136, 0.248, 1.043, 0.43, 0.241, 0.259, 1, 0.961;
    0.777, 0.557, 0.166, 1.175, 0.327, 1.078, 0.451, 0.306, 0.25, 1, 0.897;
];

true_ratio=[0, 0, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;
    0.1, 0.05, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;
    0.2, 0.1, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;
    0.4, 0.2, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;
    0.8, 0.4, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;];

% Calculate the differences and means
differences = observed_ratio - true_ratio;
averages = (observed_ratio + true_ratio) / 2;

% Calculate mean difference and limits of agreement
mean_diff = mean(differences(:));
sd_diff = std(differences(:));
upper_limit = mean_diff + 1.96 * sd_diff;
lower_limit = mean_diff - 1.96 * sd_diff;

% Plotting the Bland-Altman plot
figure;
plot(averages(:), differences(:), 'o', 'MarkerFaceColor', 'black', 'MarkerEdgeColor','black'); % Filled circles
hold on;

% Plot mean and limits of agreement lines
mean_line = yline(mean_diff, 'r', 'LineWidth', 2); % Mean line in red
upper_limit_line = yline(upper_limit, 'k--', 'LineWidth', 2); % Upper limit line in green
lower_limit_line = yline(lower_limit, 'k--', 'LineWidth', 2); % Lower limit line in blue

% Find the right-most x-position for the labels
max_x_pos = max(averages(:)) ; % Slight offset to avoid the plot's edge

% Adding labels to the lines
text(max_x_pos, mean_diff, sprintf('Mean: %.2f', mean_diff), ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', 'r');
text(max_x_pos, upper_limit, sprintf('Upper Limit: %.2f', upper_limit), ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', 'k');
text(max_x_pos, lower_limit, sprintf('Lower Limit: %.2f', lower_limit), ...
    'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', 'Color', 'k');

% Configure plot labels and title
xlabel('Average of Observed and Ground Truth Ratios of STEAM');
ylabel('Difference between Observed and Ground Truth Ratios of STEAM 6ms');
title('Bland-Altman Plot (STEAM 6ms)');
grid on;

% Configure legend
legend('Data Points', 'Mean Difference', 'Upper Limit (95% CI)', 'Lower Limit (95% CI)', ...
    'Location', 'northwest');
hold off;