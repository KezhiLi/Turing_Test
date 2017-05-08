function varargout = Turing_test(varargin)
% TURING_TEST MATLAB code for Turing_test.fig
%      TURING_TEST, by itself, creates a new TURING_TEST or raises the existing
%      singleton*.
%
%      H = TURING_TEST returns the handle to a new TURING_TEST or the handle to
%      the existing singleton*.
%
%      TURING_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TURING_TEST.M with the given input arguments.
%
%      TURING_TEST('Property','Value',...) creates a new TURING_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Turing_test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Turing_test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Turing_test

% Last Modified by GUIDE v2.5 20-Apr-2017 14:38:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Turing_test_OpeningFcn, ...
                   'gui_OutputFcn',  @Turing_test_OutputFcn, ...
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

% --- Executes just before Turing_test is made visible.
function Turing_test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Turing_test (see VARARGIN)

global root_path
global show_lay
global ff

ff = filesep;
if isempty(show_lay) && isempty(root_path)
    prompt = {'Please Enter "Turing_Test" folder path in the local PC:'};
    dlg_title = 'Video Path Locate';
    num_lines = 1;
    if strcmp(ff,'\')
        defaultans = {'S:\Kezhi\Turing_Test'};
    else
        defaultans = {'S:/Kezhi/Turing_Test'};
    end
    root_path_cell = inputdlg(prompt,dlg_title,num_lines,defaultans);
    root_path = root_path_cell{1};
end

% Choose default command line output for Turing_test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using Turing_test.
if strcmp(get(hObject,'Visible'),'off')
    axes(handles.axes1)
    imshow('worm1.png')
    axes(handles.axes2)
    imshow('group-logo.png')
end

% % create an axes that spans the whole gui
% ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% % import the background image and show it on the axes
% bg = imread('group-logo.png'); imagesc(bg);
% % prevent plotting over the background and turn the axis off
% set(ah,'handlevisibility','off','visible','off')
% % making sure the background is behind all the other uicontrols
% uistack(ah, 'bottom');

set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton3,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton9,'Enable','off');

set(handles.text4,'String',['Welcome to the worm Turing test! Please fill in your name, and see some examples of real and simulated worm vidoes.']);

handles.testing_flg = 0;

show_lay = 0;
guidata(hObject,handles)

% UIWAIT makes Turing_test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Turing_test_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global show_lay
global root_path
global ff

set(handles.pushbutton6,'String','examples');
set(handles.pushbutton6,'Enable','off');

set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','on');
set(handles.pushbutton3,'Enable','on');
set(handles.pushbutton5,'Enable','on');
set(handles.pushbutton7,'Enable','on');
set(handles.pushbutton8,'Enable','off');
set(handles.popupmenu1,'Enable','off');

axes(handles.axes1);
cla;


if handles.testing_flg < 0.5 % click 'start'
    set(handles.text4,'String','Start button is pressed');
    set(handles.pushbutton1,'String','next');
    set(handles.pushbutton5,'String','stop & terminate');
    
    popup_sel_index = get(handles.popupmenu1, 'Value');
    switch popup_sel_index
        case 1
            folder_no = 0;
        case 2
            folder_no = 1;
        case 3
            folder_no = 2;
        case 4
            folder_no = 3;
        case 5
            folder_no = 4;
        case 6
            folder_no = 5; 
        case 7
            folder_no = 6;
        case 8
            folder_no = 7;
        case 9
            folder_no = 8;
        case 10
            folder_no = 9;    
    end
    if strcmp(root_path(end),'\')
        root_path = root_path(1:end-1);
    elseif strcmp(root_path(end),'/')
        root_path = root_path(1:end-1);
    end
    video_folder = [root_path,ff,'Groups',ff,num2str(folder_no),ff,'*.avi'];
    handles.all_file = subdir(video_folder);
    handles.num_file = length(handles.all_file);  

    eval(sprintf('A%d = i', i));
    file_name = {handles.all_file(:).name}';
    real_simu = -ones(size(file_name));
    res = real_simu;
    % save correct answer
    for ii = 1:length(real_simu);
        real_simu(ii) = ~(isempty(cell2mat(regexp(file_name(ii),'samp','ONCE'))));
    end
    handles.result = table(file_name,real_simu, res );
    handles.nf = 1;
    handles.testing_flg = 1;
    guidata(hObject,handles)
else % click 'next'
    set(handles.text3,'String','unknown');
    set(handles.text3,'ForegroundColor',[0,0,0]);
    if handles.nf< 40
        handles.nf = handles.nf + 1;
        guidata(hObject,handles)
        set(handles.pushbutton1,'String','next');
        set(handles.text4,'String','Next button is pressed');
    else
        set(handles.text4,'String','You have tested 40 videos! Please click "stop".');
        return;
    end
end

nf = handles.nf;
num_file = handles.num_file;
all_file = handles.all_file;

disp([num2str(nf),'/',num2str(num_file)])
avi_file_name = all_file(nf).name
vr = VideoReader(avi_file_name);
Nfrm_movie = floor(vr.Duration * vr.FrameRate);

show_lay = show_lay + 1;
for nframe = 1:Nfrm_movie  %num_csv;  % 476

    Y_1 = read(vr, nframe); 
    image(Y_1)
    axis off
    set(handles.text4,'String',['Please select if it is real or simulated. Press "pause" to pause; press "stop" to terminate and see the result. current frame: ',num2str( nframe),'/600. file: ' num2str( nf),'/40']);
    pause(0.06)
    if show_lay < 1
        break;
    end

end
show_lay = 0;
set(handles.pushbutton7,'Enable','off');


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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

set(hObject, 'String', {'Group0', 'Group1', 'Group2', 'Group3', 'Group4','Group5', 'Group6', 'Group7', 'Group8', 'Group9'});


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global show_lay

set(handles.pushbutton1,'Enable','on');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton3,'Enable','off');
%set(handles.text4,'String','You selected "real"! Please click "next" for the next video or "stop" to terminate.');

handles.result.res(handles.nf) = 1; % select real worm
guidata(hObject,handles)

if handles.result.real_simu(handles.nf)==handles.result.res(handles.nf)
    set(handles.text4,'String','You selected "real" and you are correct! Please click "next" for the next video or "stop" to terminate.');
    set(handles.text3,'String','you are correct');
    set(handles.text3,'ForegroundColor',[0,1,0]);
else
    set(handles.text4,'String','You selected "real" but you are wrong! Please click "next" for the next video or "stop" to terminate.');
    set(handles.text3,'String','you are wrong');
    set(handles.text3,'ForegroundColor',[1,0,0]);
end

if handles.nf==40
    set(handles.pushbutton1,'Enable','off');
    set(handles.pushbutton7,'Enable','off');
    set(handles.pushbutton8,'Enable','off');
    set(handles.text4,'String','You selected "real" and you have tested all videos in this group! Please click "stop" to terminate.');
end

show_lay = 0;



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global show_lay

set(handles.pushbutton1,'Enable','on');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton3,'Enable','off');
%set(handles.text4,'String','You selected "simulated"! Please click "next" for the next video or "stop" to terminate.');

handles.result.res(handles.nf) = 0; % select simulated worm
guidata(hObject,handles)

if handles.result.real_simu(handles.nf)==handles.result.res(handles.nf)
    set(handles.text4,'String','You selected "simulated" and you are correct! Please click "next" for the next video or "stop" to terminate.');
    set(handles.text3,'String','you are correct');
    set(handles.text3,'ForegroundColor',[0,1,0]);
else
    set(handles.text4,'String','You selected "simulated" but you are wrong! Please click "next" for the next video or "stop" to terminate.');
    set(handles.text3,'String','you are wrong');
    set(handles.text3,'ForegroundColor',[1,0,0]);
end

if handles.nf==40
    set(handles.pushbutton1,'Enable','off');
    set(handles.pushbutton7,'Enable','off');
    set(handles.pushbutton8,'Enable','off');
    set(handles.text4,'String','You selected "simulated" and you have tested all videos in this group! Please click "stop" to terminate.');
end

show_lay = 0;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global show_lay 

% axes(handles.axes1);
% cla;
if handles.testing_flg < 0.5
    set(handles.pushbutton1,'Enable','on');
    set(handles.pushbutton5,'Enable','off');
    set(handles.pushbutton9,'Enable','off');
    set(handles.pushbutton6,'Enable','on');
    set(handles.text4,'String','Watched enough examples and want to have test? Please type your Name and choose a "Group Number" and click "start".');
else
    set(handles.pushbutton1,'Enable','off');
    set(handles.pushbutton9,'Enable','on');
    set(handles.pushbutton6,'Enable','off');
    set(handles.pushbutton5,'Enable','off');
    
    ans_idx = (handles.result.res>-0.5);
    % no answer has been done
    if sum(ans_idx) < 0.5
        output = 'You have classified 0 worm vidoes...maybe try again?';
    else
        num_right = sum(handles.result.real_simu(ans_idx)==handles.result.res(ans_idx));
        num_total = sum(ans_idx);
        suc_rate = num_right/num_total;
        suc_rate_perc = cellstr(num2str(suc_rate*100,'%5.1f%%'));
        if suc_rate < 0.35
            output=[strcat('Your answer is ',{' '},num2str(num_right),'/',num2str(num_total),' with a succesful rate: ',{' '},suc_rate_perc), ' The simulated worm fools you! Please click "save". '];
        elseif suc_rate>= 0.35 && suc_rate< 0.45
            output=[strcat('Your answer is ',{' '},num2str(num_right),'/',num2str(num_total),' with a succesful rate: ',{' '},suc_rate_perc), ' The simulated worm wins! Please click "save". '];
        elseif suc_rate>= 0.45 && suc_rate< 0.5
            output=[strcat('Your answer is ',{' '},num2str(num_right),'/',num2str(num_total),' with a succesful rate: ',{' '},suc_rate_perc), ' The simulated worm looks like real one, isn\''t it? Please click "save". '];
        elseif suc_rate>= 0.5 && suc_rate< 0.55
            output=[strcat('Your answer is ',{' '},num2str(num_right),'/',num2str(num_total),' with a succesful rate: ',{' '},suc_rate_perc),' Good job! Please click "save". '];
        elseif suc_rate>= 0.55 && suc_rate< 0.65
            output=[strcat('Your answer is ',{' '},num2str(num_right),'/',num2str(num_total),' with a succesful rate: ',{' '},suc_rate_perc),' You must be an expert in worm behaviour! Please click "save". '];
        else
            output=[strcat('Your answer is ',{' '},num2str(num_right),'/',num2str(num_total),' with a succesful rate: ',{' '},suc_rate_perc),' You are a genuis in telling worm behaviours! Please click "save". '];
        end
    end
     set(handles.text4,'String', output);

end
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton6,'String','examples');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton3,'Enable','off');
set(handles.popupmenu1,'Enable','on');


set(handles.pushbutton1,'String','start');
set(handles.text3,'String','unknown');

show_lay = 0;
handles.testing_flg = 0;
handles.all_file = [];
guidata(hObject,handles)





% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global show_lay
global root_path
global ff

set(handles.pushbutton6,'String','Next');
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton3,'Enable','off');
set(handles.pushbutton5,'Enable','on');
set(handles.pushbutton7,'Enable','on');
set(handles.pushbutton8,'Enable','off');

axes(handles.axes1);
cla;

% random select a group
folder_no = randi(10)-1;
if strcmp(root_path(end),'\')
    root_path = root_path(1:end-1);
end
video_folder = [root_path,ff,'Groups',ff,num2str(folder_no),ff,'*.avi'];
all_file = subdir(video_folder);
num_file = length(all_file);  
% random select a video in the group
nf = randi(num_file);
disp([num2str(nf),'/',num2str(num_file)])
avi_file_name = all_file(nf).name;
vr = VideoReader(avi_file_name);
Nfrm_movie = floor(vr.Duration * vr.FrameRate);

if isempty(findstr(avi_file_name, 'samp'))
    set(handles.text3,'string','simulated');
    set(handles.text3,'ForegroundColor',[0,0,0]);
elseif isempty(findstr(avi_file_name, 'simu'))
    set(handles.text3,'string','real');
    set(handles.text3,'ForegroundColor',[0,0,0]);
end

show_lay = show_lay + 1;
for nframe = 1:Nfrm_movie  %num_csv;  % 476

    Y_1 = read(vr, nframe); 
    image(Y_1)
    set(handles.text4,'String',['Please watch video examples. See its property under "This worm is". Press "next" to see next example; press "stop" to terminate example and start the test. current frame: ',num2str( nframe),'/600. file: ' num2str( nf),'/40']);
    pause(0.06)
    if show_lay < 1
        break;
    end

end
show_lay = 0;




% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over popupmenu1.
function popupmenu1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton1,'Enable','off');
set(handles.pushbutton2,'Enable','off');

set(handles.pushbutton3,'Enable','off');
set(handles.pushbutton8,'Enable','on');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton7,'Enable','off');

uiwait(gcf)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume(gcf)

if handles.testing_flg > 0.5
    set(handles.pushbutton1,'Enable','on');
    set(handles.pushbutton2,'Enable','on');
    set(handles.pushbutton3,'Enable','on');
else
    set(handles.pushbutton1,'Enable','off');
    set(handles.pushbutton2,'Enable','off');
    set(handles.pushbutton3,'Enable','off');    
end
set(handles.pushbutton7,'Enable','on');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton5,'Enable','on');



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        folder_no = 0;
    case 2
        folder_no = 1;
    case 3
        folder_no = 2;
    case 4
        folder_no = 3;
    case 5
        folder_no = 4;
    case 6
        folder_no = 5; 
    case 7
        folder_no = 6;
    case 8
        folder_no = 7;
    case 9
        folder_no = 8;
    case 10
        folder_no = 9;    
end

user = get(handles.edit1,'String');

%writetable(handles.result,'myData.xls','Sheet',2,'Range','B2:F6')
%writetable(handles.result,'myData.xls','Sheet',[user,'__',num2str(folder_no)])
writetable(handles.result,'myData.xls','Sheet',strcat(user,'__',num2str(folder_no)));

close(gcbf) 
Turing_test




% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% % Hint: place code in OpeningFcn to populate axes2
% axes(hObject)
% 
% imshow('group-logo.png')


% % create an axes that spans the whole gui
% ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% % import the background image and show it on the axes
% bg = imread('group-logo.png'); imagesc(bg);
% % prevent plotting over the background and turn the axis off
% set(ah,'handlevisibility','off','visible','off')
% % making sure the background is behind all the other uicontrols
% uistack(ah, 'bottom');

function varargout = subdir(varargin)
%SUBDIR Performs a recursive file search
%
% subdir
% subdir(name)
% files = subdir(...)
%
% This function performs a recursive file search.  The input and output
% format is identical to the dir function.
%
% Input variables:
%
%   name:   pathname or filename for search, can be absolute or relative
%           and wildcards (*) are allowed.  If ommitted, the files in the
%           current working directory and its child folders are returned    
%
% Output variables:
%
%   files:  m x 1 structure with the following fields:
%           name:   full filename
%           date:   modification date timestamp
%           bytes:  number of bytes allocated to the file
%           isdir:  1 if name is a directory; 0 if no
%
% Example:
%
%   >> a = subdir(fullfile(matlabroot, 'toolbox', 'matlab', '*.mat'))
%
%   a = 
%
%   67x1 struct array with fields:
%       name
%       date
%       bytes
%       isdir
%
%   >> a(2)
%
%   ans = 
%
%        name: '/Applications/MATLAB73/toolbox/matlab/audiovideo/chirp.mat'
%        date: '14-Mar-2004 07:31:48'
%       bytes: 25276
%       isdir: 0
%
% See also:
%
%   dir

% Copyright 2006 Kelly Kearney


%---------------------------
% Get folder and filter
%---------------------------

error(nargchk(0,1,nargin));
error(nargoutchk(0,1,nargout));

if nargin == 0
    folder = pwd;
    filter = '*';
else
    [folder, name, ext] = fileparts(varargin{1});
    if isempty(folder)
        folder = pwd;
    end
    if isempty(ext)
        if isdir(fullfile(folder, name))
            folder = fullfile(folder, name);
            filter = '*';
        else
            filter = [name ext];
        end
    else
        filter = [name ext];
    end
end

%---------------------------
% Search all folders
%---------------------------

pathstr = genpath(folder);
seplocs = findstr(pathstr, pathsep);
loc1 = [1 seplocs(1:end-1)+1];
loc2 = seplocs(1:end)-1;
pathfolders = arrayfun(@(a,b) pathstr(a:b), loc1, loc2, 'UniformOutput', false);

Files = [];
for ifolder = 1:length(pathfolders)
    NewFiles = dir(fullfile(pathfolders{ifolder}, filter));
    if ~isempty(NewFiles)
        fullnames = cellfun(@(a) fullfile(pathfolders{ifolder}, a), {NewFiles.name}, 'UniformOutput', false); 
        [NewFiles.name] = deal(fullnames{:});
        Files = [Files; NewFiles];
    end
end

%---------------------------
% Prune . and ..
%---------------------------
[~, ~, tail] = cellfun(@fileparts, {Files(:).name}, 'UniformOutput', false);
dottest = cellfun(@(x) isempty(regexp(x, '\.+(\w+$)', 'once')), tail);
Files(dottest & [Files(:).isdir]) = [];

%---------------------------
% Output
%---------------------------
    
if nargout == 0
    if ~isempty(Files)
        fprintf('\n');
        fprintf('%s\n', Files.name);
        fprintf('\n');
    end
elseif nargout == 1
    varargout{1} = Files;
end
