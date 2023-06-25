function varargout = GUIDisplayData(varargin)
% GUIDISPLAYDATA MATLAB code for GUIDisplayData.fig
%      GUIDISPLAYDATA, by itself, creates a new GUIDISPLAYDATA or raises the existing
%      singleton*.
%
%      H = GUIDISPLAYDATA returns the handle to a new GUIDISPLAYDATA or the handle to
%      the existing singleton*.
%
%      GUIDISPLAYDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDISPLAYDATA.M with the given input arguments.
%
%      GUIDISPLAYDATA('Property','Value',...) creates a new GUIDISPLAYDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIDisplayData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIDisplayData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIDisplayData

% Last Modified by GUIDE v2.5 13-Apr-2022 12:40:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIDisplayData_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIDisplayData_OutputFcn, ...
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


% --- Executes just before GUIDisplayData is made visible.
function GUIDisplayData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIDisplayData (see VARARGIN)

% Choose default command line output for GUIDisplayData
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIDisplayData wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIDisplayData_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnBukaFile.
function btnBukaFile_Callback(hObject, eventdata, handles)
% hObject    handle to btnBukaFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
[handles.namafile, handles.direktori] = uigetfile({'*.xls;*.xlsx','File Excel(*.xls,*.xlsx)';'*.*','Semua file(*.*)'}, 'Buka File xls Master');

% I = fullfile(handles.direktori, handles.namafile);
I = fullfile(handles.namafile);
set(handles.txtNamaFile, 'String', I);

% --- Executes on button press in btnDisplay.
function btnDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to btnDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
global dataR;
dataR=readtable(I);
set(handles.tableDisplay,'data',table2cell(dataR));



function txtNamaFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtNamaFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNamaFile as text
%        str2double(get(hObject,'String')) returns contents of txtNamaFile as a double


% --- Executes during object creation, after setting all properties.
function txtNamaFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNamaFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnPlot.
function btnPlot_Callback(hObject, eventdata, handles)
% hObject    handle to btnPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dataR;
axes(handles.axes1);
x = dataR{:,2};
y = dataR{:,3};
plot(x,y);
title('Grafik Jumlah Penduduk')
xlabel('Tahun')
ylabel('Jumlah Penduduk')
guidata(hObject,handles);

