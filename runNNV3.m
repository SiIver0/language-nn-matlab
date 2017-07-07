function [p,error,nnStruct]=runNNV3(handles, list1,list2)

% Usage: guess=runNN(list, listSizes)
% Author: Noah Yoshida
% This function runs the nerual network given two lists and a neural
% network configuration, listSizes ([270,135,1] generates network with 270
% inputs, 135 hidden layer nodes, and 1 output node. 
hRadioButton=get(handles.uibuttongroup3,'SelectedObject');
selected=get(hRadioButton,'Tag');
switch selected
    case 'oneLayer'
        listSizes=[270,135,1];
    case 'twoLayer'
        listSizes=[270,135,72,1];
        
        
end
hRadioButton=get(handles.uibuttongroup2,'SelectedObject');
selected=get(hRadioButton,'Tag');
switch selected
    case 'thousand'
        iterations=1000;
    case 'tenthousand'
        iterations=10000;
    case 'hundredthousand'
        iterations=100000;     
end

k=0; 
p=-1; 
c=0;

% p and c incriment when a word is chosen from the opposite list, that way
% when choosing a word from that list it choses the next one, rather than
% the one which is the same as the z value. 

nnStruct=createWeights2([270,135,1]);
error=zeros(iterations,1);  % stores error values, which are the difference 
                            %  between target and actual output
x=linspace(0,iterations,iterations);
hwb=waitbar(0,'Training... Please do not close','Name','Training...');

for z=1:iterations
    waitbar(z/iterations,hwb);
    if k > 0.5 % Word comes from list 1
        word=list1(z-c);
        k=rand;
        p=p+1;
        target=1; % Want it to equal 1
    else % Word comes from list 2
        word=list2(z-p);
        k=rand;
        c=c+1;
        target=0; % Want it to equal 0
    end
    input=inputF(word);
    if length(word) <=10
        [sums, result, output] = evaluateNet2( nnStruct, input );% evaluate network
        if target == 1 && output > 0.5
            error(z,1)=1;
        elseif target == 0 && output <= 0.5
            error (z,1)=1;
        else
        end
        hRadioButton=get(handles.uibuttongroup3,'SelectedObject');
        selected=get(hRadioButton,'Tag');
        switch selected
            case 'oneLayer'
                [nnStruct] = tempTrain(target,nnStruct,result,sums,input);% train network
            case 'twoLayer'
                [nnStruct] = tempTrain2(target,nnStruct,result,sums,input);% train network
        end
    end
end

newErr=smooth(error,200)*100;
close(hwb);
legend('most recent trial') 
hold on
grid on
axis(handles.axes1,[0,iterations,0,100]);
plot(handles.axes1,x,newErr);






