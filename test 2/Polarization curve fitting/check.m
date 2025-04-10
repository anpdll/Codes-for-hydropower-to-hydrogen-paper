%% Dynamic Mass Transfers parameters
T = 72;
a1 = 5.463162;
a2 = -0.044073;
b1 = 1197.525356;
b2 = -38432.6689;
b3 = 1322570.138;
s1= 0.161;
s2= 0;
s3=0;

%i = 100/0.06;
i =  0:0.001:0.15;
% i=0.1717;

U_rev = 1.2;
U_ohm = (a1 + a2*T)*i;
U_act = (s1 + s2*T + s3*(T^2))*log((b1 + b2/T + b3/(T^2))*i +1);
U_cell = U_rev + U_act + U_ohm;

A72 = readmatrix("72_degree_corrected.csv");
x72 = A72(:,1);
y72 = A72(:,2);
plot(x72,y72,"--",LineWidth=2,Color="#D95319");
hold on

%% plotting
 plot(i,U_cell,'DisplayName','U__cell)',LineWidth=1.5,Color="#0072BD");

% hold on
% plot(i,U_act,'DisplayName','U__act)');
% plot(i,U_ohm,'DisplayName','U__ohm)');

xlabel('Current Density (A/cm^2)',FontWeight='bold');
ylabel('Cell Voltage (V)',FontWeight='bold');
legend('Experimental','Model',Location='northwest');
title('UI Curve for 72 °C',FontWeight='bold');

xticks([0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16]);
yticks([1 1.2 1.4 1.6 1.8 2 2.2 2.4]);
ylim([1,2.5]);




hold off