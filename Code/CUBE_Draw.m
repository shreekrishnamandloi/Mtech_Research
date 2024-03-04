% Cube vertices
vertices = [0 0 0; 1 0 0; 1 1 0; 0 1 0; 0 0 1; 1 0 1; 1 1 1; 0 1 1];

% Cube faces (each row represents the indices of vertices for a face)
faces = [1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8; 1 2 3 4; 5 6 7 8];

% Plot the cube
figure;
patch('Vertices', vertices, 'Faces', faces, 'FaceColor', 'w', 'EdgeColor', 'k');

% Set axis properties
axis equal;
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('3D Cube');

% Set grid and view
grid on;
view(3); % 3D view
