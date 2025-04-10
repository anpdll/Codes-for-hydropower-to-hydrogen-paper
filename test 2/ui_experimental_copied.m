T = 72;
i = 130/0.2082;
a1 = 0.0004296;
a2 = -4.153e-07;
b1 = 0.05171;
b2 = -2.415;
b3 = 8134;
s1= 0.1803;
s2= 0;
s3=0;

U_ohm = (a1 + a2*T)*i;
U_act = (s1 + s2*T + s3*(T^2))*log10((b1 + b2/T + b3/(T^2))*i +1);
% U_cell = 1.23 + U_act + U_ohm
U_cell = 1.21 + U_act + U_ohm
stack_voltage = 75*U_cell