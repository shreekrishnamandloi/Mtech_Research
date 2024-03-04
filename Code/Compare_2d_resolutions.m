m = 200;
resolutions = 10:10:80;

coordinates = zeros(length(resolutions), 6);

for i = 1:length(resolutions)
    r = resolutions(i);
    y_scan = (m^2 / r) - r;
    y_Dscan = 2 * y_scan; % Correction: Double Scan is twice the Y_Scan
    y_circle = 3.14 * m * (m / r + 1);
    y_LH = (2 * m^2 / (1.732 * r)) - (2 * m / 1.732) + m - r;
    y_zcurve = (m^2 / r) * (1 + 1 / 1.41) + (m^2 / (r * r) - 1) * (r / 2);

    coordinates(i, :) = [r, y_scan, y_Dscan, y_circle, y_LH,y_zcurve ];
end

figure;
bar(coordinates(:, 1), coordinates(:, 2:end));

xlabel('Resolutions in (m)');
ylabel('Traversal length in (m)');
%title('Traversal Path Comparison at Different Resolutions');

legend('Scan', 'Double scan', 'Circles','Linear Hexagonal', 'Zcurve', 'Location', 'Best');
colormap('parula');




