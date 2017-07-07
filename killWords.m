function newList=killWords(list,valueList,charLimit)


N=length(list);

Z=zeros(N,1);
k=0;

for i=1:1:N
    if cell2mat(valueList(i)) > charLimit
        Z(i,1)=1;
        k=1+k; %number over 10 
    end
end

n=N-k; % The number of rows the new list will have
p=0; % Since the rows will be off by a certain number, this keeps track of
% the difference in place between the new list and the old lists.

for t=1:1:N
    if Z(t,1) == 1
        p=p+1; % Since there is a duplicate, we must add one to the p value 
        % so that the new list doesn't try to fill values up to the max of 
        % the old lists
    elseif Z(t,1)==0
        newList{t-p,1}=list{t,1};
    end
    

end

newList=newList(randperm(length(newList)));
