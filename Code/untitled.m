% Define the side length of the cube
m = 5;

% Create a figure
figure;

% Plot the cube
cubepoints = [
    0, 0, 0;
    m, 0, 0;
    m, m, 0;
    0, m, 0;
    0, 0, m;
    m, 0, m;
    m, m, m;
    0, m, m
];
cubeedges = [
    1, 2; 2, 3; 3, 4; 4, 1;  % Bottom face
    5, 6; 6, 7; 7, 8; 8, 5;  % Top face
    1, 5; 2, 6; 3, 7; 4, 8   % Connecting edges
];
plot3(cubepoints(:, 1), cubepoints(:, 2), cubepoints(:, 3), 'o-');
hold on;
for i = 1:size(cubeedges, 1)
    line(cubepoints(cubeedges(i, :), 1), cubepoints(cubeedges(i, :), 2), cubepoints(cubeedges(i, :), 3));
end

% Plot the squares inside the cube
square1 = [0, 0, 0; m, 0, 0; m, m, 0; 0, m, 0; 0, 0, 0];
square2 = [0, 0, m; m, 0, m; m, m, m; 0, m, m; 0, 0, m];
square3 = [m, 0, 0; m, 0, m; m, m, m; m, m, 0; m, 0, 0];
plot3(square1(:, 1), square1(:, 2), square1(:, 4), 'b-');
plot3(square2(:, 1), square2(:, 2), square2(:, 3), 'g-');
plot3(square3(:, 1), square3(:, 2), square3(:, 3), 'b-');

% Set axis labels
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');

% Set aspect ratio to be equal
axis equal;

% Set grid on
grid on;

% Set title
title('Cube with Squares Inside');

% Set view for better visibility
view(30, 30);
