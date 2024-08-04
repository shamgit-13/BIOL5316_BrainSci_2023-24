% Read data from the file
data2 = readmatrix('NeuroOnc_MRC_Project/SS/Data_Analysis/Overlay Data/PRESS/2mM_PRESS_97_smag.csv'); % Replace with the correct filename

% Separate the data into chemical shifts and amplitude values
chemical_shifts2 = data2(:, 1);
amplitude_values2 = data2(:, 2);

% Read data for the second spectrum from the file
data4 = readmatrix('NeuroOnc_MRC_Project/SS/Data_Analysis/Overlay Data/PRESS/8mM_PRESS_97_smag.csv'); % Replace with the correct filename
chemical_shifts4 = data4(:, 1);
amplitude_values4 = data4(:, 2);

% Define vertical offsets
max_amplitude = max([amplitude_values2; amplitude_values4;]);
offset1 = 0; % no offset for the first spectrum
offset4= max_amplitude * 0.15;

% Plotting the spectra
figure;

% Plot the first spectrum
plot(chemical_shifts2, amplitude_values2 + offset1, 'k', 'LineWidth', 1.5); % 'k' for black
hold on; 

% Plot the second spectrum
plot(chemical_shifts4, amplitude_values4 +offset4, 'r', 'LineWidth', 1.5); % 'g' for green

% Add labels and title
xlabel('Chemical Shift (ppm)');
ylabel('Amplitude');
title('Overlaid NMR Spectra at TE=97ms');

% Add legend to distinguish the two spectra
legend('Tube 3 (2mM 2HG)', 'Tube 1 (8mM 2HG)');

% Optional: Adjust the plot limits for better visualization
xlim([1, 5]);

% Display grid
grid on;
