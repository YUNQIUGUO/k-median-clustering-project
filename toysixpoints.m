x = [1 2 3 -1 -2 -3; 1 2 3 -1 -2 -3];
k = 2;
title('Toy Six Points');
plot(x(1,:),x(2,:),'.');
pause;
hold on
[A,b,c,Aeq,beq]= lin(x,k);
lb = zeros(1,42);
ub = ones(1,42);
result = linprog(c,A,b,Aeq,beq,lb,ub);
zpq = result(1:36,:);
zpq
zz = reshape(zpq,[6,6]);
zz = zz';
zz
yp = result(37:42,:);
yp
ctr = find(yp);
ctr
c1 = x(:,ctr(1));
c2 = x(:,ctr(2));
cc = [c1 c2];
cc
plot(cc(1,:),cc(2,:),'x','LineWidth',5); 
pause;
hold on
gp1 = zz(ctr(1),:);
g1 = find(gp1);
gg1 = x(:,g1);
plot(gg1(1,:),gg1(2,:),'o');
pause;
gp2 = zz(ctr(2),:);
g2 = find(gp2);
gg2 = x(:,g2);
plot(gg2(1,:),gg2(2,:),'o');
legend('Input Data Points','Center','Cluster 1','Cluster 2');
pause;
gp = [gp1;gp2];
