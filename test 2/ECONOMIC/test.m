op1 = 5;
op2 = 10;
op3 = 15;
r = 0.08;
syms n
one = symsum(op1/(1+r)^n,n,1,20);
test_1 = vpa(subs(one));

two = symsum(op2/(1+r)^n,n,1,20);
test_2 = vpa(subs(two));

three = one + two;

test_3 = test_1 + test_2
test_4 = vpa(subs(three))
test_5 = vpa(subs(symsum(op3/(1+r)^n,n,1,20)))

