% xtrue=-68;
xhat =0;
Phat = 1000;
sigma = 2;
data=readtable('help_beacon_1000.csv');
yk=data.Var2;
maxIter = size(yk,1);
xerror = zeros(1,maxIter);
xhats = zeros(1,maxIter);
phats = zeros(1,maxIter);
xmovmean = movmean(yk,10);
xmovmin = movmin(yk,10);
xmovmax = movmax(yk,10);
for k = 1:maxIter
% ek = random('Normal',0,sigma);
% yk=xtrue + ek;
xhat=xhat;
Phat=Phat;
yhat=xhat;
L_kf=Phat/(Phat + sigma^2);
%L_kf=0.01;
xhat = xhat + L_kf * (yk(k) - yhat);
Phat=sigma^2 * Phat/(Phat + sigma^2);
% xerror(k)=xhat-xtrue;
xhats(k)=xhat;
phats(k) = Phat;
end
subplot(2,3,1); plot([1:maxIter],yk); title('1. Actual reading');
subplot(2,3,2); plot([1:maxIter],xmovmean); title('2. Moving mean (window
size 10)');
subplot(2,3,3); plot([1:maxIter],xmovmax, [1:maxIter],xmovmin );
title('3. Moving max/min (window size 10)');
legend('max','min');
subplot(2,3,4); histogram(yk); title('4. Histogram of reading');
subplot(2,3,5); plot([1:maxIter],xhats); title('5. Estimated RSSI');
subplot(2,3,6); plot([1:maxIter],phats); title('6. phats');
