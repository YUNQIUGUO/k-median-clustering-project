clf
axis equal
hold on
x1=1;
y1=1;
rc1=1;
[x,y,z] = cylinder(rc1,200);
plot(x(1,:)+x1,y(1,:)+y1,'r')
X1 = zeros(10,2);
for t=1:10 
[x,y]=cirrdnPJ(x1,y1,rc1);
 X1(t,:) = [x y];
plot(x,y,'x'); 
end
hold on
x2= 5;
y2 = 5;
rc2 = 2;
[x,y,z] = cylinder(rc2,200);
plot(x(1,:)+x2,y(1,:)+y2,'r')
X2 = zeros(10,2);
for t=1:10
[x,y]=cirrdnPJ(x2,y2,rc2);
X2(t,:) = [ x y];
plot(x,y,'x');
end
X = [X1;X2];
pause;
hold on
[A,b,c,Aeq,beq]= lin(X',2);
lb = zeros(1,420);
ub = ones(1,420);
rtn = linprog(c,A,b,Aeq,beq,lb,ub);
zpq = rtn(1:400,:);
zpq
zz = reshape(zpq,[20,20]);
zz = zz';
yp = rtn(401:420,:);
ctr = find(yp);
ctr
% two centers
c1 = X(ctr(1),:);
c2 = X(ctr(2),:);
cc = [c1;c2];
plot(cc(:,1),cc(:,2),'*'); 
pause;
hold on
%Highlight the two centers 
gp1 = zz(ctr(1),:);
g1 = find(gp1);
gg1 = X(g1,:);
plot(gg1(:,1),gg1(:,2),'o');
pause;
gp2 = zz(ctr(2),:);
g2 = find(gp2);
gg2 = X(g2,:);
plot(gg2(:,1),gg2(:,2),'o');
gp = [gp1;gp2];                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   


