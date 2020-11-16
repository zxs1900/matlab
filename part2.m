%% Individual Project Part 2
% Detailed below
%% Plot of Series
indexDaily = readtable('SP500NASDAQ.xls');
%%

%plot
figure('Name','sp500 daily price')
plot(indexDaily.NASDAQ,indexDaily.SP500,'LineStyle','none','Marker','.');
%%
% The SP500 and NASDAQ has strong positive linear relationship
%%
figure('Name','NASDAQ daily price')
plot(indexDaily.Bitcoin,indexDaily.SP500,'LineStyle','none','Marker','.');
%%
% The SP500 and Bitcoin does not have linear relationship


%% Regression on Bitcoin

%regress sp500 on Bitcoin
bit = indexDaily.Bitcoin;
bit = bit';
sp500 = indexDaily.SP500;
mylm1 = mlr(bit,sp500);
mylm1
%%
% The result is statistically significant consider its p value, however,
% the R squared is very low that the model does not apply to most of the
% observation.

%%

spBitHat = mylm1.result(1) + mylm1.result(2) * bit';
spBitResidual = sp500 - spBitHat;

%%
%normality
figure()
qqplot(spBitResidual);
%%
% The residual does not conform the normal distribution as the left end of 
% line tilted downward and the right end of line tilted upward.

%%
%serial correlated
figure()
autocorr(spBitResidual)
%%
% Residual is highly correlated.
%%

%heteroskedastik
hBit = archtest(spBitResidual);
hBit
%%
% We reject the hypothesis of no arch effect, which indicates that residual
% is heteroskedastik.

%% Regression on NASDAQ


%regress sp500 on NASDAQ
nas = indexDaily.NASDAQ;
nas = nas';
mylm2 = mlr(nas,sp500);
mylm2

%%
% Both estimated beta1 and beta2 are significantlly significant at all
% level. The r squared and adjusted r squared shows that the model fit the
% observation very well.
%%

spNasHat = mylm2.result(1) + mylm2.result(2) * nas';
spNasResidual = sp500 - spNasHat;

%%
%normality
figure()
qqplot(spNasResidual);
%%
% The residual does not conform the normal distribution as the left end of 
% line tilted upward and the right end of line tilted downward.
%%
%serial correlated
figure()
autocorr(spNasResidual)
%%
% Residual is highly correlated.

%%
%heteroskedastik
hNas = archtest(spNasResidual);
hNas
%%
% We reject the hypothesis of no arch effect, which indicates that residual
% is heteroskedastik.






