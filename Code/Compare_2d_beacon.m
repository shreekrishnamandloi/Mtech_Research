m = 200;
resolutions = 10:10:80;

beacon_counts = zeros(length(resolutions), 6);

for i = 1:length(resolutions)
    r = resolutions(i);
    beacon_counts(i, 1) = r; % Resolution
    beacon_counts(i, 2) = (m*m)/(r*r); % Scan technique 
    beacon_counts(i, 3) = 2 * (m*m/(r*r)); % Dscan technique
    beacon_counts(i, 4) = (pi / 2) * (m / r)^2; % Circle technique
    beacon_counts(i, 5) = (5/4)*((m*m)/(r*r)); % z_curve technique
    beacon_counts(i, 6) = (3*m*m)/((2*sqrt(3))*r*r); % LH technique
    %beacon_counts(i, 7) = (0.9 * sqrt(3) / 4) * (m / r)^2; % Triangular technique
end

figure;
bar(beacon_counts(:, 1), beacon_counts(:, 2:end));

xlabel('Resolutions (m)');
ylabel('Number of Beacon Nodes');
%title('Number of Beacon Nodes for Different Techniques');

legend('Scan', 'Double scan', 'Circles', 'Zcurve','Linear hexagonal', 'Location', 'Best');
colormap('parula');
