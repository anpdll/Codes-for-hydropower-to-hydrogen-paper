lcoe_base = 0.051; % per KWh
lcoe = [0.8.*lcoe_base lcoe_base 1.2.*lcoe_base];

surplus_electricity = 5.570638473620999e+09;
operating_hrs = 4380; %hrs
electrolyzer_size = surplus_electricity./operating_hrs;
r = 0.08;
tr = 0.2;
dr = 0.00525;
N = 20;
sp_h2 = 7.5;    % H2 selling price
stack_energy_consumption = 61.43;
year = 2025;

lcoh = lcoh_calculation(operating_hrs,surplus_electricity,lcoe,r,tr,dr,N,sp_h2,stack_energy_consumption,year)
save('lcoe_lcoh_sensi.mat',"lcoh");