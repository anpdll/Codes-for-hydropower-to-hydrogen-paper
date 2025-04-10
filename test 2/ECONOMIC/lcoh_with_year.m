operating_hrs = 4380; %hrs
load('surplus_electricity.mat');
surplus_electricity(1:5,:) = [];
surplus_electricity = surplus_electricity.*1000.*1000.*1000; % GWh to KWh
surplus_electricity = horzcat(0.5.*surplus_electricity,0.8.*surplus_electricity,surplus_electricity);
electrolyzer_size = surplus_electricity./operating_hrs;
lcoe = 0.051; % per KWh
r = 0.08;
tr = 0.2;
dr = 0.00525;
N = 20;
sp_h2 = 7.5;    % H2 selling price
sp_o2 = 0.054;% O2 selling price
stack_energy_consumption = 61.43;
year = 2025:1:2030;
year = year';

[lcoh, mh2] = lcoh_calculation(operating_hrs,surplus_electricity,lcoe,r,tr,dr,N,sp_h2,stack_energy_consumption,year);

% for 50% SE
% b = bar(year, lcoh(:,1),0.7);
% b.FaceColor = "#7EA00E";
% ylim([5.56,5.74])
% title('LCOH for 50% SE Use',FontWeight='bold');
% xtips1 = b.XEndPoints;
% ytips1 = b.YEndPoints;
% labels1 = string(b.YData);
% text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom')

% For 80% SE use
% b = bar(year, lcoh(:,2),0.7);
% b.FaceColor = '#E25B45';
% ylim([5.56,5.74])
% title('LCOH for 80% SE Use',FontWeight='bold');
% xtips1 = b.XEndPoints;
% ytips1 = b.YEndPoints;
% labels1 = string(b.YData);
% text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom')

% % For 100% SE use
b = bar(year, lcoh(:,3),0.7);
b.FaceColor = "#08979D";
ylim([5.56,5.74])
title('LCOH for 100% SE Use',FontWeight='bold');
xtips1 = b.XEndPoints;
ytips1 = b.YEndPoints;
labels1 = string(b.YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')


xlabel('Year',FontWeight='bold');
ylabel('LCOH ($/KG)',FontWeight='bold');



