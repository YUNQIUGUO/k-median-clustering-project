function [A,b,c,Aeq,beq]= lin(x,k)
    [~,n] = size(x);
    I = eye(n);
    beq = [ones(n,1);k];
    Y = zeros(n,n);
    l1 = zeros(1,n*n);
    l2 = ones(1,n); 
    l12 = [l1 l2];
    Aeq = [repmat(I,1,n),Y;l12];
    b = zeros(n*n,1);
    I1 = eye(n*n);
    b1 = ones(n,1);
    I2 = eye(n);
    YY = kron(I2,-b1);
    A = [I1 YY];
    %use norm to construct the c vector
    k = 1;
    for i = 1:n
        for j = 1:n
            %d(i,j) = norm (x(:,j)-x(:,i));
            d(i,j) = abs(x(1,j)-x(1,i))+abs(x(2,j)-x(2,i));
            c(k) = d(i,j);
            k = k + 1;
        end
    end
    c = [c zeros(1,n)];         
end