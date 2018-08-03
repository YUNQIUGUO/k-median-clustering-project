% GMM_2, with k = 3 clustering
count = [];
ioni = [];
mu = [1 2;-3 -5]; %means
sigma = cat(3,[25 0;0 10],[15 0;0 5]); %covariance
p = ones(1,2)/2; %mixing proportions
gm = gmdistribution(mu,sigma,p);
tic
for i = 1:100
X = random (gm,50);
[A,b,c,Aeq,beq]= lin(X',3);
lb = zeros(1,2550);
ub = ones(1,2550);
rtn = linprog(c,A,b,Aeq,beq,lb,ub);
zpq = rtn(1:2500,:);
zz = reshape(zpq,[50,50]);
zz = zz';
yp = rtn(2501:2550,:);
ctr = find(yp);
ctr
n = length(ctr);
% see whether the solution is integral or not. If the solution are all
% contained of integral entries, then n should be 3
if n == 3
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