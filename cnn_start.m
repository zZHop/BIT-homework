function  [ave_acc,ConMat]=cnn_start(train_x,train_y,test_x,test_y,clsCnt,tstNum )

%% ex1 Train a 6c-3s-12c-4s Convolutional neural network 
%will run 1 epoch in about 200 second and get around 26.4% error. 
%With 100 epochs you'll get around 8% error

rand('state',0)

cnn.layers = {
    struct('type', 'i') %input layer
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', [1,3]) %convolution layer
    struct('type', 's', 'scale', [1,6]) %sub sampling layer
    struct('type', 'c', 'outputmaps', 12, 'kernelsize', [1,7]) %convolution layer
    struct('type', 's', 'scale', [1,3]) %sub sampling layer
};


opts.alpha =1;
opts.batchsize =2;
opts.numepochs = 200;

cnn = cnnsetup(cnn, train_x, train_y);
cnn = cnntrain(cnn, train_x, train_y, opts);

[ave_acc,ConMat] = cnntest(cnn, test_x, test_y, clsCnt,tstNum );

%plot mean squared error
%figure; plot(cnn.rL);
%assert(er<0.12, 'Too big error');
