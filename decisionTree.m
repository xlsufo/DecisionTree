clc;clear;
%数据
W1=["Sunny","Yes","Rich","Cinema"];
W2=["Sunny","No","Rich","Tennis"];
W3=["Windy","Yes","Rich","Cinema"];
W4=["Rainy","Yes","Poor","Cinema"];
W5=["Rainy","No","Rich","Stayin"];
W6=["Rainy","Yes","Rich","Cinema"];
W7=["Windy","No","Poor","Cinema"];
W8=["Windy","No","Poor","Shopping"];
W9=["Windy","Yes","Rich","Cinema"];
W10=["Sunny","No","Rich","Tennis"];

W=[W1;W2;W3;W4;W5;W6;W7;W8;W9;W10];


%数据处理
weather.label=["Sunny","Windy","Rainy"];
weather.V=length(weather.label);
weather.p(1,weather.V)=0;
for i=1:weather.V
 weather.p(1,i)=size(find(W(:,1)==weather.label(i)),1)/size(W,1);
end
weather.EntD=-sum(weather.p.*log2(weather.p));

parents.label=["yes","No"];
parents.V=length(parents.label);
parents.p(1,parents.V)=0;
for i=1:parents.V
 parents.p(1,i)=size(find(W(:,2)==parents.label(i)),1)/size(W,1);
end

money.label=["Rich","Poor"];
money.V=length(money.label);
money.p(1,money.V)=0;
for i=1:money.V
 money.p(1,i)=size(find(W(:,3)==money.label(i)),1)/size(W,1);
end

decision.label=["Cinema","Tennis","Stayin","Shopping"];
decision.V=length(decision.label);
decision.p=[0.6,0.2,0.1,0.1];
for i=1:decision.V
 decision.p(1,i)=size(find(W(:,4)==decision.label(i)),1)/size(W,1);
end




sonNode=struct('level',0,'fatherNodeName',[],'EdgeProperty',[],'NodeName',[]);




