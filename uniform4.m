x=rand(1,4)*5;
y=rand(1,4)*5;
X = [x;y];
scatter(x,y)
[A,b,c,Aeq,beq]= lin(X,4);
lb = zeros(1,20);
ub = ones(1,20);
rtn = linprog(c,A,b,Aeq,beq,lb,ub);
rtn
zpq = rtn(1:16,:);
zz = reshape(zpq,[4,4]);
zz = zz';
yp = rtn(17:20,:);
yp
ctr = find(yp);
ctr
% two centers
X = X';
c1 = X(ctr(1),:);
c2 = X(ctr(2),:);
c3 = X(ctr(3),:);
c4 = X(ctr(4),:);
% c5 = X(ctr(5),:);
cc = [c1;c2;c3;c4];
plot(cc(:,1),cc(:,2),'*'); 
hold on
%Highlight the two centers 
gp1 = zz(ctr(1),:);
g1 = find(gp1);
gg1 = X(g1,:);
plot(gg1(:,1),gg1(:,2),'o');
gp2 = zz(ctr(2),:);
g2 = find(gp2);
gg2 = X(g2,:);
plot(gg2(:,1),gg2(:,2),'o');
gp3 = zz(ctr(3),:);
g3 = find(gp3);
gg3 = X(g3,:);
plot(gg3(:,1),gg3(:,2),'o');
gp4 = zz(ctr(4),:);
g4 = find(gp4);
gg4 = X(g4,:);
plot(gg4(:,1),gg4(:,2),'o');