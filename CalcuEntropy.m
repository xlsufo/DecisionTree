function Ent = CalcuEntropy(propertySample)
%求解某一特征的信息熵
Ent=0;
numSample=length(propertySample); %某一属性出现的样本数量
typeList=unique(propertySample);    %获取属性中的所有分类
numType=length(typeList);            %分类的数量

%计算信息熵
for i=1:numType
    itemLength=length(find(propertySample==typeList(i)));
    p=itemLength/numSample;
    Ent=Ent-p*log2(p);
end
end

