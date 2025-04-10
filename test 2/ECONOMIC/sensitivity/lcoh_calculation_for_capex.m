function lcoh = lcoh_calculation_for_capex(capex,surplus_electricity,lcoe,r,tr,dr,N,sp_h2,stack_energy_consumption)

syms n

%% Defining Variables

opex = 0.05.*capex + lcoe.*surplus_electricity;
mh2 = surplus_electricity./stack_energy_consumption;

%% Making LCOH Equation
one = symsum(opex./((1+r).^n),n,1,N);
two = tr*symsum((mh2.*((1-dr).^n).*sp_h2)./((1+r).^n),n,1,N);
three = symsum((mh2.*((1-dr).^n))./((1+r).^n),n,1,N);
lcoh = (capex + one + two)./three;

lcoh = vpa(subs(lcoh),3);
end

