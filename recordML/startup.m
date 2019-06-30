function startup


thisM = ver('MATLAB');
MATLABVersion = thisM.Release(2:end-1);% 不要前后括号
StartTime = clock;
StartTimeString = datestr(StartTime,'mmmm dd, yyyy HH:MM:SS');

StopTimeString = StartTimeString;

Interval = 0;

%记录
if exist('recordML.mat')
    load('recordML.mat');
end
if exist('recordML')
    % 开机总是会新添加一行
    recordNew = {MATLABVersion,StartTimeString,StopTimeString,Interval};
    recordML = [recordML;recordNew];
else
    recordML = table;
    recordML.MATLABVersion = MATLABVersion;
    recordML.StartTime = {StartTimeString};
    recordML.StopTime = {StopTimeString};
    recordML.Interval = Interval;
end
save('recordML.mat','recordML');

end