se = readmatrix('surplus_electricity.csv');
year = se(:,1);
tic = se(:,2);
ngr = se(:,3);
hgr = se(:,4);

se_ngr = (tic-(ngr.*0.001)).*365.*24.*0.65.*0.001;
se_hgr = (tic-(hgr.*0.001)).*365.*24.*0.65.*0.001;

case1 = 0.5 .* se_ngr;
case2 = 0.8 .* se_ngr;
case3 = 0.5 .* se_hgr;
case4 = 0.8 .* se_hgr;

plot(year,case1,marker = 'o', MarkerSize=4, ...
    MarkerFaceColor='#7E2F8E',MarkerEdgeColor='#7E2F8E' ...
    ,LineWidth=1.5,Color='#0072BD');
hold on

plot(year,case2,marker = 'o', MarkerSize=4, ...
    MarkerFaceColor='#7E2F8E',MarkerEdgeColor='#7E2F8E' ...
    ,LineWidth=1.5,Color='#D95319');

plot(year,case3,marker = 'o', MarkerSize=4, ...
    MarkerFaceColor='#77AC30',MarkerEdgeColor='#77AC30' ...
    ,LineWidth=1.5,Color='#0072BD');

plot(year,case4,marker = 'o', MarkerSize=4, ...
    MarkerFaceColor='#77AC30',MarkerEdgeColor='#77AC30' ...
    ,LineWidth=1.5,Color='#D95319');

legend('case 1','case 2', 'case 3','case 4',Location='northwest');

xlabel('Year',FontWeight='bold')
ylabel('Surplus Electricity (TWh)',FontWeight='bold')
title('Year-wise Surplus Electricity')


% % Set x-axis limits with gap
% gap = 0.5;  % Adjust the size of the gap as desired
% xlim([min(year) - gap, max(year) + gap]);
% ylim([0, max(case4) + gap]);


hold off