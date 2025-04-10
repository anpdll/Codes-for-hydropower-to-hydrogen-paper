TIC_forecast = readmatrix('generation.csv');
TIC_y = TIC_forecast(:,2);
TIC_y(1,:) = [];

nea = readmatrix('nea_2030.csv');
nea_x = nea(:,1);
nea_y = nea(:,2);

total_electricity = TIC_y.*365.*24.*0.65*1e-03;
peak_electricity = nea_y.*1e-03.*365.*24.*0.65.*1e-03;
surplus_electricity = total_electricity-peak_electricity;

top_zero = vertcat(zeros(5,1),ones(6,1));
top_one = vertcat(ones(5,1),zeros(6,1));

negative_removed_se = surplus_electricity.*top_zero;
positive_removed_se = surplus_electricity.*top_one;

%stack_value = horzcat(peak_electricity,surplus_electricity);
stack_value = horzcat(peak_electricity,positive_removed_se,negative_removed_se);

b = bar(nea_x',stack_value',0.7,'stacked')
b(1).FaceColor = "#018ABE";
b(2).FaceColor = "#D6EBEE";
b(3).FaceColor = "#97CADB";
legend('Peak Electricity','Deficit Electricity','Surplus Electricity',Location='northwest');
xlabel("Year",FontWeight='bold')
ylabel("Surplus Electricity (TWh)",FontWeight='bold')
title('Peak Electricity Demand and Surplus Electricity',FontWeight='bold')
