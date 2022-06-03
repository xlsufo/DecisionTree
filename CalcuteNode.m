function [NodeIndex,BuildNode] = CalcuteNode(nodeSample,leafNodeSample,delta)
%计算内部节点的分类依据
%sample,leafNodeSample,delta

largeEntropy=CalcuEntropy(leafNodeSample);  %利用叶节点的所有样本计算当前根节点的信息熵
[m,n]=size(nodeSample);  %获取当前所有样本的矩阵大小，包含叶节点
gain=largeEntropy*ones(1,n);  %初始化增益
gainRatio=gain;   %初始化增益率
BuildNode=true;         %节点构建是否成功
for i=1:n
    pData=nodeSample(:,i);
    itemList=unique(pData);
    for j=1:length(itemList)
        itemIndex=find(pData==itemList(j));
        gain(i)=gain(i)-length(itemIndex)/m*CalcuEntropy(leafNodeSample(itemIndex));
    end
    % 计算增益率
    gainRatio(i)=gain(i)/CalcuEntropy(pData);  
end

[maxGainRatio,NodeIndex]=max(gainRatio); %找到最大增益率的属性
if maxGainRatio<delta
    BuildNode=false;
end
end
