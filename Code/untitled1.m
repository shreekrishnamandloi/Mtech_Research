% Define the positions of anchor nodes and unknown nodes
anchorNodes = [
    0, 0;
    0, 10;
    10, 0
];
numUnknownNodes = 10; % Number of unknown nodes
unknownNodes = rand(numUnknownNodes, 2) * 10; % Generate random positions for unknown nodes

% Define the average hop distance
avgHopDistance = 3; % You can adjust this value based on your network characteristics

% Calculate the distances between anchor nodes and unknown nodes
distances = zeros(size(anchorNodes, 1), numUnknownNodes);
for i = 1:numUnknownNodes
    distances(:, i) = sqrt(sum((anchorNodes - unknownNodes(i, :)).^2, 2));
end

% Estimate the hop counts based on the average hop distance
hopCounts = distances / avgHopDistance;

% Round hop counts to integers
hopCounts = round(hopCounts);

% Calculate the estimated positions using DV-Hop algorithm for each unknown node
estimatedPositions = zeros(numUnknownNodes, 2);
for i = 1:numUnknownNodes
    for j = 1:size(anchorNodes, 1)
        estimatedPositions(i, :) = estimatedPositions(i, :) + anchorNodes(j, :) * hopCounts(j, i);
    end
    estimatedPositions(i, :) = estimatedPositions(i, :) / sum(hopCounts(:, i));
end

% Plot the positions of anchor nodes, unknown nodes, and their estimated positions
figure;
hold on;
scatter(anchorNodes(:, 1), anchorNodes(:, 2), 100, 'filled', 'MarkerFaceColor', 'r'); % Anchor nodes
scatter(unknownNodes(:, 1), unknownNodes(:, 2), 100, 'filled', 'MarkerFaceColor', 'b'); % Unknown nodes
scatter(estimatedPositions(:, 1), estimatedPositions(:, 2), 100, 'filled', 'MarkerFaceColor', 'g'); % Estimated positions
legend('Anchor Nodes', 'Unknown Nodes', 'Estimated Positions');
xlabel('X');
ylabel('Y');
title('DV-Hop Localization');
hold off;
