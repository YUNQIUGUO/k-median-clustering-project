mu = [2 3];
sigma = [1 1.5; 1.5 3];
rng default  % For reproducibility
R = mvnrnd(mu,sigma,100);
figure
plot(R(:,1),R(:,2),'+')