function [ trnData,trnLab,trnNum,tstData,tstLab,tstNum ] = TrainTest( data,lab,trnPer,clsCnt )

clsNum = zeros(1, clsCnt);          %每个类别的数据的总数量
trnNum = zeros(1, clsCnt);          %每个类别的数据选作训练数据的数量
tstNum = zeros(1, clsCnt);          %每个类别的数据选作测试数据的数量

 for i = 1 : clsCnt
   index = find(lab == i);                 %找到标记为i的数据的下标
   clsNum(i) = size(index,1);                   %标记为i的数据的总数量
   trnNum(i) = ceil(clsNum(i) * trnPer);        %选取作为训练样本的数量
   tstNum(i) = clsNum(i) - trnNum(i);           %剩余的为测试样本的数量
 end

%开始计算
trnData = [];                        %保存训练数据
trnLab = zeros(clsCnt,sum(trnNum));                        %保存训练数据对应的类型
tstData = [];                        %保存测试数据
tstLab = zeros(clsCnt,sum(tstNum));                        %保存测试数据对应的类型

temp1 = 1;
temp2 = 1;
%每种类别随机选取20%作为样本数据
for i = 1 : clsCnt
   index = find(lab == i);                  %找到标记为i的数据的下标
   random_index = index(randperm(length(index)));%结果为打乱顺序后的下标序列

   index = random_index(1:trnNum(i));            %在乱序中取前20%作为训练样本，index保存它们的下标
   trnData = [trnData data(index,:)'];         %将训练样本的数据依次填充进trnFet数组
   
 
   trnLab(i,temp1:temp1 + trnNum(i)-1 ) = 1;    %将训练样本的标记依次填充进trnLab数组
   temp1 = temp1 + trnNum(i);

   index = random_index(trnNum(i)+1:end);        %乱序中剩余的为测试样本，index保存它们的下标
   tstData = [tstData data(index,:)'];         %将测试样本的数据依次填充进tstFet数组
   tstLab(i,temp2:temp2 + tstNum(i)-1 ) = 1;   
   temp2 = temp2 + tstNum(i);    %将测试样本的标记依次填充进tstFet数组
end

trnData = reshape( trnData,1,size(trnData,1),size(trnData,2) );
tstData = reshape( tstData,1,size(tstData,1),size(tstData,2) );
