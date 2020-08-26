function varargout = klasifikasi(varargin)
% KLASIFIKASI MATLAB code for klasifikasi.fig
%      KLASIFIKASI, by itself, creates a new KLASIFIKASI or raises the existing
%      singleton*.
%
%      H = KLASIFIKASI returns the handle to a new KLASIFIKASI or the handle to
%      the existing singleton*.
%
%      KLASIFIKASI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KLASIFIKASI.M with the given input arguments.
%
%      KLASIFIKASI('Property','Value',...) creates a new KLASIFIKASI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before klasifikasi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to klasifikasi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help klasifikasi

% Last Modified by GUIDE v2.5 24-Jun-2020 22:06:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @klasifikasi_OpeningFcn, ...
                   'gui_OutputFcn',  @klasifikasi_OutputFcn, ...
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


% --- Executes just before klasifikasi is made visible.
function klasifikasi_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to klasifikasi (see VARARGIN)

% Choose default command line output for klasifikasi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes klasifikasi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = klasifikasi_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in importButton.
function importButton_Callback(~, ~, handles)
 try
[filename, pathname] = uigetfile({'.xlsx'},'File Selector');
 fullpathname = strcat(pathname, filename);
 buka = xlsread(fullpathname);
 set(handles.tabelData, 'Data', buka);
 set(handles.lokasiPath,'String',fullpathname);
 catch
     f = warndlg('Data yang anda masukkan salah atau tidak sesuai dengan format','Peringatan');
 end


% --- Executes on button press in preprocessingButton.
function preprocessingButton_Callback(~, ~, handles)
try
dataAwal=get(handles.lokasiPath,'String');
[num,txt,~] = xlsread(dataAwal);
[m,~] = size(num); 
for i=1:m
%kriteria
if isequal(txt{i+1,5},'Mikro') num(i,5)=1;
elseif isequal(txt{i+1,5},'Kecil') num(i,5)=2;
elseif isequal(txt{i+1,5},'Menengah') num(i,5)=3;
end
%aset
if num(i,2)>=0 && num(i,2)<= 50000000 num(i,2)=1;
elseif num(i,2)> 50000000 && num(i,2)<= 500000000 num(i,2)=2;
elseif num(i,2)> 500000000 && num(i,2)<= 10000000000 num(i,2)=3;
end
%omzet
if num(i,3)>=0 && num(i,3)<= 300000000 num(i,3)=1;
elseif num(i,3)> 300000000 && num(i,3)<= 2500000000 num(i,3)=2;
elseif num(i,3)> 2500000000 && num(i,3)<= 50000000000 num(i,3)=3;
end
%jumkaryawan
if num(i,1)>=0 && num(i,1)<= 4.166667 num(i,1)=1;
elseif num(i,1)> 4.166667 && num(i,1)<= 8.333333 num(i,1)=2;
elseif num(i,1)> 8.333333 && num(i,1)<= 12.5 num(i,1)=3;
elseif num(i,1)> 12.5 && num(i,1)<= 16.66667 num(i,1)=4;
elseif num(i,1)> 16.66667 && num(i,1)<= 20.83333 num(i,1)=5;
elseif num(i,1)> 20.83333 && num(i,1)<= 25 num(i,1)=6;
elseif num(i,1)> 25 && num(i,1)<= 29.16667 num(i,1)=7;
elseif num(i,1)> 29.16667 && num(i,1)<= 33.33333 num(i,1)=8;
elseif num(i,1)> 33.33333 && num(i,1)<= 37.5 num(i,1)=9;
elseif num(i,1)> 37.5 && num(i,1)<= 41.66667 num(i,1)=10;
elseif num(i,1)> 41.66667 && num(i,1)<= 45.83333  num(i,1)=11;
elseif num(i,1)> 45.83333 && num(i,1)<= 50 num(i,1)=12;
end
%jdlamaberdiri
num(i,4) = 2018 - num(i,4);
%tahunberdiri
if num(i,4)>=1 && num(i,4)<= 7.416667 num(i,4)=1;
elseif num(i,4)> 7.416667 && num(i,4)<= 13.83333 num(i,4)=2;
elseif num(i,4)> 13.83333 && num(i,4)<= 20.25  num(i,4)=3;
elseif num(i,4)> 20.25 && num(i,4)<= 26.66667 num(i,4)=4;
elseif num(i,4)> 26.66667 && num(i,4)<= 33.08333 num(i,4)=5;
elseif num(i,4)> 33.08333 && num(i,4)<= 39.5 num(i,4)=6;
elseif num(i,4)> 39.5 && num(i,4)<= 45.91667 num(i,4)=7;
elseif num(i,4)> 45.91667 && num(i,4)<= 52.33333 num(i,4)=8;
elseif num(i,4)> 52.33333 && num(i,4)<= 58.75 num(i,4)=9;
elseif num(i,4)> 58.75 && num(i,4)<= 65.16667 num(i,4)=10;
elseif num(i,4)> 65.16667 && num(i,4)<= 71.58333 num(i,4)=11;
elseif num(i,4)> 71.58333 && num(i,4)<= 78 num(i,4)=12;
end
end
set(handles.tabelPreprocessing, 'Data', num);

dataAwal1=get(handles.lokasiPath,'String');
[num,txt,~] = xlsread(dataAwal1);
[m,~] = size(num); 
for i=1:m
%kriteria
if isequal(txt{i+1,5},'Mikro') num(i,5)=0; num(i,6)=0;
elseif isequal(txt{i+1,5},'Kecil') num(i,5)=0; num(i,6)=1;
elseif isequal(txt{i+1,5},'Menengah') num(i,5)=1; num(i,6)=1;
end
%aset
if num(i,2)>=0 && num(i,2)<= 50000000 num(i,2)=1;
elseif num(i,2)> 50000000 && num(i,2)<= 500000000 num(i,2)=2;
elseif num(i,2)> 500000000 && num(i,2)<= 10000000000 num(i,2)=3;
end

%omzet
if num(i,3)>=0 && num(i,3)<= 300000000 num(i,3)=1;
elseif num(i,3)> 300000000 && num(i,3)<= 2500000000 num(i,3)=2;
elseif num(i,3)> 2500000000 && num(i,3)<= 50000000000 num(i,3)=3;
end

%jumkaryawan
if num(i,1)>=0 && num(i,1)<= 4.166667 num(i,1)=1;
elseif num(i,1)> 4.166667 && num(i,1)<= 8.333333 num(i,1)=2;
elseif num(i,1)> 8.333333 && num(i,1)<= 12.5 num(i,1)=3;
elseif num(i,1)> 12.5 && num(i,1)<= 16.66667 num(i,1)=4;
elseif num(i,1)> 16.66667 && num(i,1)<= 20.83333 num(i,1)=5;
elseif num(i,1)> 20.83333 && num(i,1)<= 25 num(i,1)=6;
elseif num(i,1)> 25 && num(i,1)<= 29.16667 num(i,1)=7;
elseif num(i,1)> 29.16667 && num(i,1)<= 33.33333 num(i,1)=8;
elseif num(i,1)> 33.33333 && num(i,1)<= 37.5 num(i,1)=9;
elseif num(i,1)> 37.5 && num(i,1)<= 41.66667 num(i,1)=10;
elseif num(i,1)> 41.66667 && num(i,1)<= 45.83333  num(i,1)=11;
elseif num(i,1)> 45.83333 && num(i,1)<= 50 num(i,1)=12;
end
%jdlamaberdiri
num(i,4) = 2018 - num(i,4);
%tahunberdiri
if num(i,4)>=1 && num(i,4)<= 7.416667 num(i,4)=1;
elseif num(i,4)> 7.416667 && num(i,4)<= 13.83333 num(i,4)=2;
elseif num(i,4)> 13.83333 && num(i,4)<= 20.25  num(i,4)=3;
elseif num(i,4)> 20.25 && num(i,4)<= 26.66667 num(i,4)=4;
elseif num(i,4)> 26.66667 && num(i,4)<= 33.08333 num(i,4)=5;
elseif num(i,4)> 33.08333 && num(i,4)<= 39.5 num(i,4)=6;
elseif num(i,4)> 39.5 && num(i,4)<= 45.91667 num(i,4)=7;
elseif num(i,4)> 45.91667 && num(i,4)<= 52.33333 num(i,4)=8;
elseif num(i,4)> 52.33333 && num(i,4)<= 58.75 num(i,4)=9;
elseif num(i,4)> 58.75 && num(i,4)<= 65.16667 num(i,4)=10;
elseif num(i,4)> 65.16667 && num(i,4)<= 71.58333 num(i,4)=11;
elseif num(i,4)> 71.58333 && num(i,4)<= 78 num(i,4)=12;
end
end
set(handles.tabelPreprocessing2, 'Data', num);

catch
   f = warndlg('Mohon Import Data terlebih dahulu','Peringatan');
end
    


% --- Executes on selection change in HiddenLayer.
function HiddenLayer_Callback(~, ~, ~)
% hObject    handle to HiddenLayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns HiddenLayer contents as cell array
%        contents{get(hObject,'Value')} returns selected item from HiddenLayer


% --- Executes during object creation, after setting all properties.
function HiddenLayer_CreateFcn(hObject, ~, ~)
% hObject    handle to HiddenLayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaiAkurasi_Callback(~, ~, ~)
% hObject    handle to nilaiAkurasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaiAkurasi as text
%        str2double(get(hObject,'String')) returns contents of nilaiAkurasi as a double


% --- Executes during object creation, after setting all properties.
function nilaiAkurasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiAkurasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(~, ~, ~)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(~, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in hiddenlayer.
function hiddenlayer_Callback(hObject, eventdata, handles)
% hObject    handle to hiddenlayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns hiddenlayer contents as cell array
%        contents{get(hObject,'Value')} returns selected item from hiddenlayer
popvalue = get(handles.hiddenlayer,'value');
if (popvalue == 2)
set(handles.aktivasi2,'Enable','on');
set(handles.jumlahNeuron2,'Enable','on');
elseif(popvalue == 1)
set(handles.aktivasi2,'Enable','off');
set(handles.jumlahNeuron2,'Enable','off');
end

% --- Executes during object creation, after setting all properties.
function hiddenlayer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hiddenlayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in aktivasi1.
function aktivasi1_Callback(hObject, eventdata, handles)
% hObject    handle to aktivasi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns aktivasi1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from aktivasi1


% --- Executes during object creation, after setting all properties.
function aktivasi1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aktivasi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in jumlahNeuron1.
function jumlahNeuron1_Callback(hObject, eventdata, handles)
% hObject    handle to jumlahNeuron1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns jumlahNeuron1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from jumlahNeuron1


% --- Executes during object creation, after setting all properties.
function jumlahNeuron1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jumlahNeuron1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in fungsiTrain.
function fungsiTrain_Callback(hObject, eventdata, handles)
% hObject    handle to fungsiTrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fungsiTrain contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fungsiTrain


% --- Executes during object creation, after setting all properties.
function fungsiTrain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fungsiTrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputJmlKaryawan_Callback(hObject, ~, handles)
% hObject    handle to inputJmlKaryawan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputJmlKaryawan as text
%        str2double(get(hObject,'String')) returns contents of inputJmlKaryawan as a double


% --- Executes during object creation, after setting all properties.
function inputJmlKaryawan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputJmlKaryawan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aset_Callback(~, ~, handles)
% hObject    handle to aset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aset as text
%        str2double(get(hObject,'String')) returns contents of aset as a double


% --- Executes during object creation, after setting all properties.
function aset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function omzet_Callback(hObject, eventdata, handles)
% hObject    handle to omzet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of omzet as text
%        str2double(get(hObject,'String')) returns contents of omzet as a double


% --- Executes during object creation, after setting all properties.
function omzet_CreateFcn(hObject, eventdata, handles)
% hObject    handle to omzet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tahunBerdiri_Callback(hObject, eventdata, handles)
% hObject    handle to tahunBerdiri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tahunBerdiri as text
%        str2double(get(hObject,'String')) returns contents of tahunBerdiri as a double


% --- Executes during object creation, after setting all properties.
function tahunBerdiri_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tahunBerdiri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hasilKlasfikasi_Callback(hObject, eventdata, handles)
% hObject    handle to hasilKlasfikasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hasilKlasfikasi as text
%        str2double(get(hObject,'String')) returns contents of hasilKlasfikasi as a double


% --- Executes during object creation, after setting all properties.
function hasilKlasfikasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasilKlasfikasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function lokasiPath_Callback(hObject, eventdata, handles)
% hObject    handle to lokasiPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lokasiPath as text
%        str2double(get(hObject,'String')) returns contents of lokasiPath as a double


% --- Executes during object creation, after setting all properties.
function lokasiPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lokasiPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ProsesAkurasi.
function ProsesAkurasi_Callback(hObject, eventdata, handles)
% hObject    handle to ProsesAkurasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
semuahdLayer = handles.hiddenlayer.String;     
indexhdLayer = handles.hiddenlayer.Value;
hdLayerTerpilih = semuahdLayer{indexhdLayer};

semuaJmlEpoch = handles.jumlahEpoch.String;     
indexJmlEpoch = handles.jumlahEpoch.Value;
epochTerpilih = semuaJmlEpoch{indexJmlEpoch};

semuafTrain = handles.fungsiTrain.String;     
indexfTrain= handles.fungsiTrain.Value;
fTrainTerpilih = semuafTrain{indexfTrain};

semuaAktivasi1 = handles.aktivasi1.String;     
indexAktivasi1 = handles.aktivasi1.Value;
aktivasi1Terpilih = semuaAktivasi1{indexAktivasi1};

semuaAktivasi2 = handles.aktivasi2.String;     
indexAktivasi2 = handles.aktivasi2.Value;
aktivasi2Terpilih = semuaAktivasi2{indexAktivasi2};

semuaNeuron1 = handles.jumlahNeuron1.String;     
indexNeuron1 = handles.jumlahNeuron1.Value;
neuron1Terpilih = semuaNeuron1{indexNeuron1};

semuaNeuron2 = handles.jumlahNeuron2.String;     
indexNeuron2 = handles.jumlahNeuron2.Value;
neuron2Terpilih = semuaNeuron2{indexNeuron2};

setEpoch = str2num(epochTerpilih);
jumHdlayer = str2num(hdLayerTerpilih);

if(jumHdlayer==1)
%[A,B]= xlsread('UMKM.xlsx');
A = get(handles.tabelPreprocessing, 'data');
ukurandata= size(A,2);
jumdat=size(A,1);
jumdat=jumdat(1);
range = jumdat(1)/3;
range = round(range);

data = A(1:jumdat,1:ukurandata-1);

dataUMKM = data';

class = A(1:jumdat,ukurandata);
classUMKM = class';

% jumlData = length(classUMKM);
% dTrain = round(jumlData*(2/3));

 %Model ke - 1
 KTrain1 = dataUMKM(:,range+1:end);
 LabelTrain1 =classUMKM(range+1:end);
 
 KTest1 = dataUMKM(:,1:range);
 LabelTest1 =classUMKM(1:range);
 
 rand('seed',491218382);
 
 %net = newff(KTrain1,LabelTrain1,[str2num(neuron1Terpilih),100],{'logsig','logsig', 'purelin'},'traingdx');
 net =newff(KTrain1,LabelTrain1,str2num(neuron1Terpilih),{aktivasi1Terpilih},fTrainTerpilih);
 net.trainParam.epochs=setEpoch;
 [net,tr]= train(net,KTrain1,LabelTrain1);
 out1 = sim(net,KTest1);
 luaran1 = round(out1);
 Hasil1 = confusionmat(luaran1,LabelTest1);
 akurasiK1 = (sum(diag(Hasil1))/sum(sum(Hasil1)))*100;

 
  %Model ke - 2
 KTrain2 = dataUMKM(:,[1:range range*2+1:end]);
 LabelTrain2 =classUMKM([1:range range*2+1:end]);
 
 KTest2 = dataUMKM(:,range+1:range*2);
 LabelTest2=classUMKM(range+1:range*2);

 rand('seed',491218382);
 %net = newff(KTrain2,LabelTrain2,[5,10],{'logsig','tansig', 'purelin'},'traingdm');
 net =newff(KTrain2,LabelTrain2,str2num(neuron1Terpilih),{aktivasi1Terpilih},fTrainTerpilih);
 net.trainParam.epochs= setEpoch;
 [net,tr]= train(net,KTrain2,LabelTrain2);
 out2 = sim(net,KTest2);
 luaran2 = round(out2);
 Hasil2 = confusionmat(luaran2,LabelTest2);
 akurasiK2 = (sum(diag(Hasil2))/sum(sum(Hasil2)))*100;
 
 %Model ke - 3
 KTrain3 = dataUMKM(:,1:range*2);
 LabelTrain3 = classUMKM(1:range*2);
 
 KTest3 = dataUMKM(:,range*2+1:end);
 LabelTest3= classUMKM(range*2+1:end);

 rand('seed',491218382);
 %net = newff(KTrain3,LabelTrain3,[70,100],{'tansig','tansig', 'purelin'},'traingdx');
 net =newff(KTrain3,LabelTrain3,str2num(neuron1Terpilih),{aktivasi1Terpilih},fTrainTerpilih);
 net.trainParam.epochs= setEpoch;
 [net,tr]= train(net,KTrain3,LabelTrain3);
 out3 = sim(net,KTest3);
 luaran3 = round(out3);
 Hasil3 = confusionmat(luaran3,LabelTest3);
 akurasiK3 = (sum(diag(Hasil3))/sum(sum(Hasil3)))*100;
 
 JmlHasil = akurasiK1+akurasiK2+akurasiK3;
 akurasiKF =(JmlHasil/3);
%  disp(['Akurasi Model 1 = ' num2str(akurasiK1) ' %']);
%  disp(['Akurasi Model 2 = ' num2str(akurasiK2) ' %']);
%  disp(['Akurasi Model 3 = ' num2str(akurasiK3) ' %']);
%  disp(['Akurasi Final   = ' num2str(akurasiKF) ' %']);
set(handles.nilaiAkurasi,'String',num2str(akurasiKF) );

elseif(jumHdlayer==2) 
%[A,B]= xlsread('UMKM.xlsx');
A = get(handles.tabelPreprocessing, 'data');
ukurandata= size(A,2);
jumdat=size(A,1);
jumdat=jumdat(1);
range = jumdat(1)/3;
range = round(range);

data = A(1:jumdat,1:ukurandata-1);
dataUMKM = data';

class = A(1:jumdat,ukurandata);
classUMKM = class';

% jumlData = length(classUMKM);
% dTrain = round(jumlData*(2/3));

 %Model ke - 1
 KTrain1 = dataUMKM(:,range+1:end);
 LabelTrain1 =classUMKM(range+1:end);
 
 KTest1 = dataUMKM(:,1:range);
 LabelTest1 =classUMKM(1:range);
 
 rand('seed',491218382);
 
 net = newff(KTrain1,LabelTrain1,[str2num(neuron1Terpilih),str2num(neuron2Terpilih)],{aktivasi1Terpilih, aktivasi2Terpilih, 'purelin'},fTrainTerpilih);
 %net =newff(KTrain1,LabelTrain1,str2num(neuron1Terpilih),{aktivasi1Terpilih},fTrainTerpilih);
 net.trainParam.epochs= setEpoch;
 [net,tr]= train(net,KTrain1,LabelTrain1);
 out1 = sim(net,KTest1);
 luaran1 = round(out1);
 Hasil1 = confusionmat(luaran1,LabelTest1);
 akurasiK1 = (sum(diag(Hasil1))/sum(sum(Hasil1)))*100;

 
  %Model ke - 2
 KTrain2 = dataUMKM(:,[1:range range*2+1:end]);
 LabelTrain2 =classUMKM([1:range range*2+1:end]);
 
 KTest2 = dataUMKM(:,range+1:range*2);
 LabelTest2=classUMKM(range+1:range*2);

 rand('seed',491218382);
 net = newff(KTrain2,LabelTrain2,[str2num(neuron1Terpilih),str2num(neuron2Terpilih)],{aktivasi1Terpilih, aktivasi2Terpilih, 'purelin'},fTrainTerpilih);
 %net =newff(KTrain2,LabelTrain2,str2num(neuron1Terpilih),{aktivasi1Terpilih},fTrainTerpilih);
 net.trainParam.epochs= setEpoch;
 [net,tr]= train(net,KTrain2,LabelTrain2);
 out2 = sim(net,KTest2);
 luaran2 = round(out2);
 Hasil2 = confusionmat(luaran2,LabelTest2);
 akurasiK2 = (sum(diag(Hasil2))/sum(sum(Hasil2)))*100;
 
 %Model ke - 3
 KTrain3 = dataUMKM(:,1:range*2);
 LabelTrain3 = classUMKM(1:range*2);
 
 KTest3 = dataUMKM(:,range*2+1:end);
 LabelTest3= classUMKM(range*2+1:end);

 rand('seed',491218382);
 net = newff(KTrain3,LabelTrain3,[str2num(neuron1Terpilih),str2num(neuron2Terpilih)],{aktivasi1Terpilih, aktivasi2Terpilih, 'purelin'},fTrainTerpilih);
 %net =newff(KTrain3,LabelTrain3,str2num(neuron1Terpilih),{aktivasi1Terpilih},fTrainTerpilih);
 net.trainParam.epochs= setEpoch;
 [net,tr]= train(net,KTrain3,LabelTrain3);
 out3 = sim(net,KTest3);
 luaran3 = round(out3);
 Hasil3 = confusionmat(luaran3,LabelTest3);
 akurasiK3 = (sum(diag(Hasil3))/sum(sum(Hasil3)))*100;
 
 JmlHasil = akurasiK1+akurasiK2+akurasiK3;
 akurasiKF =(JmlHasil/3);
%  disp(['Akurasi Model 1 = ' num2str(akurasiK1) ' %']);
%  disp(['Akurasi Model 2 = ' num2str(akurasiK2) ' %']);
%  disp(['Akurasi Model 3 = ' num2str(akurasiK3) ' %']);
%  disp(['Akurasi Final   = ' num2str(akurasiKF) ' %']);
set(handles.nilaiAkurasi,'String',num2str(akurasiKF) );
end
catch
    f = warndlg('Import data terlebih dahulu atau lakukan preprocessing','Peringatan');
end


% --- Executes on button press in resetAkurasi.
function resetAkurasi_Callback(hObject, eventdata, handles)
% hObject    handle to resetAkurasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nilaiAkurasi,'String','');


% --- Executes on button press in prosesUjiData.
function prosesUjiData_Callback(hObject, eventdata, handles)
% hObject    handle to prosesUjiData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[A,B]= xlsread('UMKM.xlsx');
try
A = get(handles.tabelPreprocessing, 'data');
ukurandata= size(A,2);
jumdat=size(A,1);
jumdat=jumdat(1);
range = jumdat(1)/3;
range = round(range);

data = A(1:jumdat,1:ukurandata-1);
dataUMKM = data';

class = A(1:jumdat,ukurandata);
classUMKM = class';

% jumlData = length(classUMKM);
% dTrain = round(jumlData*(2/3));

 %Model ke - 1
 KTrain1 = dataUMKM(:,range+1:end);
 LabelTrain1 =classUMKM(range+1:end);
 
 KTest1 = dataUMKM(:,1:range);
 LabelTest1 =classUMKM(1:range);
 
 rand('seed',491218382);
 net = newff(KTrain1,LabelTrain1,[30,30],{'logsig','logsig', 'purelin'},'trainlm');
 net.trainParam.epochs=250;

 [net,tr]= train(net,KTrain1,LabelTrain1);
 out1 = sim(net,KTest1);
 luaran1 = round(out1);
 Hasil1 = confusionmat(luaran1,LabelTest1);
 akurasiK1 = (sum(diag(Hasil1))/sum(sum(Hasil1)))*100;
 
  %Model ke - 2
 KTrain2 = dataUMKM(:,[1:range range*2+1:end]);
 LabelTrain2 =classUMKM([1:range range*2+1:end]);
 
 KTest2 = dataUMKM(:,range+1:range*2);
 LabelTest2=classUMKM(range+1:range*2);

 rand('seed',491218382);
 net = newff(KTrain2,LabelTrain2,[30,30],{'logsig','logsig', 'purelin'},'trainlm');
 net.trainParam.epochs=250;
 [net,tr]= train(net,KTrain2,LabelTrain2);
 out2 = sim(net,KTest2);
 luaran2 = round(out2);
 Hasil2 = confusionmat(luaran2,LabelTest2);
 akurasiK2 = (sum(diag(Hasil2))/sum(sum(Hasil2)))*100;
 
 %Model ke - 3
 KTrain3 = dataUMKM(:,1:range*2);
 LabelTrain3 = classUMKM(1:range*2);
 
 KTest3 = dataUMKM(:,range*2+1:end);
 LabelTest3= classUMKM(range*2+1:end);

 rand('seed',491218382);
 net = newff(KTrain3,LabelTrain3,[30,30],{'logsig','logsig', 'purelin'},'trainlm');
 net.trainParam.epochs=250;

 [net,tr]= train(net,KTrain3,LabelTrain3);
 out3 = sim(net,KTest3);
 luaran3 = round(out3);
 Hasil3 = confusionmat(luaran3,LabelTest3);
 akurasiK3 = (sum(diag(Hasil3))/sum(sum(Hasil3)))*100;

jumKar = str2num(get(handles.inputJmlKaryawan,'String'));
ast = str2num(get(handles.aset,'String'));
omset = str2num(get(handles.omzet,'String')); 
tahunberdiri = str2num(get(handles.tahunBerdiri,'String')); 

 %aset
if ast >= 0 && ast <= 50000000 ast = 1;
elseif ast > 50000000 && ast <= 500000000 ast = 2;
elseif ast > 500000000 && ast <= 10000000000 ast = 3;
end

%omzet
if omset >= 0 && omset <= 300000000 omset =1;
elseif omset > 300000000 && omset <= 2500000000 omset =2;
elseif omset > 2500000000 && omset <= 50000000000 omset =3;
end

%jumkaryawan
if jumKar >= 0 && jumKar <= 4.166667 jumKar = 1;
elseif jumKar > 4.166667 && jumKar <= 8.333333 jumKar = 2;
elseif jumKar > 8.333333 && jumKar <= 12.5 jumKar = 3;
elseif jumKar > 12.5 && jumKar <= 16.66667 jumKar = 4;
elseif jumKar > 16.66667 && jumKar <= 20.83333 jumKar = 5;
elseif jumKar > 20.83333 && jumKar <= 25 jumKar = 6;
elseif jumKar > 25 && jumKar <= 29.16667 jumKar = 7;
elseif jumKar > 29.16667 && jumKar <= 33.33333 jumKar = 8;
elseif jumKar > 33.33333 && jumKar <= 37.5 jumKar =9;
elseif jumKar > 37.5 && jumKar <= 41.66667 jumKar=10;
elseif jumKar > 41.66667 && jumKar <= 45.83333  jumKar=11;
elseif jumKar > 45.83333 && jumKar <= 50 jumKar=12;
end
%jdlamaberdiri
tahunberdiri = 2018 - tahunberdiri;
%tahunberdiri
%coba
if tahunberdiri >=1 && tahunberdiri <= 7.416667 tahunberdiri =1;
elseif tahunberdiri > 7.416667 && tahunberdiri <= 13.83333 tahunberdiri =2;
elseif tahunberdiri > 13.83333 && tahunberdiri <= 20.25  tahunberdiri =3;
elseif tahunberdiri > 20.25 && tahunberdiri <= 26.66667 tahunberdiri =4;
elseif tahunberdiri > 26.66667 && tahunberdiri <= 33.08333 tahunberdiri =5;
elseif tahunberdiri > 33.08333 && tahunberdiri <= 39.5 tahunberdiri =6;
elseif tahunberdiri > 39.5 && tahunberdiri <= 45.91667 tahunberdiri =7;
elseif tahunberdiri > 45.91667 && tahunberdiri <= 52.33333 tahunberdiri=8;
elseif tahunberdiri > 52.33333 && tahunberdiri <= 58.75 tahunberdiri=9;
elseif tahunberdiri > 58.75 && tahunberdiri <= 65.16667 tahunberdiri=10;
elseif tahunberdiri > 65.16667 && tahunberdiri <= 71.58333 tahunberdiri=11;
elseif tahunberdiri > 71.58333 && tahunberdiri <= 78 tahunberdiri=12;
end

 dataUji=[jumKar ast omset tahunberdiri];
 dataUji=dataUji';
 idd=sim(net,dataUji);
 idd=round(idd);
 outputKlasifikasi = idd;
 
 if(outputKlasifikasi==1)
     mikro='mikro';
     set(handles.hasilKlasfikasi,'String',char(mikro));
 elseif(outputKlasifikasi==2)
     kecil='kecil';
     set(handles.hasilKlasfikasi,'String',char(kecil));
 elseif(outputKlasifikasi==3)
     menengah='menengah';
     set(handles.hasilKlasfikasi,'String',char(menengah));
 end
catch
    f = warndlg('Data Belum diimport atau Kesalahan input','Peringatan');
end

 
% --- Executes on selection change in aktivasi2.
function aktivasi2_Callback(hObject, eventdata, handles)
% hObject    handle to aktivasi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns aktivasi2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from aktivasi2


% --- Executes during object creation, after setting all properties.
function aktivasi2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aktivasi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in jumlahNeuron2.
function jumlahNeuron2_Callback(hObject, eventdata, ~)
% hObject    handle to jumlahNeuron2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns jumlahNeuron2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from jumlahNeuron2


% --- Executes during object creation, after setting all properties.
function jumlahNeuron2_CreateFcn(hObject, ~, ~)
% hObject    handle to jumlahNeuron2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in jumlahEpoch.
function jumlahEpoch_Callback(~, ~, ~)
% hObject    handle to jumlahEpoch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns jumlahEpoch contents as cell array
%        contents{get(hObject,'Value')} returns selected item from jumlahEpoch


% --- Executes during object creation, after setting all properties.
function jumlahEpoch_CreateFcn(hObject, ~, ~)
% hObject    handle to jumlahEpoch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function menutab_Callback(hObject, eventdata, handles)
% hObject    handle to menutab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function bantuan_Callback(hObject, eventdata, handles)
% hObject    handle to bantuan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({
    '1.klik Import Button untuk memasukkan data pada program, data berupa file excel',
    '',
    '2.Setelah berhasil import data, lakukan preprocessing dengan cara klik Preprocessing Button',
    '',
    '3.Perhitungan akurasi dapat dilakukan setelah melakukan 2 langkah diatas',
    'perhitungan akurasi dapat dilakukan dengan mengatur fungsi fungsi pada panel hitung akurasi yang diinginkan',
    'Setelah menset fungsi fungsi pada panel Uji Akurasi, klik Proses button untuk memperoleh keluaran hasil akurasi',
    '',
    '4.Uji data tunggal dilakukan dengan melakukan pengisian data pada panel Uji data tunggal dengan benar sesuai format data, klik tombol proses untuk melakukan uji data tunggal',
    '',
    '5. Tombol reset digunakan untuk mengosongkan keluaran pada program'},'Tutorial menggunakan program');


% --------------------------------------------------------------------
function tentang_Callback(hObject, eventdata, handles)
% hObject    handle to tentang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myicon = imread('tatag_Hardoyo_165314021.jpeg');
myicon = imresize(myicon, [64 NaN]);
msgbox({'Oleh : TATAG HARDOYO (165314021)'},'Tentang','custom',myicon);


% --- Executes on button press in resKlasi.
function resKlasi_Callback(hObject, eventdata, handles)
% hObject    handle to resKlasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.hasilKlasfikasi,'String','');


% --- Executes on selection change in jNeuron1.
function jNeuron1_Callback(hObject, eventdata, handles)
% hObject    handle to jNeuron1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns jNeuron1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from jNeuron1


% --- Executes during object creation, after setting all properties.
function jNeuron1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jNeuron1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in jNeuron2.
function jNeuron2_Callback(hObject, eventdata, handles)
% hObject    handle to jNeuron2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns jNeuron2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from jNeuron2


% --- Executes during object creation, after setting all properties.
function jNeuron2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jNeuron2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in jumlahEpoch2.
function jumlahEpoch2_Callback(hObject, eventdata, handles)
% hObject    handle to jumlahEpoch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns jumlahEpoch2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from jumlahEpoch2


% --- Executes during object creation, after setting all properties.
function jumlahEpoch2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jumlahEpoch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in aktivasif2.
function aktivasif2_Callback(hObject, eventdata, handles)
% hObject    handle to aktivasif2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns aktivasif2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from aktivasif2


% --- Executes during object creation, after setting all properties.
function aktivasif2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aktivasif2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in resetAkurasi2.
function resetAkurasi2_Callback(hObject, eventdata, handles)
% hObject    handle to resetAkurasi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nilaiAkurasi2,'String','');


% --- Executes on button press in ProsesAkurasi2.
function ProsesAkurasi2_Callback(hObject, eventdata, handles)
% hObject    handle to ProsesAkurasi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
semuahdLayer = handles.hiddenlayer2.String;     
indexhdLayer = handles.hiddenlayer2.Value;
hdLayerTerpilih = semuahdLayer{indexhdLayer};

semuaJmlEpoch = handles.jumlahEpoch2.String;     
indexJmlEpoch = handles.jumlahEpoch2.Value;
epochTerpilih = semuaJmlEpoch{indexJmlEpoch};

semuafTrain = handles.fungsiTrain2.String;     
indexfTrain= handles.fungsiTrain2.Value;
fTrainTerpilih = semuafTrain{indexfTrain};

semuaAktivasi1 = handles.aktivasif1.String;     
indexAktivasi1 = handles.aktivasif1.Value;
aktivasi1Terpilih = semuaAktivasi1{indexAktivasi1};

semuaAktivasi2 = handles.aktivasif2.String;     
indexAktivasi2 = handles.aktivasif2.Value;
aktivasi2Terpilih = semuaAktivasi2{indexAktivasi2};

semuaNeuron1 = handles.jNeuron1.String;     
indexNeuron1 = handles.jNeuron1.Value;
neuron1Terpilih = semuaNeuron1{indexNeuron1};

semuaNeuron2 = handles.jNeuron2.String;     
indexNeuron2 = handles.jNeuron2.Value;
neuron2Terpilih = semuaNeuron2{indexNeuron2};

setEpoch = str2num(epochTerpilih);
jumHdlayer = str2num(hdLayerTerpilih);

if(jumHdlayer==1)
%[A,B]= xlsread('UMKM.xlsx');
A = get(handles.tabelPreprocessing2, 'data');
ukurandata= size(A,2);
% X=A(:,1:ukurandata-1);
% Y=A(:,ukurandata);
jumdat=size(A,1);

range = jumdat(1)/3;
range = round(range);

data = A(1:jumdat,1:4);
dataUMKM = data';

classA  = A(1:jumdat,5);
classUMKM = classA';

classB = A(1:jumdat,6);
classUMKMB = classB';

 %Model ke - 1
KTrain1 = dataUMKM(:,(range+1):jumdat);
LabelTrain1M1 = classUMKM(range+1:jumdat);
LabelTrain2M1 = classUMKMB(range+1:jumdat);
KTest1 = dataUMKM(:,1:range);
LabelTest1M1 = classUMKM(1:range);
LabelTest2M1 = classUMKMB(1:range);

rand('seed',491218382);
% net = newff(KTrain1,[LabelTrain1M1;LabelTrain2M1],[30,30],{'logsig','logsig', 'purelin'},'trainlm');
net =newff(KTrain1,[LabelTrain1M1;LabelTrain2M1],str2num(neuron1Terpilih),{aktivasi1Terpilih 'purelin'},fTrainTerpilih);
net.trainParam.epochs= setEpoch;
[net,tr]= train(net,KTrain1,[LabelTrain1M1;LabelTrain2M1]);
out1 = sim(net,KTest1);
luaran1 = round(out1);
targetM1=round([LabelTest1M1;LabelTest2M1]);
for(i=1:785)
if isequal(luaran1(:,[i]),[0;0]) denoL1(i)=1;
elseif isequal(luaran1(:,[i]),[0;1]) denoL1(i)=2;
elseif isequal(luaran1(:,[i]),[1;1]) denoL1(i)=3;
end
if isequal(targetM1(:,[i]),[0;0]) denoT1(i)=1;
elseif isequal(targetM1(:,[i]),[0;1]) denoT1(i)=2;
elseif isequal(targetM1(:,[i]),[1;1]) denoT1(i)=3;
end
end
Hasil1=confusionmat(denoT1,denoL1);
akurasiK1 = (sum(diag(Hasil1))/sum(sum(Hasil1)))*100;

  %Model ke - 2
KTrain2 = dataUMKM(:,[(1:range) (range*2+1:end)]);
LabelTrain1M2 = classUMKM([(1:range) (range*2+1:end)]);
LabelTrain2M2 = classUMKMB([(1:range) (range*2+1:end)]); 
KTest2 = dataUMKM(:,range+1:range*2);
LabelTest1M2 = classUMKM(range+1:range*2);
LabelTest2M2 = classUMKMB(range+1:range*2);
 
rand('seed',491218382);
%net = newff(KTrain2,[LabelTrain1M2;LabelTrain2M2],[30,30],{'logsig','logsig', 'purelin'},'trainlm');
net =newff(KTrain2,[LabelTrain1M2;LabelTrain2M2],str2num(neuron1Terpilih),{aktivasi1Terpilih 'purelin'},fTrainTerpilih);
net.trainParam.epochs=setEpoch;
[net,tr]= train(net,KTrain2,[LabelTrain1M2;LabelTrain2M2]);
out2 = sim(net,KTest2);
luaran2 = round(out2);
targetM2 = round([LabelTest1M2;LabelTest2M2]);
for(i=1:785)
if isequal(luaran2(:,[i]),[0;0]) denoL2(i)=1;
elseif isequal(luaran2(:,[i]),[0;1]) denoL2(i)=2;
elseif isequal(luaran2(:,[i]),[1;1]) denoL2(i)=3;
end
if isequal(targetM2(:,[i]),[0;0]) denoT2(i)=1;
elseif isequal(targetM2(:,[i]),[0;1]) denoT2(i)=2;
elseif isequal(targetM2(:,[i]),[1;1]) denoT2(i)=3;
end
end
Hasil2 = confusionmat(denoT2,denoL2);
% plotConfMat(Hasil2);
% c_matrix1 = confusion.getMatrix(luaran2,[LabelTest1M2;LabelTest2M2]);
akurasiK2 = (sum(diag(Hasil2))/sum(sum(Hasil2)))*100;
 
 %Model ke - 3
 KTrain3 = dataUMKM(:,1:range*2);
LabelTrain1M3 = classUMKM(1:range*2);
LabelTrain2M3 = classUMKMB(1:range*2);
KTest3 = dataUMKM(:,range*2+1:end);
LabelTest1M3 = classUMKM(range*2+1:end);
LabelTest2M3 = classUMKMB(range*2+1:end);
 
rand('seed',491218382);
% net = newff(KTrain3,[LabelTrain1M3;LabelTrain2M3],[30,30],{'logsig','logsig', 'purelin'},'trainlm');
net =newff(KTrain3,[LabelTrain1M3;LabelTrain2M3],str2num(neuron1Terpilih),{aktivasi1Terpilih 'purelin'},fTrainTerpilih);
net.trainParam.epochs= setEpoch;
[net,tr]= train(net,KTrain3,[LabelTrain1M3;LabelTrain2M3]);
out3 = sim(net,KTest3);
luaran3 = round(out3);
targetM3 = round([LabelTest1M3;LabelTest2M3]);
for(i=1:785)
if isequal(luaran3(:,[i]),[0;0]) denoL3(i)=1;
elseif isequal(luaran3(:,[i]),[0;1]) denoL3(i)=2;
elseif isequal(luaran3(:,[i]),[1;1]) denoL3(i)=3;
end
if isequal(targetM3(:,[i]),[0;0]) denoT3(i)=1;
elseif isequal(targetM3(:,[i]),[0;1]) denoT3(i)=2;
elseif isequal(targetM3(:,[i]),[1;1]) denoT3(i)=3;
end
end
Hasil3 = confusionmat(denoT3,denoL3);
% plotConfMat(Hasil3)
% c_matrix2 = confusion.getMatrix(luaran3,[LabelTest1M3;LabelTest2M3]);
akurasiK3 = (sum(diag(Hasil3))/sum(sum(Hasil3)))*100;
 
 JmlHasil = akurasiK1+akurasiK2+akurasiK3;
 akurasiKF =(JmlHasil/3);
%  disp(['Akurasi Model 1 = ' num2str(akurasiK1) ' %']);
%  disp(['Akurasi Model 2 = ' num2str(akurasiK2) ' %']);
%  disp(['Akurasi Model 3 = ' num2str(akurasiK3) ' %']);
%  disp(['Akurasi Final   = ' num2str(akurasiKF) ' %']);
set(handles.nilaiAkurasi2,'String',num2str(akurasiKF) );

elseif(jumHdlayer==2) 
%[A,B]= xlsread('UMKM.xlsx');
A = get(handles.tabelPreprocessing2, 'data');
ukurandata= size(A,2);
% X=A(:,1:ukurandata-1);
% Y=A(:,ukurandata);
jumdat=size(A,1);

range = jumdat(1)/3;
range = round(range);

data = A(1:jumdat,1:4);
dataUMKM = data';

classA  = A(1:jumdat,5);
classUMKM = classA';

classB = A(1:jumdat,6);
classUMKMB = classB';

 %Model ke - 1
KTrain1 = dataUMKM(:,(range+1):jumdat);
LabelTrain1M1 = classUMKM(range+1:jumdat);
LabelTrain2M1 = classUMKMB(range+1:jumdat);
KTest1 = dataUMKM(:,1:range);
LabelTest1M1 = classUMKM(1:range);
LabelTest2M1 = classUMKMB(1:range);

rand('seed',491218382);
net = newff(KTrain1,[LabelTrain1M1;LabelTrain2M1],[str2num(neuron1Terpilih),str2num(neuron2Terpilih)],{aktivasi1Terpilih, aktivasi2Terpilih, 'purelin'},fTrainTerpilih);
% net =newff(KTrain1,[LabelTrain1M1;LabelTrain2M1],str2num(neuron1Terpilih),{aktivasi1Terpilih 'purelin'},fTrainTerpilih);
net.trainParam.epochs= setEpoch;
[net,tr]= train(net,KTrain1,[LabelTrain1M1;LabelTrain2M1]);
out1 = sim(net,KTest1);
luaran1 = round(out1);
targetM1=round([LabelTest1M1;LabelTest2M1]);
for(i=1:785)
if isequal(luaran1(:,[i]),[0;0]) denoL1(i)=1;
elseif isequal(luaran1(:,[i]),[0;1]) denoL1(i)=2;
elseif isequal(luaran1(:,[i]),[1;1]) denoL1(i)=3;
end
if isequal(targetM1(:,[i]),[0;0]) denoT1(i)=1;
elseif isequal(targetM1(:,[i]),[0;1]) denoT1(i)=2;
elseif isequal(targetM1(:,[i]),[1;1]) denoT1(i)=3;
end
end
Hasil1=confusionmat(denoT1,denoL1);
akurasiK1 = (sum(diag(Hasil1))/sum(sum(Hasil1)))*100;

  %Model ke - 2
KTrain2 = dataUMKM(:,[(1:range) (range*2+1:end)]);
LabelTrain1M2 = classUMKM([(1:range) (range*2+1:end)]);
LabelTrain2M2 = classUMKMB([(1:range) (range*2+1:end)]); 
KTest2 = dataUMKM(:,range+1:range*2);
LabelTest1M2 = classUMKM(range+1:range*2);
LabelTest2M2 = classUMKMB(range+1:range*2);
 
rand('seed',491218382);
net = newff(KTrain2,[LabelTrain1M2;LabelTrain2M2],[str2num(neuron1Terpilih),str2num(neuron2Terpilih)],{aktivasi1Terpilih, aktivasi2Terpilih, 'purelin'},fTrainTerpilih);
% net =newff(KTrain2,[LabelTrain1M2;LabelTrain2M2],str2num(neuron1Terpilih),{aktivasi1Terpilih 'purelin'},fTrainTerpilih);
net.trainParam.epochs=setEpoch;
[net,tr]= train(net,KTrain2,[LabelTrain1M2;LabelTrain2M2]);
out2 = sim(net,KTest2);
luaran2 = round(out2);
targetM2 = round([LabelTest1M2;LabelTest2M2]);
for(i=1:785)
if isequal(luaran2(:,[i]),[0;0]) denoL2(i)=1;
elseif isequal(luaran2(:,[i]),[0;1]) denoL2(i)=2;
elseif isequal(luaran2(:,[i]),[1;1]) denoL2(i)=3;
end
if isequal(targetM2(:,[i]),[0;0]) denoT2(i)=1;
elseif isequal(targetM2(:,[i]),[0;1]) denoT2(i)=2;
elseif isequal(targetM2(:,[i]),[1;1]) denoT2(i)=3;
end
end
Hasil2 = confusionmat(denoT2,denoL2);
% plotConfMat(Hasil2);
% c_matrix1 = confusion.getMatrix(luaran2,[LabelTest1M2;LabelTest2M2]);
akurasiK2 = (sum(diag(Hasil2))/sum(sum(Hasil2)))*100;
 
 %Model ke - 3
 KTrain3 = dataUMKM(:,1:range*2);
LabelTrain1M3 = classUMKM(1:range*2);
LabelTrain2M3 = classUMKMB(1:range*2);
KTest3 = dataUMKM(:,range*2+1:end);
LabelTest1M3 = classUMKM(range*2+1:end);
LabelTest2M3 = classUMKMB(range*2+1:end);
 
rand('seed',491218382);
net = newff(KTrain3,[LabelTrain1M3;LabelTrain2M3],[str2num(neuron1Terpilih),str2num(neuron2Terpilih)],{aktivasi1Terpilih, aktivasi2Terpilih, 'purelin'},fTrainTerpilih);
% net =newff(KTrain3,[LabelTrain1M3;LabelTrain2M3],str2num(neuron1Terpilih),{aktivasi1Terpilih 'purelin'},fTrainTerpilih);
net.trainParam.epochs= setEpoch;
[net,tr]= train(net,KTrain3,[LabelTrain1M3;LabelTrain2M3]);
out3 = sim(net,KTest3);
luaran3 = round(out3);
targetM3 = round([LabelTest1M3;LabelTest2M3]);
for(i=1:785)
if isequal(luaran3(:,[i]),[0;0]) denoL3(i)=1;
elseif isequal(luaran3(:,[i]),[0;1]) denoL3(i)=2;
elseif isequal(luaran3(:,[i]),[1;1]) denoL3(i)=3;
end
if isequal(targetM3(:,[i]),[0;0]) denoT3(i)=1;
elseif isequal(targetM3(:,[i]),[0;1]) denoT3(i)=2;
elseif isequal(targetM3(:,[i]),[1;1]) denoT3(i)=3;
end
end
Hasil3 = confusionmat(denoT3,denoL3);
% plotConfMat(Hasil3)
% c_matrix2 = confusion.getMatrix(luaran3,[LabelTest1M3;LabelTest2M3]);
akurasiK3 = (sum(diag(Hasil3))/sum(sum(Hasil3)))*100;
 
 JmlHasil = akurasiK1+akurasiK2+akurasiK3;
 akurasiKF =(JmlHasil/3);
%  disp(['Akurasi Model 1 = ' num2str(akurasiK1) ' %']);
%  disp(['Akurasi Model 2 = ' num2str(akurasiK2) ' %']);
%  disp(['Akurasi Model 3 = ' num2str(akurasiK3) ' %']);
%  disp(['Akurasi Final   = ' num2str(akurasiKF) ' %']);
set(handles.nilaiAkurasi2,'String',num2str(akurasiKF) );

end
catch
    f = warndlg('Import data terlebih dahulu atau lakukan preprocessing','Peringatan');
end


% --- Executes on selection change in popupmenu20.
function popupmenu20_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu20 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu20


% --- Executes during object creation, after setting all properties.
function popupmenu20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in aktivasif1.
function aktivasif1_Callback(hObject, eventdata, handles)
% hObject    handle to aktivasif1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns aktivasif1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from aktivasif1


% --- Executes during object creation, after setting all properties.
function aktivasif1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aktivasif1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in hiddenlayer2.
function hiddenlayer2_Callback(hObject, eventdata, handles)
% hObject    handle to hiddenlayer2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns hiddenlayer2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from hiddenlayer2
popvalue = get(handles.hiddenlayer2,'value');
if (popvalue == 2)
set(handles.aktivasif2,'Enable','on');
set(handles.jNeuron2,'Enable','on');
elseif(popvalue == 1)
set(handles.aktivasif2,'Enable','off');
set(handles.jNeuron2,'Enable','off');
end


% --- Executes during object creation, after setting all properties.
function hiddenlayer2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hiddenlayer2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaiAkurasi2_Callback(hObject, eventdata, handles)
% hObject    handle to nilaiAkurasi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaiAkurasi2 as text
%        str2double(get(hObject,'String')) returns contents of nilaiAkurasi2 as a double


% --- Executes during object creation, after setting all properties.
function nilaiAkurasi2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaiAkurasi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in jumlahNeuron2.
function popupmenu10_Callback(hObject, eventdata, handles)
% hObject    handle to jumlahNeuron2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns jumlahNeuron2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from jumlahNeuron2


% --- Executes during object creation, after setting all properties.
function popupmenu10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jumlahNeuron2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in fungsiTrain2.
function fungsiTrain2_Callback(hObject, eventdata, handles)
% hObject    handle to fungsiTrain2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fungsiTrain2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fungsiTrain2


% --- Executes during object creation, after setting all properties.
function fungsiTrain2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fungsiTrain2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
