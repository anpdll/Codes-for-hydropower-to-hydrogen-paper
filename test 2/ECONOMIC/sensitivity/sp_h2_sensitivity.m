sp_h2_base = 7.5;    % H2 selling price
sp_h2 = [0.8.*sp_h2_base sp_h2_base 1.2.*sp_h2_base];

surplus_electricity = 5.570638473620999e+09;
operating_hrs = 4380; %hrs
electrolyzer_size = surplus_electricity./operating_hrs;
lcoe = 0.051; % per KWh
r = 0.08;
tr = 0.2;
dr = 0.00525;
N = 20;
stack_energy_consumption = 61.43;
year = 2025;

lcoh = lcoh_calculation(operating_hrs,surplus_electricity,lcoe,r,tr,dr,N,sp_h2,stack_energy_consumption,year)
save('sp_h2_lcoh_sensi.mat',"lcoh");