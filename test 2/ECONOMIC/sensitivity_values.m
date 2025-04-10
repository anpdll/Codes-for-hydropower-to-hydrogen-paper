% Reference Year is taken as 2025
% Surplus Electricity Usage is taken as 50%


surplus_electricity = 5.570638473620999e+09; % 50 percent
capex_kw = 3.295805060261259e+02; %per KW

capex_base = 5.486055555709722e+08;
opex_base = 3.115328399332196e+08;

operating_hrs = 4380; %hrs
electrolyzer_size = surplus_electricity./operating_hrs;
lcoe = 0.051; % per KWh
r = 0.08;
tr = 0.2;
dr = 0.00525;
N = 20;
sp_h2 = 7.5;    % H2 selling price
stack_energy_consumption = 61.43;

mh2 = surplus_electricity./stack_energy_consumption;

