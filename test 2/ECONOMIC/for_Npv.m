syms n 

%% Defining Variables
Operating_hrs = 4380; %hrs
surplus_electricity = 22776e+06; %KWh
electrolyzer_size = surplus_electricity./Operating_hrs;
lcoe = 0.051; % per KWh
r = 0.08;
tr = 0.2;
dr = 0.00525;
N = 3;
sp_h2 = 6;    % H2 selling price
sp_o2 = 0.054;% O2 selling price
k_o = 0.1;
stack_energy_consumption = 61.43; % KWh/Kg

ko = 301.04; k = 11603; a = 0.649; b = -27.33; 
vo = 2020; q = electrolyzer_size; v=2023;
capex_fitted = 1.*(ko + (k./q).*(q.^a)).*(v./vo).^b; % per KW

capex = (q.*capex_fitted).*1.20; % 20 percent installation cost
opex = 0.05.*capex + lcoe.*surplus_electricity;
mh2 = surplus_electricity./stack_energy_consumption;

%% Making npv Equation
one = symsum(opex./((1+r).^n),n,1,N);

rev1 = symsum((mh2.*((1-dr).^n).*sp_h2)./((1+r).^n),n,1,N);
rev2 = symsum((8.*k_o.*mh2.*((1-dr).^n).*sp_o2)./((1+r).^n),n,1,N);
revn = rev1+rev2;

two = tr.*revn;
three = revn;
four= tr.*one;

npv = three + four - capex - one - two;

npv = (vpa(subs(npv),20))./1e+09


