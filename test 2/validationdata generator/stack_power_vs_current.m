out_mat = load('validation_outputs.mat');
out = out_mat.out;

current = [220 200 175 150 125 100 75 50 41];

stack_power = zeros(1,9);

for i = 1:1:9
    stack_power(i) = (out(i).logsout{4}.Values.Data(3600))*0.001;
end

fitted_percentage = 179.4839.*stack_power.^(-0.7143);
system_power_exp = [40 37 33 28 22 18 14 10 8];
stack_power_exp = system_power_exp - fitted_percentage.*0.01.*stack_power;




plot(current,stack_power_exp,"--",LineWidth=1.2,Color="#D95319", ...
    Marker="o",MarkerSize=4, MarkerFaceColor="#7E2F8E", ...
    MarkerEdgeColor="#7E2F8E")
hold on

plot(current,stack_power,LineWidtdh=1.2,Color="#0072BD")
xlabel('Stack Current (A)',FontWeight="bold");
ylabel('Stack Power (KW)',FontWeight="bold");
title("Measured and Model Stack Power",FontWeight="bold");
legend("Measured","Model",Location="northwest");

% Set x-axis limits with gap
xlim([min(current)-15, max(current) + 15]);
ylim([0, max(stack_power) + 5]);


hold off

rmse_error = rmse(stack_power,stack_power_exp)
max_residual = max(abs(stack_power_exp - stack_power))