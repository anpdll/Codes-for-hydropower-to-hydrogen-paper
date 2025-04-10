capex_base = 5.486055555709722e+08;
capex = [0.8.*capex_base capex_base 1.2.*capex_base];


surplus_electricity = 5.570638473620999e+09;
operating_hrs = 4380; %hrs
electrolyzer_size = surplus_electricity./operating_hrs;
lcoe = 0.051; % per KWh
r = 0.08;
tr = 0.2;
dr = 0.00525;
N = 20;
sp_h2 = 7.5;    % H2 selling price
stack_energy_consumption = 61.43;

lcoh = lcoh_calculation_for_capex(capex,surplus_electricity,lcoe,r,tr,dr,N,sp_h2,stack_energy_consumption);
save('capex_lcoh_sensi',"lcoh");