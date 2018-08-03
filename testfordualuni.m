x=rand(1,50)*5;
y=rand(1,50)*5;
X = [x;y];
X
scatter(x,y);
[A,b,c,Aeq,beq,lb,ub]= lindual(X,4);% clustering with l1 metric
[rtn,fval] = linprog(-c,A,b,Aeq,beq,lb,ub);
rtn
fval

