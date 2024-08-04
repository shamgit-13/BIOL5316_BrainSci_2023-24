observed_ratios_97=[0.052, 0.158, 0.165, 0.897, 0, 0.305, 0.246, 0.126, 0.305, 1, 0.594;
    0.011, 0.087, 0.056, 0.832, 0, 0.278, 0.201, 0.132, 0.277, 1, 0.578;
    0.037, 0.093, 0.141, 0.834, 0, 0.273, 0.241, 0.091, 0.29, 1, 0.592;
    0.136, 0.188, 0.153, 0.907, 0, 0.335, 0.272, 0.128, 0.297, 1, 0.589;
    0.205, 0.138, 0.092, 0.911, 0, 0.275, 0.218, 0.102, 0.284, 1, 0.547;
    ];

true_ratios_97=[0, 0, 0.16, 1.25, 0.5, 1.25, 0.5, 01, 0.3, 1, 0.75;
    0.1, 0.05, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;
    0.2, 0.1, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;
    0.4, 0.2, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;
    0.8, 0.4, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;  
];

% Calculate the differences and means
differences = observed_ratios_97 - true_ratios_97;
averages = (observed_ratios_97 + true_ratios_97) / 2;

% Calculate mean difference and limits of agreement
mean_diff = mean(differences(:));
sd_diff = std(differences(:));
upper_limit = mean_diff + 1.96 * sd_diff;
lower_limit = mean_diff - 1.96 * sd_diff;

% Plotting the Bland-Altman plot
figure;
plot(averages(:), differences(:), 'o', 'MarkerFaceColor', 'black','MarkerEdgeColor','black'); % Filled circles
hold on;

% Plot mean and limits of agreement lines
mean_line = yline(mean_diff, 'red', 'LineWidth', 2); % Mean line in red
upper_limit_line = yline(upper_limit, 'blue--', 'LineWidth', 2); % Upper limit line in cyan
lower_limit_line = yline(lower_limit, 'blue--', 'LineWidth', 2); % Lower limit line in blue

% Find the right-most x-position for the labels
max_x_pos = max(averages(:)) ; % Slight offset to avoid the plot's edge

% Adding labels to the lines
text(max_x_pos, mean_diff, sprintf('Mean: %.2f', mean_diff), ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', 'red');
text(max_x_pos, upper_limit, sprintf('Upper Limit: %.2f', upper_limit), ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', 'blue');
text(max_x_pos, lower_limit, sprintf('Lower Limit: %.2f', lower_limit), ...
    'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', 'Color', 'blue');

% Configure plot labels and title
xlabel('Average of Observed and Ground Truth Ratios of PRESS (97ms)');
ylabel('Difference between Observed and Ground Truth Ratios of PRESS (97ms)');
title('Bland-Altman Plot (PRESS 97ms)');
grid on;

% Configure legend
legend('Data Points', 'Mean Difference', 'Upper Limit (95% CI)', 'Lower Limit (95% CI)', ...
    'Location', 'northwest');
hold off;