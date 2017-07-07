function [sums, result, output] = evaluateNet2( netStruct, input )
% Usage: output_vector = evaluateNet( NeuralNetStruct, input_vector);
%  timburchfield neuralnetwork project.
% pass the structure given by createWeights, or
% by trainNet, and the input.  returns NaN if you didn't pass
% it the right size.  example: if listSizes is (4,2,3), pass it a size 4
% array.


for i=1:length(netStruct{2})
    sums{i}=netStruct{2}{i}*input'+netStruct{3}{i}';
    result{i} = logsig(sums{i});
    input=result{i}';
    
end
output = input;


