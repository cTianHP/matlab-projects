function varargout = ProjectNo3(varargin)
% PROJECTNO3 MATLAB code for ProjectNo3.fig
%      PROJECTNO3, by itself, creates a new PROJECTNO3 or raises the existing
%      singleton*.
%
%      H = PROJECTNO3 returns the handle to a new PROJECTNO3 or the handle to
%      the existing singleton*.
%
%      PROJECTNO3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTNO3.M with the given input arguments.
%
%      PROJECTNO3('Property','Value',...) creates a new PROJECTNO3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProjectNo3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProjectNo3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProjectNo3

% Last Modified by GUIDE v2.5 19-May-2022 12:49:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProjectNo3_OpeningFcn, ...
                   'gui_OutputFcn',  @ProjectNo3_OutputFcn, ...
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


% --- Executes just before ProjectNo3 is made visible.
function ProjectNo3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProjectNo3 (see VARARGIN)

% Choose default command line output for ProjectNo3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ProjectNo3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ProjectNo3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkboxStatus = get(handles.checkbox1,'Value');
if(checkboxStatus)
    axes(handles.axes1);
    grid on;
else
    axes(handles.axes1);
    grid off;
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dataCovid;
[handles.namafile, handles.direktori] = uigetfile({'*.xls;*.xlsx','File Excel(*.xls,*.xlsx)';'*.*','Semua file(*.*)'}, 'Pilih File Excel yang akan Ditampilkan');
dataExcel = fullfile(handles.namafile);
dataCovid=readtable(dataExcel);
set(handles.uitable1,'data',table2cell(dataCovid));

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dataCovid;
global x;
global y;
axes(handles.axes1);
x = dataCovid{:,1};
y = dataCovid{:,2};
plot(x,y);
title('Grafik Jumlah Kasus Covid')
xlabel('Bulan')
ylabel('Jumlah Kasus Covid')
guidata(hObject,handles);



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
switch get(handles.popupmenu1,'Value')
    case 1
        set(handles.axes1,'Color','white');
    case 2
        set(handles.axes1,'Color','red');
    case 3
        set(handles.axes1,'Color','blue');
    case 4
        set(handles.axes1,'Color','green');
    otherwise
end


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global dataCovid;
global x;
global y;
radiobuttonStatus = get(handles.radiobutton1,'Value');
if(radiobuttonStatus)
    axes(handles.axes1);
    plot(x,y,"-r");
    title('Grafik Jumlah Kasus Covid')
    xlabel('Bulan')
    ylabel('Jumlah Kasus Covid')
    guidata(hObject,handles);
end


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global dataCovid;
global x;
global y;
radiobuttonStatus = get(handles.radiobutton2,'Value');
if(radiobuttonStatus)
    axes(handles.axes1);
    plot(x,y,"-g");
    title('Grafik Jumlah Kasus Covid')
    xlabel('Bulan')
    ylabel('Jumlah Kasus Covid')
    guidata(hObject,handles);
end


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
global dataCovid;
global x;
global y;
radiobuttonStatus = get(handles.radiobutton3,'Value');
if(radiobuttonStatus)
    axes(handles.axes1);
    plot(x,y,"-b");
    title('Grafik Jumlah Kasus Covid')
    xlabel('Bulan')
    ylabel('Jumlah Kasus Covid')
    guidata(hObject,handles);
end
