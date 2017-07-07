function varargout = NN(varargin)
% NN MATLAB code for NN.fig
%      NN, by itself, creates a new NN or raises the existing
%      singleton*.
%
%      H = NN returns the handle to a new NN or the handle to
%      the existing singleton*.
%
%      NN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NN.M with the given input arguments.
%
%      NN('Property','Value',...) creates a new NN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NN_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NN_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NN

% Last Modified by GUIDE v2.5 30-Apr-2017 22:23:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NN_OpeningFcn, ...
                   'gui_OutputFcn',  @NN_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before NN is made visible.
function NN_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFc
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NN (see VARARGIN)

% Choose default command line output for NN
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NN wait for user response (see UIRESUME)
% uiwait(handles.figure1);

jList=sortDictionaryF('C:\Users\Noah\Documents\MATLAB\Neural Network\Word Lists\japaneseList.xlsx');
eList=sortDictionaryF('C:\Users\Noah\Documents\MATLAB\Neural Network\Word Lists\englishList.xlsx');
valList=sortDictionaryF('C:\Users\Noah\Documents\MATLAB\Neural Network\Word Lists\englishListValues.xlsx');

eList=killWords(eList,valList,10);

jList=jList(randperm(length(jList)));
eList=eList(randperm(length(eList)));

setappdata(gcf,'jList',jList);
setappdata(gcf,'eList',eList);

% --- Outputs from this function are returned to the command line.
function varargout = NN_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function uInput_Callback(hObject, eventdata, handles)
% hObject    handle to uInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of uInput as text
%        str2double(get(hObject,'String')) returns contents of uInput as a double
word=handles.uInput.String;
inputw=inputF(word);
as=getappdata(gcf,'s');

[sums, result, outputv] = evaluateNet2(as, inputw);
if outputv > 0.5 
    handles.Output.String='   Japanese?';
else
    handles.Output.String='   English?';
end

% --- Executes during object creation, after setting all properties.
function uInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in testButton.
function testButton_Callback(hObject, eventdata, handles)
% hObject    handle to testButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

word=handles.uInput.String;
input=inputF(word);
bs=getappdata(gcf,'s');

 [sums, result, myoutput] = evaluateNet2(bs, input);
if myoutput > 0.5 
    handles.uOutput.String='Japanese?';
else
    handles.uOutput.String='English?';
end
% --- Executes on button press in trainButton.
function trainButton_Callback(hObject, eventdata, handles)
% hObject    handle to trainButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jList=getappdata(gcf,'jList');
eList=getappdata(gcf,'eList');

[p,error,s]=runNNV3( handles, jList,eList);

setappdata(gcf,'s',s);


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

vs = createWeights( [270,152,1] );
setappdata(gcf,'s',vs);


% --- Executes on button press in TestWeight.
function TestWeight_Callback(hObject, eventdata, handles)
% hObject    handle to TestWeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in weightsButton.
function weightsButton_Callback(hObject, eventdata, handles)
% hObject    handle to weightsButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of weightsButton
