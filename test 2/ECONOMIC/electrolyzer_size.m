load('surplus_electricity.mat');

year = 2025:1:2030;
surplus_electricity(1:5,:) = [];
operating_hours = 4380;

fifty = 0.5.*surplus_electricity.*1000; % *1000 to convert tw to gw
eighty = 0.8.*surplus_electricity.*1000;
hundred = surplus_electricity.*1000;

es_f = fifty./operating_hours;
es_e = eighty./operating_hours;
es_h = hundred./operating_hours;

% plot(year,es_h, LineWidth=1.2);
% hold on
% plot(year,es_e, LineWidth=1.2);
% plot(year,es_f, LineWidth=1.2);
% legend('100% SE','80% SE','50% SE',Location='northwest');
% xticks(year)
% xlim([2025-0.6,2030+0.6]);
% ylim([min(es_f)-0.5,max(es_h)+0.5]);
% hold off

bar_value = horzcat(es_f,es_e,es_h)';
b = bar(year,bar_value,0.8);
b(1).FaceColor = [.2 .6 .5];
b(3).FaceColor = "#0072BD";

xlabel('Year',FontWeight='bold');
ylabel('Electrolyzer Size (GW)','FontWeight','bold');
title('Required Electrolyzer Size for Utilizing SE',FontWeight='bold');
legend('50% SE','80% SE', '100% SE',location='northwest');
ylim([0,6.4]);

% xtips1 = b(1).XEndPoints;
% ytips1 = b(1).YEndPoints;
% labels1 = string(sprintf('%.1f', b(1).YData));
% text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom')
%
% xtips2 = b(2).XEndPoints;
% ytips2 = b(2).YEndPoints;
% labels2 = string(sprintf('%.1f', b(2).YData));
% text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom')
% 
% xtips3 = b(3).XEndPoints;
% ytips3 = b(3).YEndPoints;
% labels3 = string(sprintf('%.1f', b(3).YData));
% text(xtips3,ytips3,labels3,'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom')
