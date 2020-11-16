clc;clear all;close all;

%%
%Part1 (4)

%random normal distribution error and x

N = 1000;
rng('default');
rng(1);
error4 = normrnd(0,1,[N,1]); %mean 0, standard deviation 1
rng(2);
x4 = normrnd(0,1,[1,N]);

%beta
beta1 = 10;
beta2 = 2.5;

%y
y4 = beta1 + beta2 * x4' + error4;

%plot
figure('Name','Error plot 1000 observations')
hist(error4);
figure('Name','X and Y plot 1000 obervations')
plot(x4,y4,'LineStyle','none','Marker','.');



%regression

mylm4 = mlr(x4,y4);
yhat4 = mylm4.result(1) + mylm4.result(2) * x4';
residual4 = y4 - yhat4;
figure('Name','Residual plot 100 observations')
plot(1:N,error4,1:N,residual4,'LineStyle','none','Marker','.');
legend('error','residual');

figure('Name','Equation plot 100 obervations with residual')
plot(x4,yhat4);hold all;
plot(residual4,yhat4,'LineStyle','none','Marker','.');

