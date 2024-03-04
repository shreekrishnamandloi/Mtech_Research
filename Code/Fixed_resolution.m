r = 30;
m_value = 50:30:100;

coordinates = zeros(length(m_value), 6);

for i = 1:length(m_value)
    m = m_value(i);
    y_scan = (m / r) * (m^2 / r - r) + m - r;
    y_Dscan = 2 * y_scan;
    y_circle = (m^2 / (2 * r)) * ((pi * m) / (2 * r) + pi / 2 + 1) + m - r;
    y_triangular = (m / r) * (m^2 / (0.9 * r) - m / 9 - r) + m - r;
    y_LH = (m / r) * ((2 * m^2 / (1.732 * r)) - (2 * m / 1.732) + m - r) + m - r;
    y_zcurve = (m / r) * ((m^2 / r) * ((1 + 1 / 1.41) + (m^2 / r^2 - 1) * (r / 2))) + m - r / 2;

    coordinates(i, :) = [m, y_scan, y_Dscan, y_circle, y_LH,y_triangular ];
end

figure;
plot(coordinates(:, 1), coordinates(:, 2:end),'LineWidth',1);

xlabel('Cube side length in m');
ylabel('Traversal length in m');
%title('Traversal Path Comparison at Different Resolutions');

legend('Scan', 'Double scan', 'Circles','Linear Hexagonal', 'Triangular scan', 'Location', 'Best');
colormap('parula');




