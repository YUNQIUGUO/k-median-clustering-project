function [A,b,c,Aeq,beq,lb,ub]= lindual(x,k)
    [~,n] = size(x);
    c = [ones(1,n) zeros(1,n*n) -k 0 ];
    c = c';
    O1 = ones(n,1);
    I1 = eye(n);
    A1 = kron (I1,O1);
    I2 = eye (n*n);
    A2 = [A1 -I2 zeros(n*n,1) zeros(n*n,1)];
    O2 = ones(1,n);
    A11 = kron(I1,O2);
    L = [zeros(n,n) A11 -ones(n,1) zeros(n,1)];
    A = [A2;L];
    
    l = 1;
    for i = 1:n
        for j = 1:n
            d(i,j) = norm (x(:,j)-x(:,i));  
            %distance/metric may be varied %taxicab metric
            b1(l) = d(i,j);
            l = l + 1;
        end
    end
    b1 = b1';
    b = [b1;zeros(n,1)];
    In = eye(n);
    II = eye(2);
    L1 = -ones(n/2,1);
    %LL = kron (II,L1);
    % set all the alpha's to be equal
    Aeq = [In zeros(n,n*n) zeros(n,1) ones(n,1)];
    beq = zeros(n,1);
    
    lb = [-10000000*ones(1,n) zeros(1,n*n) -Inf -Inf ]';
    ub = 10000000*ones(n*(n+1)+2,1);
 
end

    