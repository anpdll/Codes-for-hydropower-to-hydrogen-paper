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
mh2 = mh2./1e+06;

b = bar(year, mh2,0.7);
b(1).FaceColor = "#7EA00E";
b(2).FaceColor = "#E25B45";
b(3).FaceColor = "#08979D";
legend('50% SE','80% SE','100% SE',location='northwest');

xlabel('Year',FontWeight='bold');
ylabel('Hydrogen Production (Kton/year)',FontWeight='bold');
title("Hydrogen Production Using Surplus Electricity",FontWeight='bold');