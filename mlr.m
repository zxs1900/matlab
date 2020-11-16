%Part1 (3)

function mytable = mlr(x,y)



%betaHat
beta2 = sum((x-mean(x))*(y-mean(y)))/sum((x-mean(x)).^2);
beta1 = mean(y)-beta2*mean(x);
betaHat = [beta1;beta2];

%stdError
n = length(y);
yhat = betaHat(1) + betaHat(2)*x';
RMSE = sqrt(sum((y-yhat).^2)/(n -2));
beta1SE = sqrt(((RMSE.^2)*(n.^-1)*sum(x.^2))/sum((x-mean(x)).^2));
beta2SE = RMSE/sqrt(sum((x-mean(x)).^2));
stdError = [beta1SE;beta2SE];

%tSta
tSta = [betaHat(1)/stdError(1);betaHat(2)/stdError(2)];


%pVal

beta1P =  1-tcdf(abs(tSta(1)),n-2);
beta2P =  1-tcdf(abs(tSta(2)),n-2);
pVal= [2*beta1P;2*beta2P];



%conIn
percentile = tinv([0.025 0.975],n-2);
beta1Con = betaHat(1) + stdError(1) * percentile;
beta2Con = betaHat(2) + stdError(2) * percentile;
conIn = [beta1Con beta2Con];


%rSqrd
yhat = betaHat(1) + betaHat(2) * x';
rSqrd = 1 - (sum((y-yhat).^2)/sum((y-mean(y)).^2));

%adjR
adjR = 1 - ((1-rSqrd) * (n-1) / (n-2));

%fSta
fSta = (rSqrd/1)/((1-rSqrd)/(n-2));


result = [betaHat;stdError;tSta;pVal;conIn';rSqrd;adjR;fSta];
mytable = table(result,'RowNames',{'beta1';'beta2';'SE beta1';'SE beta2';...
    'tSta beta1';'tSta beta2';'pValue beta1';'pValue beta2';...
    'confidence upper beta1';'confidence lower beta1';...
    'confidence upper beta2';'confidence lower beta2';'R2';'adjR2';'fSta'});




end
