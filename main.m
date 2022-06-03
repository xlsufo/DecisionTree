clear;clc;
%各层数据的节点
% WeatherType=struct('Sunny',1,'Windy',2,'Rainy',3);
% PareantsType=struct('Yes',1,'No',0);
% MoneyType=struct('Rich',1,'Poor',0);
% leafNodeType=struct('Cinema',1,'Tennis',2,'Stayin',3,'Shopping',4);
% sample=struct('Weather',[],'Pareants',[],'Money',[],'Decision',[]);
 
%--训练集数据-----------------------------------%
Weather=[1,1,2,3,3,3,2,2,2,1]';
Pareants=[1,0,1,1,0,1,0,0,1,0]';
Money=[1,1,1,0,1,0,0,1,1,1]';
leafNodeSample=[1,2,1,1,3,1,1,4,1,2]';    %叶节点类型
sample=[Weather Pareants Money]; %构建数字化数据集样本，这里不包含叶节点

propertyName={'Weather','Pareants','Money'};  %属性集
delta=0.1;
%构建决策树,delta为
decisionTree= TreeGenerate(sample,leafNodeSample,propertyName,delta);  

PrintTree(decisionTree);
