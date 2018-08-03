% k = 4 clustering
count = [];
ioni = [];
tic
for i = 1:30
x=rand(1,100)*5;
y=rand(1,100)*5;
X = [x;y];
scatter(x,y)
[A,b,c,Aeq,beq]= lin(X,4);
lb = zeros(1,10100);
ub = ones(1,10100);
rtn = linprog(c,A,b,Aeq,beq,lb,ub);
zpq = rtn(1:10000,:);
zz = reshape(zpq,[100,100]);
zz = zz';
yp = rtn(10001:10100,:);
ctr = find(yp);
ctr
n = length(ctr);
% see whether the solution is integral or not. If the solution are all
% contained of integral entries, then n should be 3
if n == 4
    ig = 0;
else
    ig = 1; % non-integral solution
end
ig
ioni= [ioni ig];
count = [count i];
end
toc
ioni
count
plot(count,ioni,'x');
