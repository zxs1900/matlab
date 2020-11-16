clc;clear;


%data processing
table = table2array(readtable('datawageCEO.xls','Sheet', 'Foglio1'));
table = array2table([table log(table(:,1)) (table(:,2)).^2]);
table.Properties.VariableNames = {'wage' 'age' 'school' 'female' 'male' 'log_wage' 'age2'};


%regression
mylm1 = fitlm(table, 'wage~age+school');
mylm2 = fitlm(table, 'log_wage~age+school');
mylm3 = fitlm(table, 'log_wage~age+school+female');
mylm4 = fitlm(table, 'log_wage~age+age2');


mylm1
mylm2
mylm3
mylm4