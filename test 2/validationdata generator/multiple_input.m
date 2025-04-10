open_system('combined_electrolyzer.slx');

CurrentValues = [220 200 175 150 125 100 75 50 41];
spv_length = length(CurrentValues);

for i = spv_length:-1:1
    in(i) = Simulink.SimulationInput('combined_electrolyzer');
    in(i) = in(i).setBlockParameter('combined_electrolyzer/I_el',...
        'Value',num2str(CurrentValues(i)));
end

% out = parsim(in,'ShowSimulationManager','on','ShowProgress','on');
out = parsim(in,'ShowProgress','on');


test = out(1,1).logsout.Name{4}.values.Data(3600)