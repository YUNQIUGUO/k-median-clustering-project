rng('default')

s = rng;
X = normrnd(3,5,[1 10]);  % mu=3, sigma=5,normal distribution #1
X
plot(X(1,:),0,'x','Color','r');
pause;
[A,b,c,Aeq,beq]= lin(X,2);
lb = zeros(1,110);
ub = ones(1,110);
rtn = linprog(c,A,b,Aeq,beq,lb,ub);
rtn
zpq = rtn(1:100,:);
zpq
zz = reshape(zpq,[10,10]);
zz = zz';
yp = rtn(101:110,:);
ctr = find(yp);
ctr
% two centers
X = X';
c1 = X(ctr(1),:);
c2 = X(ctr(2),:);
cc = [c1;c2];
plot(cc(:,1),0,'*','Color','r'); 
pause;
hold on
%Highlight the two centers 
gp1 = zz(ctr(1),:);
g1 = find(gp1);
gg1 = X(g1,:)
plot(gg1(:,1),0,'o','Color','b');
pause;
hold on
gp2 = zz(ctr(2),:);
g2 = find(gp2);
gg2 = X(g2,:)
plot(gg2(:,1),0,'o','Color','g');
gp = [gp1;gp2];   
% 
% % rng(s);
% % r2 = normrnd(-3,5,[1 6]); %mu = -3, sigma = 5, normal distribution #2
% % r2
% % 
