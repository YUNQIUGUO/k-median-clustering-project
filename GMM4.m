%create a known,two-component Gaussian Mixture Model
mu = [1 2;3 5]; %means
sigma = cat(3,[10 0;0 5],[3 0;0 3]); %covariance
p = ones(1,2)/2; %mixing proportions
gm = gmdistribution(mu,sigma,p);
%plot the contour
gmPDF = @(x,y)pdf(gm, [x y]);
ezcontour(gmPDF,[-10 10],[-10 10]);
hold on
%generate 50 random variates from GMM
X = random (gm,50);
[A,b,c,Aeq,beq]= lin(X',2);
lb = zeros(1,2550);
ub = ones(1,2550);
rtn = linprog(c,A,b,Aeq,beq,lb,ub);
zpq = rtn(1:2500,:);
zz = reshape(zpq,[50,50]);
zz = zz';
yp = rtn(2501:2550,:);
ctr = find(yp);
ctr
% two centers
c1 = X(ctr(1),:);
c2 = X(ctr(2),:);
cc = [c1;c2];
plot(cc(:,1),cc(:,2),'*');
hold on
%Hight light the two centers 
gp1 = zz(ctr(1),:);
g1 = find(gp1);
gg1 = X(g1,:);
plot(gg1(:,1),gg1(:,2),'x');
gp2 = zz(ctr(2),:);
g2 = find(gp2);
gg2 = X(g2,:);
plot(gg2(:,1),gg2(:,2),'o');
gp = [gp1;gp2];                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
hold on
%scatter plot
title ('Simulated data');


 