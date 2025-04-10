%% for TIC

% TIC_forecast = readmatrix('generation.csv');
% TIC_x = TIC_forecast(:,1);
% TIC_y = TIC_forecast(:,2);
% bar(TIC_x,TIC_y,0.5);
% xlabel('Year')
% ylabel('Total Installed Capacity (GW)')

%% for peakvalue

historical_peak = readmatrix('peak_demand_historical.csv');
hp_x = historical_peak(:,1);
hp_y = historical_peak(:,2);
plot(hp_x,hp_y,marker = 'o', MarkerSize=4, ...
    MarkerFaceColor='black',MarkerEdgeColor='black' ...
    ,LineWidth=1.5,Color='#0072BD');
hold on
xlabel("Year",FontWeight='bold')
ylabel("Peak Load (MW)",FontWeight='bold')
title('Historical and Forecasted Peak Load',FontWeight='bold')
% Add text annotations
offset = 50;
right_offset = 0.3;

% Fit a linear regression model
rows_to_remove = [7 8 9];
fit_x = hp_x; fit_y = hp_y;
fit_x(rows_to_remove,:)=[];
fit_y(rows_to_remove,:)=[];

coefficients = polyfit(fit_x, fit_y, 1);
m = coefficients(1);
c = coefficients(2);

p_x = vertcat(hp_x ,(2023:1:2030)');
p_y = m.*p_x + c;
plot(p_x,p_y,'--',color='#7E2F8E',LineWidth=1.5)
% xticks(p_x);
% xtickangle(90);

hgr = readmatrix('high_growth.csv');
hgr_x = hgr(:,1);
hgr_y = hgr(:,2);

plot(hgr_x,hgr_y,'--',color='#77AC30', LineWidth=1.5)
ylim([0,6000])

legend('Historcal PL', 'NGR PL', 'HGR PL', location ='northwest')


% Set x-axis limits with gap
gap = 0.5;  % Adjust the size of the gap as desired
xlim([min(p_x) - gap, max(p_x) + gap]);
ylim([0, 5500 + gap]);

% % Increase the distance between xlabel and axis label
% ax = gca;  % Get the current axes handle
% xlabelPosition = ax.XAxis.Label.Position;  
% xlabelPosition(2) = xlabelPosition(2) + 10;  
% ax.XAxis.Label.Position = xlabelPosition; 
% 
% % ylabelPosition = ax.YAxis.Label.Position;
% % ylabelPosition(1) = ylabelPosition(1) - 0.05; 
% % ax.YAxis.Label.Position = ylabelPosition;
