cf = 0.1:0.001:0.8;
operating_hrs = cf.*8760;

surplus_electricity = 5.570638473620999e+09;
electrolyzer_size = surplus_electricity./operating_hrs;
lcoe = 0.051; % per KWh
r = 0.08;
tr = 0.2;
dr = 0.00525;
N = 20;
sp_h2 = 7.5;    % H2 selling price
stack_energy_consumption = 61.43;
year = 2025;

lcoh = lcoh_calculation(operating_hrs,surplus_electricity,lcoe,r,tr,dr,N,sp_h2,stack_energy_consumption,year);


plot(cf,lcoh,LineWidth= 1.2,Color = '#7E2F8E');
xlabel('Capacity Factor (%)',FontWeight='bold');
ylabel('LCOH ($/KG)',FontWeight='bold');
title('CF Effect on LCOH',FontWeight='bold');
yticks([5 6 7 8 9]);
xlim([0.08, 0.82])
ylim([4.8, 9.4]);



