%% Reading and Extractic datas

out_mat = load('validation_outputs.mat');
out = out_mat.out;

current = [220 200 175 150 125 100 75 50 41];

h2_kg_hr = zeros(1,9);
h2_nm3_hr = zeros(1,9);
stack_power = zeros(1,9);
U_cell = zeros(1,9);

for i = 1:1:9
    h2_kg_hr(i) = out(i).logsout{1}.Values.Data(3600);
    h2_nm3_hr(i) = out(i).logsout{2}.Values.Data(3600);
    stack_power(i) = out(i).logsout{4}.Values.Data(3600);
    U_cell(i) = out(i).logsout{5}.Values.Data(3600);
end

%% Plotting

% Hydrogen Kg

