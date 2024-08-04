observed_ratios_78=[0, 0.065, 0.125, 0.894, 0, 0.241, 0.235, 0.212, 0.298, 1, 0.616;
    0.099, 0.027, 0.093, 1.175, 0, 0.358, 0.246, 0.191, 0.281, 1, 0.643;
    0.077, 0.082, 0.141, 0.962, 0, 0.277, 0.253, 0.153, 0.282, 1, 0.564;
    0, 0.122, 0.131, 0.906, 0, 0.253, 0.253, 0.193, 0.291, 1, 0.627;
    0.259, 0.082, 0.104, 1.136, 0, 0.313, 0.235, 0.146, 0.257, 1, 0.512;
    ];

true_ratios_78=[0, 0, 0.16, 1.25, 0.5, 1.25, 0.5, 01, 0.3, 1, 0.75;
    0.1, 0.05, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;
    0.2, 0.1, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;
    0.4, 0.2, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;
    0.8, 0.4, 0.16, 1.25, 0.5, 1.25, 0.5, 0.1, 0.3, 1, 0.75;  
];

% Calculate the differences and means
differences = observed_ratios_78 - true_ratios_78;
averages = (observed_ratios_78 + true_ratios_78) / 2;

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
xlabel('Average of Observed and Ground Truth Ratios of PRESS (78ms)');
ylabel('Difference between Observed and Ground Truth Ratios of PRESS (78ms)');
title('Bland-Altman Plot (PRESS 78ms)');
grid on;

% Configure legend
legend('Data Points', 'Mean Difference', 'Upper Limit (95% CI)', 'Lower Limit (95% CI)', ...
    'Location', 'northwest');
hold off;