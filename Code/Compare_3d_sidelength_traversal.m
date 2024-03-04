% Given value of r (resolution)
r = 30;

% List to store (x, y) coordinates
coordinates_scan = [];
coordinates_Dscan = [];
coordinates_circle = [];
coordinates_LH = [];
coordinates_Triangular=[];

% Generating x values
x_values = 50:30:200;

for m = x_values
    y_scan = (m / r) * (m^2 / r - r) + m - r;
    y_Dscan = 2 * y_scan;
    y_circle = (m^2 / (2 * r)) * ((pi * m) / (2 * r) + pi / 2 + 1) + m - r;
    y_triangular = (m / r) * (m^2 / (0.9 * r) - m / 9 - r) + m - r;
    y_LH = (m / r) * ((2 * m^2 / (1.732 * r)) - (2 * m / 1.732) + m - r) + m - r;

    coordinates_scan = [coordinates_scan; m, y_scan];
    coordinates_Dscan = [coordinates_Dscan; m, y_Dscan];
    coordinates_circle = [coordinates_circle; m, y_circle];
    coordinates_LH = [coordinates_LH; m, y_LH];
    coordinates_Triangular=[coordinates_Triangular;m,y_triangular];
end

% Extracting y coordinates
y_scan_values = coordinates_scan(:, 2);
y_Dscan_values = coordinates_Dscan(:, 2);
y_circle_values = coordinates_circle(:, 2);
y_LH_values = coordinates_LH(:, 2);
y_triangular=coordinates_Triangular(:,2);

% Plotting the line graph with different line styles
figure;
plot(x_values, y_scan_values, "square-", 'LineWidth', 1, 'DisplayName', 'Scan', 'Color', 'blue');
hold on;
plot(x_values, y_Dscan_values, "diamond-", 'LineWidth', 1, 'DisplayName', 'DScan','Color','green');
hold on;
plot(x_values, y_triangular, 'o-', 'LineWidth', 1.5, 'DisplayName', 'Triangular','Color','red');
hold on;
plot(x_values, y_LH_values, "square-", 'LineWidth', 1, 'DisplayName', 'LH','Color','black');
hold on;
plot(x_values, y_circle_values, 'o-', 'LineWidth', 1, 'DisplayName', 'Circular','Color','cyan');
hold off;

% Setting x-ticks
new_ticks = [50, 80, 110,140,170,200];
xticks(new_ticks);

% Adding labels, title, and legend
xlabel('Sensor region side length (m)');
ylabel('Traversing path length (m)');
legend('location', 'best');
