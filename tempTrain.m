function [struct,error] = tempTrain(target,struct,results,sums,input)

% Noah Yoshida 
% Neural Network Project 

% This takes the target (either 1 or 0), the structure of the network
% 'struct', the results and sums arrays, and the initial input (not the
% character input, but the input after running the word through the input
% function). Uses back propagation by computing partial derivatives of
% sigmoid function. Learning rate is set at 0.1, but can change. Used the
% method outlines on: 
% https://stevenmiller888.github.io/mind-how-to-build-a-neural-network/
% part 1 and part 2. 


error=target-results{2};
lRate=0.01;

%% 2nd layer of weights
deltaOutSum=dlogsig(sums{2},results{2}).*error;

dWeights=results{1}.*deltaOutSum*lRate;
dWeights=dWeights';

initialWeights1=struct{2}{2};
struct{2}{2}=struct{2}{2}+dWeights;

%% 1st layer of weights


deltaSum=deltaOutSum*initialWeights1'.*dlogsig(sums{1},results{1});
dWeights2=deltaSum.*input*lRate;

struct{2}{1}=struct{2}{1}+dWeights2;












