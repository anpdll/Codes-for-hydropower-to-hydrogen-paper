%% Loading Data
a = load("capex_lcoh_sensi.mat");
b = load("o_n_m_lcoh_sensi.mat");
c = load("lcoe_lcoh_sensi.mat");
d = load("discount_rate_lcoh_sensi.mat");
e = load("tax_rate_lcoh_sensi.mat");
f = load("plant_factor_lcoh_sensi.mat");
g = load("degradation_rate_lcoh_sensi.mat");
h = load("sp_h2_lcoh_sensi.mat");

%% Assigning Data
capex = a.lcoh;
o_n_m = b.lcoh;
lcoe = c.lcoh;
r = d.lcoh;
tr = e.lcoh;
operational_hour = f.lcoh;
dr = g.lcoh;
sp_h2 = h.lcoh;

%% Assembling Data
sensi_data = round(vertcat(capex,o_n_m,lcoe,r,tr,operational_hour,dr,sp_h2),2);
sensi_data = flipud(sensi_data);
minus = sensi_data(:,1)-sensi_data(:,2);
plus = sensi_data(:,3)-sensi_data(:,2);
new_data = horzcat(minus,plus);


%% Plotting
x = categorical({'SP_{H2}','DR','CF','TR','r','LCOE','O & M','CAPEX'});
x = reordercats(x,{'SP_{H2}','DR','CF','TR','r','LCOE','O & M','CAPEX'});

% x = categorical({'CAPEX','O & M','LCOE','r','TR','CF','DR','SP_{H2}'});
% x = reordercats(x,{'CAPEX','O & M','LCOE','r','TR','CF','DR','SP_{H2}'});

ba = barh(new_data,0.8,'stacked', 'FaceColor','flat')
ba(1).CData = [151,202,219]./255;
ba(2).CData = [1,138,190]./255;
set(gca,'ytick',[])

xticks([-0.8 -0.6 -0.4 -0.2 0 0.2 0.4 0.6 0.8])
xticklabels({'4.92','5.12','5.32','5.52','5.72','5.92','6.12','6.32','6.52'})

xtips2 = zeros(1,8);
ytips2 = ba(1).XEndPoints;
labels2 = ["SP_{H2}","DR","CF","TR","r","LCOE","O & M","CAPEX"];
text(xtips2,ytips2,labels2,'HorizontalAlignment','right',...
    'VerticalAlignment','middle')

xlabel("LCOH ($/KG)",FontWeight='bold');
title("Sensitivity of Variables on LCOH",FontWeight='bold');
legend('20% Decrease','20% Increase',location='northwest');

