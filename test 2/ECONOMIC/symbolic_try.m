syms n

%% Defining Variables
operating_hrs = 4380; %hrs
surplus_electricity = 5.570638473620999e+09; %KWh
electrolyzer_size = surplus_electricity./operating_hrs;
lcoe = 0.051; % per KWh
r = 0.08;
tr = 0.2;
dr = 0.00525;
N = 20;
sp_h2 = 7.5;    % H2 selling price
stack_energy_consumption = 61.43; % KWh/Kg

ko = 301.04; k = 11603; a = 0.649; b = -27.33; 
vo = 2020; q = electrolyzer_size; v=2025;
capex_fitted = 1.*(ko + (k./q).*(q.^a)).*(v./vo).^b; % per KW

capex = (q.*capex_fitted).*1.20; % 20 percent installation cost
opex = 0.05.*capex + lcoe.*surplus_electricity;
mh2 = surplus_electricity./stack_energy_consumption;

%% Making LCOH Equation
one = symsum(opex./((1+r).^n),n,1,N);
two = tr*symsum((mh2.*((1-dr).^n).*sp_h2)./((1+r).^n),n,1,N);
three = symsum((mh2.*((1-dr).^n))./((1+r).^n),n,1,N);
lcoh = (capex + one + two)./three;


lcoh = vpa(subs(lcoh),3)

