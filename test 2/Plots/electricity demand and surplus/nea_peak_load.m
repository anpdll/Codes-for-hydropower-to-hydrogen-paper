nea = readmatrix('nea_2030.csv');
nea_x = nea(:,1);
nea_y = nea(:,2);
plot(nea_x,nea_y,marker = 'o', MarkerSize=4, ...
    MarkerFaceColor='black',MarkerEdgeColor='black' ...
    ,LineWidth=1.5,Color='#0072BD');

xlabel("Year",FontWeight='bold')
ylabel("Peak Load (MW)",FontWeight='bold')
title('Peak Load Forecasting by NEA',FontWeight='bold')

% Set x-axis limits with gap
gap = 0.5;  % Adjust the size of the gap as desired
xlim([min(nea_x) - gap, max(nea_x) + gap]);
ylim([min(nea_y)-1000, max(nea_y) + 1000]);