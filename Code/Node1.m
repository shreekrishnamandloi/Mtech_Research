
% Define cube size
cubeSize = 10.0;

% Number of random points to generate
numPoints = 100;

% Generate random points inside the cube
randomPoints = generateRandomPointsInCube(cubeSize, numPoints);

% Display the generated random points
scatter3(randomPoints(:, 1), randomPoints(:, 2), randomPoints(:, 3), 'filled');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Random Points Inside Cube');
axis equal;
grid on;

function randomPoints = generateRandomPointsInCube(cubeSize, numPoints)
    % cubeSize: Size of the cube (single value, assuming a cube)
    % numPoints: Number of random points to generate
    
    % Generating random points
    randomPoints = rand(numPoints, 3);
    
    % Scaling points to fit inside the cube
    randomPoints = randomPoints * cubeSize;
    
    % Shifting points to the center of the cube
    randomPoints = randomPoints - cubeSize / 2;
 end
