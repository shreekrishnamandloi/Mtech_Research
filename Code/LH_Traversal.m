% Given value of r
r = 5;

% List to store (x, y) coordinates

coordinates_LH = [];

% Generating (x, y) coordinates
for m = 10:10:50
    y_LH=(m/r)*(2*m*m/1.732*r-2*m/1.732+m-r);
    coordinates_LH = [coordinates_LH; m, y_LH];

    
end

% Extracting x and y coordinates
x_values = coordinates_scan(:, 1);
y_LH_values = coordinates_LH(:, 2);


% Plotting the line graph
figure;
plot(x_values, y_LH_values, 'o-', 'LineWidth', 2, 'DisplayName', 'Y\_Scan', 'Color', 'blue');
hold off;


% Adding labels, title, and legend
xlabel('X');
ylabel('Y');
title('Line Graph of Coordinates');
legend('Location', 'best');

% Display the grid
grid on;
