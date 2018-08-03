% for the same set of simulated uniformly data, test the objective value
% for different k.    (k = 2,3,4,5)
x=rand(1,100)*5;
y=rand(1,100)*5;
X = [x;y];
zoj = [];
scatter(x,y)
for k = 2:10
[A,b,c,Aeq,beq]= lin(X,k);
lb = zeros(1,10100);
ub = ones(1,10100);
[rtn,zval] = linprog(c,A,b,Aeq,beq,lb,ub);
zoj =[zoj zval];
end
zoj
% difference vector
zd = [];
n = length(zoj);
for i = 1:n-1
    diff = zoj(:,i) - zoj(:,i+1);
    zd = [zd diff];
end
zd
kv= [2 3 4 5 6 7 8 9 10];
plot(kv,zoj,'o');
hold on
dv = [2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5];
plot(dv,zd,'o');