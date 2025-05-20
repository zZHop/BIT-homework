clear;
clc;
load datalab.mat data;

trnPer = 0.2;
clsCnt = 16;

newData = data.fet;
%newData = extrc_pca(data.fet);
tic
[trnData,trnLab,trnNum, tstData,tstLab,tstNum] = TrainTest(newData,data.lab,trnPer,clsCnt);

mm = max(max(newData));
train_x = double(trnData/mm);
train_y = trnLab;
test_x  = double(tstData/mm);
test_y  = tstLab;

[ave_acc,ConMat] = cnn_start(train_x,train_y,test_x,test_y,clsCnt,tstNum);
toc
printConMat(ConMat);
R=num2str(ave_acc);
msgbox({'×¼È·ÂÊ' R});