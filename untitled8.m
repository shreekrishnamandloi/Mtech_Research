% Given value of r
r = 10;

% List to store (x, y) coordinates
coordinates_scan = [];
coordinates_circle = [];
coordinates_LH = [];
coordinates_zcurve = [];

% Generating (x, y) coordinates
for m = 10:5:50
    y_scan = (m / r) * (m^2 / r - r);
    y_circle = 3.14*(m*m/r)*(m/r+1);
    y_LH=(m/r)*(2*m*m/1.732*r-2*m/1.732+m-r);
    y_zcurve=(m*m*m/r*r)*((1+1/1.41)+(m*m*m/r*r*r-1)*r/2);
    coordinates_scan = [coordinates_scan; m, y_scan];
    coordinates_circle = [coordinates_circle; m, y_circle];
    coordinates_LH = [coordinates_LH; m, y_LH];
    coordinates_zcurve = [coordinates_zcurve; m, y_zcurve];
    
end

% Extracting x and y coordinates
x_values = coordinates_scan(:, 1);
y_scan_values = coordinates_scan(:, 2);
y_circle_values = coordinates_circle(:, 2);
y_LH_values = coordinates_LH(:, 2);
y_zcurve_values = coordinates_zcurve(:, 2);

% Plotting the line graph
figure;
plot(x_values, y_scan_values, 'o-', 'LineWidth', 2, 'DisplayName', 'Y\_Scan');
hold on;  % Add this line to keep the previous plot
plot(x_values, y_circle_values, 'x-', 'LineWidth', 2, 'DisplayName', 'Y\_Circle');
hold on; % Add this line to stop overlaying plots
plot(x_values, y_LH_values, 'd-', 'LineWidth', 2, 'DisplayName', 'Y\_LH');
hold on; % Add this line to stop overlaying plots
plot(x_values, y_zcurve_values, 'd-', 'LineWidth', 2, 'DisplayName', 'Y\_Z-Curve');
hold off; % Add this line to stop overlaying plots

% Adding labels, title, and legend
xlabel('X');
ylabel('Y');
title('Line Graph of Coordinates');
legend('location', 'best','show');

% Display the grid
grid on;
