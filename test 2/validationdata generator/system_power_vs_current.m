out_mat = load('validation_outputs.mat');
out = out_mat.out;

current = [220 200 175 150 125 100 75 50 41];

stack_power = zeros(1,9);

for i = 1:1:9
    stack_power(i) = (out(i).logsout{4}.Values.Data(3600))*0.001;
end

system_power_exp = [40 37 33 28 22 18 14 10 8];
bop_percent = 179.4839.*stack_power.^(-0.7143);
bop_power = (bop_percent./100).*stack_power;
system_power = stack_power+bop_power;


plot(current,system_power_exp,"--",LineWidth=1.2,Color="#D95319", ...
    Marker="o",MarkerSize=4, MarkerFaceColor="#7E2F8E", ...
    MarkerEdgeColor="#7E2F8E")
hold on

plot(current,system_power,LineWidth=1.2,Color="#0072BD")
xlabel('Stack Current (A)',FontWeight="bold");
ylabel('System Power (KW)',FontWeight="bold");
title("Measured and Model System Power",FontWeight="bold");
legend("Measured","Model",Location="northwest");

% Set x-axis limits with gap
xlim([min(current)-15, max(current) + 15]);
ylim([0, max(system_power) + 5]);


hold off

rmse_error = rmse(system_power,system_power_exp)
max_residual = max(abs(system_power_exp - system_power))