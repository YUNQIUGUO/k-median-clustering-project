%vector c
c =[0 1 2 20 21 22 1 0 1 19 20 21 2 1 0 18 19 20 20 19 18 0 1 2 21 20 19 1 0 1 22 21 20 2 1 0 zeros(1,6)] ;
% c is a 1*36 vector
b1 = ones(6,1);
b2 = zeros(36,1);
beq = [b1;2];
I = eye(6);
Y = zeros(6,6);
l1 = zeros(1,36);
l2 = ones(1,6);
l12 = [l1,l2];
Aeq = [repmat(I,1,6),Y;l12];
b= b2;
I1 = eye(36);
y = zeros(6,1);
% Y1 = [-b1 y y y y y];
% Y2 = [y -b1 y y y y];
% Y3 = [y y -b1 y y y];
% Y4 = [y y y -b1 y y];
% Y5 = [y y y y -b1 y];
% Y6 = [y y y y y -b1];
% YY = [Y1;Y2;Y3;Y4;Y5;Y6];
YY = kron (I,-b1);
YY
A = [I1 YY];
%lower bound and upper bound
lb = zeros(1,42);
ub = ones(1,42);
zy = linprog(c,A,b,Aeq,beq,lb,ub)





