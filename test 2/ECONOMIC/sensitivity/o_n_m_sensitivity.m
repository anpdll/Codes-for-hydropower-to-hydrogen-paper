o_n_m_base = 0.05;
o_n_m = [0.8.*o_n_m_base o_n_m_base 1.2.*o_n_m_base];

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
year = 2025;

lcoh = lcoh_calculation_for_o_n_m(o_n_m,lcoe,operating_hrs,surplus_electricity,r,tr,dr,N,sp_h2,stack_energy_consumption,year);
save('o_n_m_lcoh_sensi.mat',"lcoh");