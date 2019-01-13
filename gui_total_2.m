function varargout = gui_total_2(varargin)
% GUI_TOTAL_2 MATLAB code for gui_total_2.fig
%      GUI_TOTAL_2, by itself, creates a new GUI_TOTAL_2 or raises the existing
%      singleton*.
%
%      H = GUI_TOTAL_2 returns the handle to a new GUI_TOTAL_2 or the handle to
%      the existing singleton*.
%
%      GUI_TOTAL_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TOTAL_2.M with the given input arguments.
%
%      GUI_TOTAL_2('Property','Value',...) creates a new GUI_TOTAL_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_total_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_total_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_total_2

% Last Modified by GUIDE v2.5 07-Jan-2017 17:45:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_total_2_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_total_2_OutputFcn, ...
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


% --- Executes just before gui_total_2 is made visible.
function gui_total_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_total_2 (see VARARGIN)

% Choose default command line output for gui_total_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_total_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_total_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function rv_input_r_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rv_input_r_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rstr=get(handles.rv_input_r_edit,'String');
r=str2num(rstr);
setappdata(0,'r', double(r));
% Hints: get(hObject,'String') returns contents of rv_input_r_edit as text
%        str2double(get(hObject,'String')) returns contents of rv_input_r_edit as a double


% --- Executes during object creation, after setting all properties.
function rv_input_r_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rv_input_r_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rv_input_v_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rv_input_v_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vstr=get(handles.rv_input_v_edit,'String');
v=str2num(vstr);
setappdata(0,'v', double(v));

% Hints: get(hObject,'String') returns contents of rv_input_v_edit as text
%        str2double(get(hObject,'String')) returns contents of rv_input_v_edit as a double


% --- Executes during object creation, after setting all properties.
function rv_input_v_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rv_input_v_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculate_tle_pushbutton.
function calculate_tle_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_tle_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tle = get(handles.tle_input_edit,'String');
[r,v] = tletorv(tle);
set(handles.tle_output_r_text, 'String', r);
set(handles.tle_output_v_text, 'String', v);

setappdata(0,'r', double(r));
setappdata(0,'v', double(v));


% --- Executes on button press in calculate_oe_pushbutton.
function calculate_oe_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_oe_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
astr=get(handles.oe_input_a_edit,'String');
a=str2double(astr);
estr=get(handles.oe_input_e_edit,'String');
e=str2double(estr);
istr=get(handles.oe_input_i_edit,'String');
i=str2double(istr);
raanstr=get(handles.oe_input_raan_edit,'String');
raan=str2double(raanstr);
wstr=get(handles.oe_input_w_edit,'String');
w=str2double(wstr);
ustr=get(handles.oe_input_u_edit,'String');
u=str2double(ustr);
[r,v] = oetorv(a,e,i,raan,w,u);
set(handles.oe_output_r_text, 'String', r);
set(handles.oe_output_v_text, 'String', v);

setappdata(0,'r', double(r));
setappdata(0,'v', double(v));



function oe_input_u_edit_Callback(hObject, eventdata, handles)
% hObject    handle to oe_input_u_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oe_input_u_edit as text
%        str2double(get(hObject,'String')) returns contents of oe_input_u_edit as a double


% --- Executes during object creation, after setting all properties.
function oe_input_u_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oe_input_u_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oe_input_w_edit_Callback(hObject, eventdata, handles)
% hObject    handle to oe_input_w_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oe_input_w_edit as text
%        str2double(get(hObject,'String')) returns contents of oe_input_w_edit as a double


% --- Executes during object creation, after setting all properties.
function oe_input_w_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oe_input_w_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oe_input_raan_edit_Callback(hObject, eventdata, handles)
% hObject    handle to oe_input_raan_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oe_input_raan_edit as text
%        str2double(get(hObject,'String')) returns contents of oe_input_raan_edit as a double


% --- Executes during object creation, after setting all properties.
function oe_input_raan_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oe_input_raan_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oe_input_i_edit_Callback(hObject, eventdata, handles)
% hObject    handle to oe_input_i_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oe_input_i_edit as text
%        str2double(get(hObject,'String')) returns contents of oe_input_i_edit as a double


% --- Executes during object creation, after setting all properties.
function oe_input_i_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oe_input_i_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oe_input_e_edit_Callback(hObject, eventdata, handles)
% hObject    handle to oe_input_e_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oe_input_e_edit as text
%        str2double(get(hObject,'String')) returns contents of oe_input_e_edit as a double


% --- Executes during object creation, after setting all properties.
function oe_input_e_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oe_input_e_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function oe_input_a_edit_Callback(hObject, eventdata, handles)
% hObject    handle to oe_input_a_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of oe_input_a_edit as text
%        str2double(get(hObject,'String')) returns contents of oe_input_a_edit as a double


% --- Executes during object creation, after setting all properties.
function oe_input_a_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oe_input_a_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tle_input_edit_Callback(hObject, eventdata, handles)
% hObject    handle to tle_input_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tle_input_edit as text
%        str2double(get(hObject,'String')) returns contents of tle_input_edit as a double


% --- Executes during object creation, after setting all properties.
function tle_input_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tle_input_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rv_radiobutton.
function rv_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to rv_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rvchild=get(handles.rv_uipanel,'Children');
set(rvchild,'Enable','on');

oeinpchild=get(handles.oe_input_uipanel,'Children');
set(oeinpchild,'Enable','off');

set(handles.tle_input_edit,'Enable','off');

% r=get(handles.rv_input_r_edit,'String');
% v=get(handles.rv_input_v_edit,'String');


% Hint: get(hObject,'Value') returns toggle state of rv_radiobutton


% --- Executes on button press in oe_radiobutton.
function oe_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to oe_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oeinpchild=get(handles.oe_input_uipanel,'Children');
set(oeinpchild,'Enable','on');

rvchild=get(handles.rv_uipanel,'Children');
set(rvchild,'Enable','off');

set(handles.tle_input_edit,'Enable','off');



% Hint: get(hObject,'Value') returns toggle state of oe_radiobutton


% --- Executes on button press in tle_radiobutton.
function tle_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to tle_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.tle_input_edit,'Enable','on');

rvchild=get(handles.rv_uipanel,'Children');
set(rvchild,'Enable','off');

oeinpchild=get(handles.oe_input_uipanel,'Children');
set(oeinpchild,'Enable','off');



% Hint: get(hObject,'Value') returns toggle state of tle_radiobutton


% --- Executes on button press in plot_numint_pushbutton.
function plot_numint_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to plot_numint_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tof=str2num(get(handles.tof_edit,'String'));
% close the current figure
closereq;
% open new
plot_numint4(getappdata(0,'r'),getappdata(0,'v'),tof)


% --- Executes on button press in plot_kepler_pushbutton.
function plot_kepler_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to plot_kepler_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tof=str2num(get(handles.tof_edit,'String'));
% close the current figure
closereq;
% open new
plot_kepler4(getappdata(0,'r'),getappdata(0,'v'),tof)


% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function tof_edit_Callback(hObject, eventdata, handles)
% hObject    handle to tof_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tof_edit as text
%        str2double(get(hObject,'String')) returns contents of tof_edit as a double


% --- Executes during object creation, after setting all properties.
function tof_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tof_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
