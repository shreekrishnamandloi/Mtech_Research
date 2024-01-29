% Define the radius
r = 5;

% List to store (x, y) coordinates
coordinates_list = [];

% Generating (x, y) coordinates
for m = 5:5:50
    % Calculate y values for different traversal schemes
    y_scan = (m / r) * ((m^2 / r) - r);
    y_circle = 3.14 * ((m^2 / r) * (m / r + 1));
    y_zcurve = (m^3 / (r * r)) * ((1 + 1/1.41) + ((m^3 / (r * r * r)) - 1) * r / 2);
    y_LH = (m / r) * (2 * (m^2 / 1.732 * r) - 2 * m / 1.732 + m - r);
    
    % Append (x, y) coordinates to the list
    coordinates_list = [coordinates_list; m, y_scan; m, y_circle; m, y_zcurve; m, y_LH];
end



% Plotting all coordinates_list in one graph
figure;
plot(x_values(1:4:end), y_values(1:4:end), 'o-', 'DisplayName', 'SCAN Traversal');
plot(x_values(2:4:end), y_values(2:4:end), 's-', 'DisplayName', 'CIRCLES Traversal');
plot(x_values(3:4:end), y_values(3:4:end), '^-', 'DisplayName', 'Z-curve Traversal');
plot(x_values(4:4:end), y_values(4:4:end), 'd-', 'DisplayName', 'LH Traversal');

% Adding labels and legend
title('Traversal Schemes Comparison');
xlabel('m');
ylabel('y');
legend('Location', 'Best');
grid on;
