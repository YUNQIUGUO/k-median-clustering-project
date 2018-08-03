clf
axis equal
hold on
x1=-sqrt(2)/8;
y1=0;
rc1=1;
[x,y,z] = cylinder(rc1,200);
plot(x(1,:)+x1,y(1,:)+y1,'r')
X1 = zeros(10,2);
for t=1:30
[x,y]=cirrdnPJ(x1,y1,rc1);
 X1(t,:) = [x y];
plot(x,y,'x'); 
end
hold on
x2= sqrt(2)/8;
y2 = 0;
rc2 = 1;
[x,y,z] = cylinder(rc2,200);
plot(x(1,:)+x2,y(1,:)+y2,'r')
X2 = zeros(10,2);
for t=1:30
[x,y]=cirrdnPJ(x2,y2,rc2);
X2(t,:) = [ x y];
plot(x,y,'x');
end
X = [X1;X2];
%generated 20 points
[A,b,c,Aeq,beq,lb,ub]= lindual(X',2);
[rtn,fval] = linprog(-c,A,b,Aeq,beq,lb,ub);
rtn(1:20)
fval
