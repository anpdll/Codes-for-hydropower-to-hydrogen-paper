out_mat = load('validation_outputs.mat');
out = out_mat.out;

stack_power = zeros(1,9);
for i = 1:1:9
    stack_power(i) = (out(i).logsout{4}.Values.Data(3600))*0.001;
end
system_power = [40 37 33 28 22 18 14 10 8];

percentage = ((system_power./stack_power)-1).*100;

% plotting experimental
plot(stack_power,percentage,Marker="o",MarkerSize=4, ...
    MarkerFaceColor="#7E2F8E",MarkerEdgeColor="#7E2F8E", ...
    LineStyle="--",LineWidth=1.2,Color='#D95319');
xlabel("Stack Power (KW)",FontWeight="bold");
ylabel("% of Stack Power for BOP",FontWeight="bold");
title("Percentage of Stack Power for BOP");
hold on

% plotting fitted
xdata_fit = 5.5:0.1:37;
fitted_percentage = 179.4839.*xdata_fit.^(-0.7143);
plot(xdata_fit,fitted_percentage,LineWidth=1.2, ...
    Color='#0072BD');

legend('Experimental BOP','Model BOP')

% Set x-axis limits edwith gap
gap = 0.5;  % Adjust the size of the gap as desired
xlim([5-2, max(stack_power) + 3]);
ylim([0, max(percentage) + 5]);


hold off

model_percentage = 179.4839.*stack_power.^(-0.7143);
rmse_error = rmse(model_percentage,percentage)
max_residual = max(abs(model_percentage - percentage))