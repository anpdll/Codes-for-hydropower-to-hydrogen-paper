tr_base = 0.2;
tr = [0 0.05 0.10 0.15 0.20];

surplus_electricity = 5.570638473620999e+09;
operating_hrs = 4380; %hrs
electrolyzer_size = surplus_electricity./operating_hrs;
lcoe = 0.051; % per KWh
r = 0.08;
dr = 0.00525;
N = 20;
sp_h2 = 7.5;    % H2 selling price
stack_energy_consumption = 61.43;
year = 2025;

lcoh = round(lcoh_calculation(operating_hrs,surplus_electricity,lcoe,r,tr,dr,N,sp_h2,stack_energy_consumption,year),2);

x = categorical({'No Tax','5% TR','10% TR','15% TR','20% TR'});
x = reordercats(x,{'No Tax','5% TR','10% TR','15% TR','20% TR'});
b = bar(x,lcoh,0.7,'FaceColor',[8 151 144]./255);

xtips2 = b.XEndPoints;
ytips2 = b.YEndPoints;
labels2 = string(b.YData);
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')

xlabel('Tax Rate',FontWeight='bold');
ylabel('LCOH ($/KG)',FontWeight='bold');
title('LCOH with Tax Rate',FontWeight='bold');

ylim([3,6.3])
