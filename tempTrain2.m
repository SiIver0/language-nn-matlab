function [struct,error] = tempTrain2(target,struct,results,sums,input)

%% MULTILAYER NETWORK 

% Noah Yoshida 
% Neural Network Project 

% This takes the target (either 1 or 0), the structure of the network
% 'struct', the results and sums arrays, and the initial input (not the
% character input, but the input after running the word through the input
% function). Uses back propagation by computing partial derivatives of
% sigmoid function. Learning rate is set at 0.01, but can change. Used the
% method outlines on: 
% https://stevenmiller888.github.io/mind-how-to-build-a-neural-network/
% part 1 and part 2. 

error=target-results{3};

%% 2nd Layer of weights
deltaOutSum=dlogsig(sums{3},results{3}).*error;

dWeights=results{2}.*deltaOutSum*0.01;
dWeights=dWeights';
initialWeights1=struct{2}{3};

struct{2}{3}=struct{2}{3}+dWeights;

%% First layer of weights


deltaSum=deltaOutSum*initialWeights1'.*dlogsig(sums{2},results{2});
deltaSum=deltaSum';
dWeights2=deltaSum.*results{1}*0.01;
dWeights2=dWeights2';
initialWeights2=struct{2}{2};
struct{2}{2}=struct{2}{2}+dWeights2;

dlogsig(sums{1},results{1});
deltaSum2=(deltaSum*initialWeights2)'.*dlogsig(sums{1},results{1});
dWeights2=deltaSum2.*input*0.01;
struct{2}{1}=struct{2}{1}+dWeights2;









