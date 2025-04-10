out_mat = load('validation_outputs.mat');
out = out_mat.out;

current = [220 200 175 150 125 100 75 50 41];

h2_nm3_hr = zeros(1,9);

for i = 1:1:9
    h2_nm3_hr(i) = out(i).logsout{2}.Values.Data(3600);
end

h2_exp = [4.7 4.2 3.7 3.1 2.5 1.9 1.2 0.5 0.2];

plot(current,h2_exp,"--",LineWidth=1.2,Color="#D95319", ...
    Marker="o",MarkerSize=4, MarkerFaceColor="#7E2F8E", ...
    MarkerEdgeColor="#7E2F8E")
hold on

plot(current,h2_nm3_hr,LineWidth=1.2,Color="#0072BD")
xlabel('Stack Current (A)',FontWeight="bold");
ylabel('Hydrogen Flow (Nm^3/hr)',FontWeight="bold");
title("Measured and Model Hydrogen Flow",FontWeight="bold");
legend("Measured","Model",Location="northwest");

% Set x-axis limits with gap
xlim([min(current)-15, max(current) + 15]);
ylim([0, max(h2_nm3_hr) + 0.5]);


hold off

rmse_error = rmse(h2_nm3_hr,h2_exp)
max_residual = max(abs(h2_nm3_hr - h2_exp))