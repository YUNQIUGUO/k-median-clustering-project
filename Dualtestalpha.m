% The dual is doing maximizing problem
c = [ones(1,4) zeros(1, 16) -2]';
% there's no Aeq due to the reason that there's no equality condition
% x = [alpha_q, beta_pq,epsilon]';
O1 = ones(4,1);
I1 = eye(4);
A1 = kron(I1,O1);
I2 = eye(16); 
A2 = [A1 -I2 zeros(16,1)];
O2 = ones(1,4);
A11 = kron(I1,O2);
L = [zeros(4,4) A11 -ones(4,1)];
A = [A2;L];
% The distance function are just calculated with the Euclidean metric
b1 = [0 2 2 4 2 0 4 2 2 4 0 2 4 2 2 0];
b1 = b1';
b = [b1;zeros(4,1)];
lb = [-10000*ones(1,4) zeros(1,16) -Inf]';
ub = 10000*ones(21,1);
Aeq = [];
beq = [];
[x,fval] = linprog(-c,A,b,Aeq,beq,lb,ub)





