function [ave_acc, ConMat] = cnntest(net, x, y, clsCnt, tstNum)
    %  feedforward
    net = cnnff(net, x);
    [~, h] = max(net.o);
    [~, a] = max(y);
    
    [ave_acc,ConMat]=accuracy( a,h,clsCnt,tstNum );
    
end
