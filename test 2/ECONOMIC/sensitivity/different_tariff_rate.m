lcoe_base = 0.051; % per KWh
lcoe = 0.03:0.0001:0.08;
lcoe_2 = [0.036 0.051 0.063 0.077];

surplus_electricity = 5.570638473620999e+09;
operating_hrs = 4380; %hrs
electrolyzer_size = surplus_electricity./operating_hrs;
r = 0.08;
tr = 0.2;
dr = 0.00525;
N = 20;
sp_h2 = [7.5,9];    % H2 selling price
stack_energy_consumption = 61.43;
year = 2025;

lcoh_1 = lcoh_calculation(operating_hrs,surplus_electricity,lcoe,r,tr,dr,N,sp_h2(1),stack_energy_consumption,year);
lcoh_2 = lcoh_calculation(operating_hrs,surplus_electricity,lcoe,r,tr,dr,N,sp_h2(2),stack_energy_consumption,year);

lcoh_3 = lcoh_calculation(operating_hrs,surplus_electricity,lcoe_2,r,tr,dr,N,sp_h2(1),stack_energy_consumption,year);
lcoh_4 = lcoh_calculation(operating_hrs,surplus_electricity,lcoe_2,r,tr,dr,N,sp_h2(2),stack_energy_consumption,year);

scatter_data = vertcat(lcoh_3,lcoh_4);



plot(lcoe,lcoh_1, LineWidth = 1.5);
hold on
plot(lcoe, lcoh_2, Linewidth = 1.5);


scatter(lcoe_2(1,1),scatter_data(:,1),"square",MarkerEdgeColor="black",LineWidth=1.5);
scatter(lcoe_2(1,2),scatter_data(:,2),"o",MarkerEdgeColor="black",LineWidth=1.5);
scatter(lcoe_2(1,3),scatter_data(:,3),"^",MarkerEdgeColor="black",LineWidth=1.5);
scatter(lcoe_2(1,4),scatter_data(:,4),"d",MarkerEdgeColor="black",LineWidth=1.5);

legend('$7.5 H_2 SP', '$9 H_2 SP','Off Peak LCOE',"",'Base LCOE',"",'Normal LCOE',"",'Peak LCOE',"",Location ='northwest');

xticks([0.03 0.04 0.05 0.06 0.07 0.08])
yticks([4 5 6 7 8]);
xlabel("Increasing LCOE ($/KWh)",FontWeight='bold');
ylabel("LCOH ($/KG)",FontWeight='bold');
title("LCOH with LCOE Variation");

xlim([0.028 0.082]);
ylim([3.9 8.1]);
hold off