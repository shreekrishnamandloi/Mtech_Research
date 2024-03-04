% Parameters
cubeSize = 10;  % Cube side length
numNodes = 50;  % Number of sensor nodes

% Generate true random coordinates within the cube
trueX = cubeSize * rand(1, numNodes);
trueY = cubeSize * rand(1, numNodes);
trueZ = cubeSize * rand(1, numNodes);

% Generate estimated random coordinates within the cube (replace with your actual estimated positions)
estimatedX = cubeSize * rand(1, numNodes);
estimatedY = cubeSize * rand(1, numNodes);
estimatedZ = cubeSize * rand(1, numNodes);

% Calculate localization error for each node
errorX = abs(trueX - estimatedX);
errorY = abs(trueY - estimatedY);
errorZ = abs(trueZ - estimatedZ);

% Calculate overall Euclidean distance error for each node
euclideanError = sqrt(errorX.^2 + errorY.^2 + errorZ.^2);

% Visualize localization error
figure;

subplot(2, 1, 1);
scatter3(trueX, trueY, trueZ, 'filled', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b');
hold on;
scatter3(estimatedX, estimatedY, estimatedZ, 'filled', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r');
title('True vs. Estimated Positions');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
legend('True Positions', 'Estimated Positions');
grid on;
hold off;

subplot(2, 1, 2);
bar(1:numNodes, euclideanError);
title('Localization Error for Each Node');
xlabel('Node Index');
ylabel('Euclidean Distance Error');
grid on;

% Display maximum error for each axis
fprintf('Maximum Localization Error:\n');
fprintf('X-axis: %f\n', max(errorX));
fprintf('Y-axis: %f\n', max(errorY));
fprintf('Z-axis: %f\n', max(errorZ));
