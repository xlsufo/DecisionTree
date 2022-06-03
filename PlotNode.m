function PlotNode(fatherNode,fatherPos,Node)
%PLOTNODE 此处显示有关此函数的摘要
%   此处显示详细说明

leafNodeType={'Cinema','Tennis','Stayin','Shopping'};

if fatherNode.level==0
   plot(fatherPos.x,fatherPos.y,'rO');
   text(fatherPos.x,fatherPos.y,fatherNode.NodeName);
    hold on;
end

%--递归返回--------------------------------%
if isnumeric(fatherNode.NodeName)   %父节点为叶节点
    return;
end

index=find(strcmp({Node.fatherNodeName},fatherNode.NodeName)==1);
numSonNode=length(index);
sonX=1:numSonNode;        %子节点x位置序列
sonX=sonX-mean(sonX);    
sonY=ones(1,numSonNode)*-(fatherNode.level+1);  %子节点y位置序列
for i=1:numSonNode
    plot(sonX(i),sonY(i),'rO');
    if isnumeric(Node(index(i)).NodeName)
        plotText=leafNodeType(Node(index(i)).NodeName);
    else
        plotText=Node(index(i)).NodeName;
    end
    text(sonX(i),sonY(i),plotText);
    hold on;
    plot([fatherPos.x sonX(i)],[fatherPos.y sonY(i)],'r-');
    hold on;
    
end

%-进入递归------------%
for i=1:numSonNode
    fatherPos.x=sonX(i);
    fatherPos.y=sonY(i);
    PlotNode(Node(index(i)),fatherPos,Node);
end

end

