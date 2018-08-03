x_feasible = [1 0 0 0 1 zeros(1,15) 1]';
c = [ones(1,4) zeros(1, 16) -4];
O1 = ones(4,1);
I1 = eye(4);
A1 = kron(I1,O1);
I2 = eye(16); 
A2 = [A1 -I2 zeros(16,1)];
O2 = ones(1,4);
A11 = kron(I1,O2);
L = [zeros(4,4) A11 -ones(4,1)];
A = [A2;L];
b1 = [0 2 2 4 2 0 4 2 2 4 0 2 4 2 2 0];
b1 = b1';
b = [b1;zeros(4,1)];
A*x_feasible-b;
c*x_feasible

