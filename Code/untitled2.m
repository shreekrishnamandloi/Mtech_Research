% Define the positions of anchor nodes and unknown nodes
anchorNodes = [
    0, 0;
    0, 10;
    10, 0
];
numUnknownNodes = 100; % Number of unknown nodes
unknownNodes = rand(numUnknownNodes, 2) * 10; % Generate random positions for unknown nodes

% Define the average hop distance
avgHopDistance = 3; % You can adjust this value based on your network characteristics

minError = Inf;
bestIteration = -1;
bestEstimatedPositions = [];

figure;

for iter = 1:15 % Perform 15 iterations
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

    % Calculate the localization error for each unknown node
    errors = zeros(numUnknownNodes, 1);
    for i = 1:numUnknownNodes
        errors(i) = sqrt(sum((unknownNodes(i, :) - estimatedPositions(i, :)).^2));
    end

    % Calculate the average localization error for this iteration
    averageError = mean(errors);

    % Update the minimum error and best estimated positions if this iteration has a lower error
    if averageError < minError
        minError = averageError;
        bestIteration = iter;
        bestEstimatedPositions = estimatedPositions;
    end
end
    % Plot the positions of anchor nodes, unknown nodes, and their estimated positions
    scatter(anchorNodes(:, 1), anchorNodes(:, 2), 100, 'filled', 'MarkerFaceColor', 'r'); % Anchor nodes
    hold on;
    scatter(unknownNodes(:, 1), unknownNodes(:, 2), 100, 'filled', 'MarkerFaceColor', 'b'); % Unknown nodes
    scatter(estimatedPositions(:, 1), estimatedPositions(:, 2), 100, 'filled', 'MarkerFaceColor', 'g'); % Estimated positions
    legend('Anchor Nodes', 'Unknown Nodes', 'Estimated Positions');
    xlabel('X');
    ylabel('Y');
    title(['DV-Hop Localization - Iteration ', num2str(iter)]);
    hold off;
    pause(1); % Pause for 1 second to observe the plot


% Display the best iteration and its results
disp(['Best Iteration: ', num2str(bestIteration)]);
disp('Actual and estimated positions of unknown nodes:');
disp('----------------------------------------------');
disp('Node   | Actual Position | Estimated Position | Localization Error');
disp('----------------------------------------------');
for i = 1:numUnknownNodes
    disp([sprintf('Node %2d | (%6.2f, %6.2f)    | (%6.2f, %6.2f)     | %10.2f', ...
        i, unknownNodes(i, :), bestEstimatedPositions(i, :), minError)]);
end

% Display the minimum average localization error
disp(['Minimum Average Localization Error: ', num2str(minError)]);
