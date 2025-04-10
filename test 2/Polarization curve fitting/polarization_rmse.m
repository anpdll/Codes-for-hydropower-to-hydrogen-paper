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

A72 = readmatrix("72_degree_corrected.csv");
x72 = A72(:,1);
y72 = A72(:,2);
i = x72;

U_rev = 1.2;
U_ohm = (a1 + a2*T)*i;
U_act = (s1 + s2*T + s3*(T^2))*log((b1 + b2/T + b3/(T^2))*i +1);
U_cell = U_rev + U_act + U_ohm;


plot(x72,y72,"--");
hold on

%% plotting
 plot(i,U_cell,'DisplayName','U__cell)');
% hold on
% plot(i,U_act,'DisplayName','U__act)');
% plot(i,U_ohm,'DisplayName','U__ohm)');
hold off

%% rmse
rmse_error = rmse(U_cell,y72)
max_residual = max(abs(U_cell - y72))