function struct = createWeights2( listSizes )
%   Usage: struct = createWeights(listSizes);
% timburchfield neuralnetwork project.
% createWeights returns a NNet structure of
% the form (a,b), where a is the size of the layers
% of the NNet.  b is a cell array of the weights of each layer.
% listSizes must be of the form (x1,x2,x3,x4, ..., xn)
% where xi is the number of nodes in the i'th layer. x1 is the input layer.
%  n >= 2.
% returns 1 on error

% 
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
        struct{2}{j} = ((rand(listSizes(j+1),listSizes(j))-0.5).*0.2); % create the weight matrices
    end
end


end

