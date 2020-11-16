clear
clc



y = [10;5;-2;4;12;23;4;-2;3;8];
x = [1 5;1 2;1 -1;1 3;1 7;1 4;1 -2;1 4;1 -3;1 5];

%% a) derive OLS estimaors b1 and b2
xt = x(1:10,2);


for i = 1:10
    sumDiff(i) = (xt(i) - mean(xt)) * (y(i) - mean(y));
    xSquare(i) = (xt(i) - mean(xt))^2 ; 
end
sumDiff = sum(sumDiff);
xSquare = sum(xSquare);

betahat2 = sumDiff / xSquare;
betahat1 = mean(y)-betahat2 * mean(xt);


%% b) prove numerically that:
    
betahat = ((x' * x)^-1) * x' * y;

leftSide = round(betahat' * x' * y,4);
rightSide = round(y' * x * betahat,4);

isequal(leftSide, rightSide)





%% c) calculate numerically yhat and uhat


yhat = betahat1 + betahat2 * xt;
uhat = y - yhat;

%% d) show numerically that yhat' uhat is equal to zero

result = round(yhat' * uhat)

