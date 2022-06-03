function BuildSonNode(fatherlevel,fatherNodeName,edge,sample,leafNodeSample,propertyName,delta)
%递归构建决策树的各个节点
global Node;
%--定义子节点结构-----------------%
sonNode=struct('level',0,'fatherNodeName',[],'EdgeProperty',[],'NodeName',[]);

sonNode.level=fatherlevel+1;  %此子节点的层级
sonNode.fatherNodeName=fatherNodeName; %父节点名
sonNode.EdgeProperty=edge;       %边属性

%--递归返回条件1-----------------------------------%
if length(unique(leafNodeSample))==1     %当前节点包含的样本都属于同一类别
    sonNode.NodeName=leafNodeSample(1);
    Node=[Node sonNode];              %添加子节点
    return;
end

%--递归返回条件2-----------------------------------%
if length(propertyName)<1    %当前的属性集为空
    nodeType=unique(leafNodeSample);  %获取叶节点的所有分类
    numNodeType=length(nodeType);      %获取分类数量
   sampleNum=zeros(numNodeType,1);     
    for i=1:numNodeType         %找到样本数最多的分类
        sampleNum(i)=length(find(leafNodeSample==nodeType(i)));  %
    end
    [~,labelIndex]=max(sampleNum);
    sonNode.NodeName=nodeType(labelIndex);
    Node=[Node sonNode];
    return;
end


%到这里说明不是叶节点，为内部节点，需要进一步分类
[sonIndex,BuildNode]=CalcuteNode(sample,leafNodeSample,delta);  %计算下层节点的分类依据

if BuildNode            %子节点建立成功，则最大增益率满足阈值，得到了分类所用属性
    dataRowIndex=setdiff(1:length(propertyName),sonIndex); %获取除分类属性以外的属性
    sonNode.NodeName=propertyName{sonIndex};
    Node=[Node sonNode];      %添加子节点
    propertyName(sonIndex)=[];
    sonSample=sample(:,sonIndex);   %按当前子节点所包含的样本
    sonEdge=unique(sonSample);      %获取分支
 
    for i=1:length(sonEdge)     %当前子节点作为下一层的根节点进行递归
        edgeDataIndex=find(sonSample==sonEdge(i));
        BuildSonNode(sonNode.level,sonNode.NodeName,sonEdge(i),sample(edgeDataIndex,dataRowIndex),leafNodeSample(edgeDataIndex,:),propertyName,delta);
    end
else    %最大增益率不满足条件，则将其作为叶节点添加
    nodeType=unique(leafNodeSample); %获取叶节点所有样本分类
    numNodeType=length(nodeType);
    sampleNum=zeros(numNodeType,1);
    for i=1:numNodeType
        sampleNum(i)=length(find(leafNodeSample==nodeType(i)));
    end
    [~,labelIndex]=max(sampleNum);
    sonNode.NodeName=nodeType(labelIndex);
    Node=[Node sonNode];
    return;
end


end

