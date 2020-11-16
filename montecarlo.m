clc;clear all;close all;

%%
n=100; %sample size
N=1000; %simulations
monteBeta1=zeros(1,N);
monteBeta2=zeros(1,N);
monteBeta3 = zeros(1,N);


%%
%Part1 (6)


n=100; %sample size
N=1000; %simulations
monteBeta1=zeros(1,N); %Preallocation
monteBeta2=zeros(1,N);
for i=1:N
    beta1=5;
    beta2=0.7;
    error = normrnd(0,1,[n,1]);
    x = normrnd(0,1,[1,n]);
    y = beta1 + beta2 * x' + error;

    
    mylm6=fitlm(x,y);
    
    
    monte6Beta1(i)=mylm6.Coefficients.Estimate(1);
    monte6Beta2(i)=mylm6.Coefficients.Estimate(2);
    
    
end

figure('Name','monte carlo simulation beta1')
histogram(monte6Beta1);
figure('Name','monte carlo simulation beta2')
histogram(monte6Beta2);



%%
%Part1 (7)

for i=1:N
    
    beta2=0.7;
    error = normrnd(0,1,[n,1]);
    x = normrnd(0,1,[1,n]);
    y = beta2 * x' + error;
    x = [zeros(1,n);x];
    
    mylm7=regress(y,x');
    
    monte7Beta2(i)=mylm7(2);
    
end

figure('Name','monte carlo simulation beta2')
histogram(monte7Beta2);

%%
%Part1 (8)

for i=1:N
    
    beta1=5;
    beta2=0.7;
    rho1 = 0.15;
    
    
    error = normrnd(0,1,[n,1]);
    x = normrnd(0,1,[1,n]);
    z1 = x*rho1 + normrnd(0,1,[1,n]);
    y = beta1 + beta2 * x' + error;
    x = [ones(1,n);x;z1];
    
    mylm8=regress(y,x');
    monte8Beta1(i)=mylm8(1);
    monte8Beta2(i)=mylm8(2);
    monte8Beta3(i) = mylm8(3);
end

figure('Name','monte carlo simulation beta1 with z1')
histogram(monte8Beta1);
figure('Name','monte carlo simulation beta2 with z1')
histogram(monte8Beta2);
figure('Name','monte carlo simulation beta3 with z1')
histogram(monte8Beta3);




for i=1:N
    
    beta1=5;
    beta2=0.7;
    rho2 = 0.9;
    
    
    error = normrnd(0,1,[n,1]);
    x = normrnd(0,1,[1,n]);
    z2 = x*rho2 + normrnd(0,1,[1,n]);
    y = beta1 + beta2 * x' + error;
    x = [ones(1,n);x;z2];
    
    mylm9=regress(y,x');
    monte9Beta1(i)=mylm9(1);
    monte9Beta2(i)=mylm9(2);
    monte9Beta3(i) = mylm9(3);
end

figure('Name','monte carlo simulation beta1 with z2')
histogram(monte9Beta1);
figure('Name','monte carlo simulation beta2 with z2')
histogram(monte9Beta2);
figure('Name','monte carlo simulation beta3 with z2')
histogram(monte9Beta3);