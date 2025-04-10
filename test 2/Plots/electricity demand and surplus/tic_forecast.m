% for TIC

TIC_forecast = readmatrix('generation.csv');
TIC_x = TIC_forecast(:,1);
TIC_y = TIC_forecast(:,2);
bar(TIC_x,TIC_y,0.7);
xlabel('Year',FontWeight='bold')
ylabel('Total Installed Capacity (GW)',FontWeight='bold')
title('Total Installed Capacity Forecast',FontWeight='bold')
