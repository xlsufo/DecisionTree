function [decisionTreeModel] = TreeGenerate(sample,leafNodeSample,propertyName,delta)
%构建树

%-----构建节点---------------------------------%
global Node; 

%--定义节点------------------%
Node=struct('level',-1,'fatherNodeName',[],'EdgeProperty',[],'NodeName',[]);

BuildSonNode(-1,'root','Stem',sample,leafNodeSample,propertyName,delta); %建立节点
Node(1)=[];
model.Node=Node;
decisionTreeModel=model;
end

