function struct = createWeights2( listSizes )
%   Usage: struct = createWeights(listSizes);
% timburchfield neuralnetwork project.
% createWeights returns a NNet structure of
% the form (a,b,c), where a is the size of the layers
% of the NNet.  b is a cell array of the weights of each layer.
% listSizes must be of the form (x1,x2,x3,x4, ..., xn)
% c is cell array size 1, n-1, where ith element
% is a 1,x(i+1) size array for the bias bit weights
% where xi is the number of nodes in the i'th layer. x1 is the input layer.
%  n >= 2.
% returns 1 on error
isnotinteger = false;
struct = 0;
for i=1:size(listSizes)
    if floor((listSizes(i)) ~= listSizes(i)) % make sure everything is an integer.
        isnotinteger = true;
    end
end

sizes = size(listSizes);
if (sizes(2) < 2 || (min(listSizes) < 0)) || (isnotinteger) % if any error occured
    struct = 1;
end

if struct ~= 1     % if noerror
    struct = cell(1,2);
    struct{1} = listSizes;
    struct{2} = cell(1,sizes(2)-1);
    for j=1:sizes(2) - 1
        struct{2}{j} = (rand(listSizes(j+1),listSizes(j)).*2) - 1; % create the weight matrices
    end
end
struct{3} = cell(1,length(struct{1}) - 1);
for i=1:length(struct{1})-1
    struct{3}{i} = (rand(1, struct{1}(i+1)).*2) - 1;
end


