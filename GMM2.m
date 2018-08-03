%create a known,two-component Gaussian Mixture Model
mu = [1 2;-3 -5]; %means
sigma = cat(3,[25 0;0 10],[15 0;0 5]); %covariance
p = ones(1,2)/2; %mixing proportions
gm = gmdistribution(mu,sigma,p);
%plot the contour
gmPDF = @(x,y)pdf(gm, [x y]);
ezcontour(gmPDF,[-10 10],[-10 10]);
title('Contour lines of pdf');
%subplot?
%generate 50 random variates from GMM
X = random (gm,50);
hold on
[A,b,c,Aeq,beq]= lin(X',3); %raise k
lb = zeros(1,2550);
ub = ones(1,2550);
rtn = linprog(c,A,b,Aeq,beq,lb,ub);
zpq = rtn(1:2500,:);
zz = reshape(zpq,[50,50]);
zz = zz'
yp = rtn(2501:2550,:);
ctr = find(yp);
ctr
c1 = X(ctr(1),:);
c2 = X(ctr(2),:);
c3 = X(ctr(3),:);  
cc = [c1;c2;c3];
plot(cc(:,1),cc(:,2),'*');
hold on 
%High light the two centers 
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
gp = [gp1;gp2;gp3];                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
hold on
%scatter plot
title ('Simulated data');
  