
function [i,t] = weakLearner(distribution,train,label)
	%disp('运行弱学习器');
    for tt=1:(16*256-1)    
        error(tt)=distribution*abs(label-(train(:,floor(tt/16)+1)>=16*(mod(tt,16)+1)));         
    end
    [val,tt]=max(abs(error-0.5));
    
    i=floor(tt/16)+1;
    t=16*(mod(tt,16)+1);