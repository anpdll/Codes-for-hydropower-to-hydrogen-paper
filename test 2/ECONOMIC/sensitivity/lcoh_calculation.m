function lcoh = lcoh_calculation(operating_hrs,surplus_electricity,lcoe,r,tr,dr,N,sp_h2,stack_energy_consumption,year)

syms n

%% Defining Variables
electrolyzer_size = surplus_electricity./operating_hrs;

ko = 301.04; k = 11603; a = 0.649; b = -27.33; 
vo = 2020; q = electrolyzer_size; v=year;
capex_fitted = 1.*(ko + (k./q).*(q.^a)).*(v./vo).^b; % per KW

capex = (q.*capex_fitted).*1.20; % 20 percent installation cost
opex = 0.05.*capex + lcoe.*surplus_electricity;
mh2 = surplus_electricity./stack_energy_consumption;

%% Making LCOH Equation
one = symsum(opex./((1+r).^n),n,1,N);
two = tr*symsum((mh2.*((1-dr).^n).*sp_h2)./((1+r).^n),n,1,N);
three = symsum((mh2.*((1-dr).^n))./((1+r).^n),n,1,N);
lcoh = (capex + one + two)./three;

lcoh = vpa(subs(lcoh),3);
end

