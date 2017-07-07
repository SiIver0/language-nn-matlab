function list=sortDictionaryF(location)

% Usage: list=sortDictionaryF(location)
% This function reads and outputs the first sheet of an excel file from the designted
% location. 

% Noah Yoshida 
% NeuralNetworkProject
% Last modified: 4.7.17 1:43AM

%% Import the data
[~, ~, raw] = xlsread(location,'Sheet1');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,1);

%% Allocate imported array to column variable names
list = cellVectors(:,1);

%% Clear temporary variables
clearvars raw cellVectors;







