%%
% File Name: AdaBoost
% This is the implementation of the ada boost algorithm.
% Parameters - very easy to guess by name...
% Return values: i - hypothesis-index  vector.
%                t - threshhols vector
%                beta - weighted beta.
%%
function boosted=adaBoost(train,train_label,cycles)
    disp('正在运行AdaBoost算法');
    d=size(train);
    % 初始化每个训练样本的权重分布。
	distribution=ones(1,d(1))/d(1);
    % 初始化用于存储错误率和beta权重的数组。
	error=zeros(1,cycles);
	beta=zeros(1,cycles);
    % 初始化标签向量，假设正确的标签大于或等于5。
	label=(train_label(:)>=5);

	for j=1:cycles
        if(mod(j,10)==0)
            disp([j,cycles]);
        end
        % 调用弱学习器函数，找到当前分布下的最佳弱分类器。
	    [i,t]=weakLearner(distribution,train,label);
        % 计算当前弱分类器的错误率。
        error(j)=distribution*abs(label-(train(:,i)>=t));
        % 计算当前弱分类器的beta权重。
        beta(j)=error(j)/(1-error(j));
        % 存储当前弱分类器的beta权重、假设索引和阈值。
        boosted(j,:)=[beta(j),i,t];
        % 更新下一轮迭代的权重分布。
        distribution=distribution.* exp(log(beta(j))*(1-abs(label-(train(:,i)>=t))))';
        distribution=distribution/sum(distribution);
end
    
    