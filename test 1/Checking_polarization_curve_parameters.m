%% Dynamic Mass Transfers parameters
T = 80;
a1 = 0.8;
a2 = -0.00763;
b1 = 20;
b2 = 0.1;
b3 = 3.5e+05;
s1= 0.1795;
s2= 0;
s3=0;

%i = 100/0.06;
i =  0:0.01:0.35;
% i=0.1717;

U_rev = 1.2;
U_ohm = (a1 + a2*T)*i;
U_act = (s1 + s2*T + s3*(T^2))*log((b1 + b2/T + b3/(T^2))*i +1);
U_cell = U_rev + U_act + U_ohm;

%% Modelling Energy Demand parameters
% T = 345-273;
% a1 = 0.0004296;
% a2 = -4.153e-07;
% b1 = 0.05171;
% b2 = -2.415;
% b3 = 8134;
% s1= 0.1803;
% s2= 0;
% s3=0;
% 
% %i = 100/0.06;
%  i =  0:0.01:960;
% %i=960;
% 
% U_rev = 1.2;
% U_ohm = (a1 + a2*T)*i;
% U_act = (s1 + s2*T + s3*(T^2))*log10((b1 + b2/T + b3/(T^2))*i +1);
% U_cell = U_rev + U_act + U_ohm;


%% plotting
 plot(i,U_cell,'DisplayName','U__cell)');
% hold on
% plot(i,U_act,'DisplayName','U__act)');
% plot(i,U_ohm,'DisplayName','U__ohm)');
% hold off
