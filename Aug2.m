clf
axis equal
hold on
c_ix = - sqrt(2)/2;
c_iy = 0;
c_jx = sqrt(2)/2;
c_jy = 0;
plot(c_ix,c_iy,'.');
hold on
plot(c_jx,c_jy,'.');
hold on
X = -2:0.1:2;
Y = 0 * ones(size(X));
plot(X, Y);
hold on
Y1 = -1:0.1:1;
X1 = 0 * ones(size(Y1));
plot(X1, Y1);
hold on

radius = 1;
th = 0:pi/50:2*pi;
xunit = radius * cos(th) + c_ix;
yunit = radius * sin(th) + c_iy;
h = plot(xunit, yunit);
hold on
th = 0:pi/50:2*pi;
xunit1 = radius * cos(th) + c_jx;
yunit1 = radius * sin(th) + c_jy;
h = plot(xunit1, yunit1);
hold on

a1 = c_ix-1;
b1 = c_ix+1;
r1 = (b1-a1)*rand(10,1) + a1;
r1_range = [min(r1) max(r1)];
r1 = [r1 zeros(10,1)];
plot(r1(:,1),r1(:,2),'x');
hold on

a2 = c_jx-1;
b2= c_jx+1;
r2 = (b2-a2)*rand(10,1) + a2;
r2_range = [min(r2) max(r2)];
r2 = [r2 zeros(10,1)];
plot(r2(:,1),r2(:,2),'x');
pause;
% generate 20 points in total
r = [r1;r2];

[A,b,c,Aeq,beq]= lin(r',2);
lb = zeros(1,420);
ub = ones(1,420);
rtn = linprog(c,A,b,Aeq,beq,lb,ub);
rtn
zpq = rtn(1:400,:);
zpq
zz = reshape(zpq,20,20);
zz = zz';
yp = rtn(401:420,:);
ctr = find(yp);
ctr
% two centers
c1 = r(ctr(1),:);
c2 = r(ctr(2),:);
cc = [c1;c2];
plot(cc(:,1),cc(:,2),'*'); 
pause;
hold on
%Highlight the two centers 
gp1 = zz(ctr(1),:);
g1 = find(gp1);
gg1 = r(g1,:);
plot(gg1(:,1),gg1(:,2),'o');
pause;
hold on
gp2 = zz(ctr(2),:);
g2 = find(gp2);
gg2 = r(g2,:);
plot(gg2(:,1),gg2(:,2),'o');
gp = [gp1;gp2]; 

%test the dual certificate
[A1,b1,c1,Aeq1,beq1,lb1,ub1]= lindual(r',2);
[rtn1,fval] = linprog(-c1,A1,b1,Aeq1,beq1,lb1,ub1);
rtn1(1:20)
fval
