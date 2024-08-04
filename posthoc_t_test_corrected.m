% Define the data
echo_times = [20, 35, 60]; % Echo times in ms

% Observed ratios at different echo times
observed_ratios = {
    [0.136, 0.188, 0.153, 0.907, 0, 0.335, 0.272, 0.128, 0.297, 1, 0.589]; % 20 ms
    [0.14, 0.185, 0.096, 0.891, 0, 0.265, 0.274, 0.106, 0.292, 1, 0.58];  % 35 ms
    [0.113, 0.219, 0.124, 0.862, 0, 0.255, 0.257, 0.08, 0.284, 1, 0.449];  % 60 ms
};

% Number of observations
num_observations = length(observed_ratios{1});

% Perform paired t-tests between each pair of echo times
for i = 1:length(echo_times)
    for j = i+1:length(echo_times)
        [h, p, ci, stats] = ttest2(observed_ratios{i}, observed_ratios{j});
        disp(['Comparison between ', num2str(echo_times(i)), ' ms and ', num2str(echo_times(j)), ' ms:']);
        disp(['t-Statistic: ', num2str(stats.tstat)]);
        disp(['P-value: ', num2str(p)]);
        disp(['Confidence Interval: [', num2str(ci(1)), ', ', num2str(ci(2)), ']']);
        disp(' ');
    end
end

% Number of comparisons
num_comparisons = 3; % (20 vs. 35), (20 vs. 60), (35 vs. 60)

% Adjusted significance level
alpha = 0.05;
alpha_corrected = alpha / num_comparisons;

disp(['Corrected significance level: ', num2str(alpha_corrected)]);