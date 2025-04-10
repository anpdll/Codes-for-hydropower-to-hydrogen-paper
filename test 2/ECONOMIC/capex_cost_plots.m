%% Electrolyzer cost with size
% ko = 301.04; k = 11603; a = 0.649; b = -27.33; 
% vo = 2020; q = logspace(3,6); v=2025;
% capex_fitted = 1.*(ko + (k./q).*(q.^a)).*(v./vo).^b;
% 
% semilogx(q,capex_fitted, LineWidth=1.5)
% grid on
% 
% xlim([0,max(q)])
% ylim([0, max(capex_fitted) + 178]);
% 
% xticks([10^3 10^4 10^5 10^6])
% xticklabels({'1 MW','10 MW','100 MW','1 GW'})
% 
% xlabel('Electrolyzer Installed Capacity',FontWeight='bold');
% ylabel('Cost of Electrolyzer ($/KW)',FontWeight='bold');
% title('Electrolyzer Cost with Size',FontWeight='bold');

%% Electrolyzer Cost with year
ko = 301.04; k = 11603; a = 0.649; b = -27.33; 
vo = 2020; q = 100000; v=2023:1:2030;
capex_fitted = 1.*(ko + (k./q).*(q.^a)).*(v./vo).^b;

bar(v,capex_fitted, 0.6)

% xlim([0,max(v)])
ylim([400, max(capex_fitted)+5]);

xlabel('Year',FontWeight='bold');
ylabel('Cost of Electrolyzer ($/KW)',FontWeight='bold');
title('100 MW Electrolyzer Cost with Year',FontWeight='bold');