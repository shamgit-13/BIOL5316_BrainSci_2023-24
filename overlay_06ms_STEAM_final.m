%Read data for 2mM of 2HG
data= readmatrix('NeuroOnc_MRC_Project/SS/Data_Analysis/Overlay Data/STEAM/2mM_STEAM_06_smag.csv'); %2mM 2HG
chemical_shifts = data(:, 1);
amplitude_values = data(:, 2);

%Read data from 8mM of 2HG
data2 = readmatrix('NeuroOnc_MRC_Project/SS/Data_Analysis/Overlay Data/STEAM/8mM_STEAM_06_smag.csv'); %8mM 2HG
chemical_shifts2 = data2(:, 1);
amplitude_values2 = data2(:, 2);

% Define vertical offsets
max_amplitude = max([amplitude_values; amplitude_values2;]);
offset1 = 0; % no offset for the first spectrum
offset2 = max_amplitude * 0.3;

% Plotting the spectra
figure;

% Plot the first spectrum
plot(chemical_shifts, amplitude_values + offset1, 'k', 'LineWidth', 1.5); % 'k' for black
hold on;

% Plot the second spectrum
plot(chemical_shifts2, amplitude_values2 + offset2, 'r', 'LineWidth', 1.5); % 'r' for red

% Add labels and title
xlabel('Chemical Shift (ppm)');
ylabel('Amplitude');
title('NMR Spectra for Phantoms at 6ms (STEAM)');

% Add legend to distinguish the spectra
legend('2mM 2HG','8mM 2HG');

% Optional: Adjust the plot limits for better visualization
xlim([1, 5]);

% Display grid
grid on;