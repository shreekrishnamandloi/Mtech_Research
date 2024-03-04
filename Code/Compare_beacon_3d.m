m = 200;
resolutions = 10:10:80;

beacon_counts = zeros(length(resolutions), 3);

for i = 1:length(resolutions)
    r = resolutions(i);
    beacon_counts(i, 1) = r; % Resolution
    beacon_counts(i, 2) = m^3/r^3; % Scan technique
    beacon_counts(i, 3) = 2 * (m^3/r^3); % Dscan technique
    beacon_counts(i, 4) = (m/r)*(3.14*m/(2*r))*(m/(2*r)+1); % Circle technique
  %  beacon_counts(i, 5) = (m/r)*(6*((m^2)/(2*sqrt(3)*r^2))); % LH technique
     beacon_counts(i, 5) = (m/r)*((2*(m^2)/(sqrt(3)*r^2))-(2*m/(sqrt(3)*r))+(m/r)-1); % LH technique
    beacon_counts(i, 6) =  (m*m*m)/(r*r*0.9*r); % Triangular technique
end

figure;
bar(beacon_counts(:, 1), beacon_counts(:, 2:end));

xlabel('Resolutions (m)');
ylabel('Number of Beacon Nodes');
%title('Number of Beacon Nodes for Different Techniques');

legend('Scan', 'Double scan', 'Circles', 'Linear hexagonal','Triangular scan', 'Location', 'Best');
colormap('parula');

disp(num2str(beacon_counts));
%new_ticks = [250, 500, 750,1000,1200,1500,2000,4000,6000,8000,10000,15000];
%new_labels = {'A', 'B', 'C'};
%yticks(new_ticks);
%xticklabels(new_labels)
