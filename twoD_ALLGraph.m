% Given value of r
r = 10;

% List to store (x, y) coordinates
coordinates_scan = [];
coordinates_Dscan = [];
coordinates_circle = [];
coordinates_LH = [];
coordinates_zcurve = [];

% Generating (x, y) coordinates
for m = 10:10:100
    y_scan = (m^2 / r - r);
    y_Dscan = 2 * y_scan; % Correction: Double Scan is twice the Y_Scan
    y_circle = 3.14 * m*(m / r + 1);
    y_LH = (2 * m^2 / (1.732 * r) - 2 * m / (1.732) + m - r);
    y_zcurve = (m^2/ r) * (1 + 1 / 1.41) + (m^2 / (r * r) - 1) *( r / 2);

    coordinates_scan = [coordinates_scan; m, y_scan];
    coordinates_Dscan = [coordinates_Dscan; m, y_Dscan];
    coordinates_circle = [coordinates_circle; m, y_circle];
    coordinates_LH = [coordinates_LH; m, y_LH];
    coordinates_zcurve = [coordinates_zcurve; m, y_zcurve];
end

% Extracting x and y coordinates
x_values = coordinates_scan(:, 1);
y_scan_values = coordinates_scan(:, 2);
y_Dscan_values = coordinates_Dscan(:, 2);
y_circle_values = coordinates_circle(:, 2);
y_LH_values = coordinates_LH(:, 2);
y_zcurve_values = coordinates_zcurve(:, 2);

% Plotting the line graph with different line styles
figure;
plot(x_values, y_scan_values, "square-", 'LineWidth', 1, 'DisplayName', 'Scan','Color','blue');
hold on;
plot(x_values, y_Dscan_values, "diamond-", 'LineWidth', 1, 'DisplayName', 'DScan','Color','green');
hold on;
plot(x_values, y_circle_values, 'o-', 'LineWidth', 1, 'DisplayName', 'Circle','Color','black');
hold on;
plot(x_values, y_LH_values, "square-", 'LineWidth', 1, 'DisplayName', 'LH','Color','red');
hold on;
plot(x_values, y_zcurve_values, 'o-', 'LineWidth', 1, 'DisplayName', 'Z-Curve','Color','cyan');
hold off;



% Adding labels, title, and legend
xlabel('Sensor region side length (meter)');
ylabel('Traversing path length (meter)');
title('Line Graph of Coordinates');
legend('Location','best');
%legend('Location','best','show');


% Display the grid
grid on;

% Displaying y-coordinates
disp('Y-Coordinates:');
disp('------------------------');
disp(['Y_Scan:   ', num2str(y_scan_values')]);
disp(['Y_DScan:  ', num2str(y_Dscan_values')]);
disp(['Y_Circle: ', num2str(y_circle_values')]);
disp(['Y_LH:     ', num2str(y_LH_values')]);
disp(['Y_ZCurve: ', num2str(y_zcurve_values')]);