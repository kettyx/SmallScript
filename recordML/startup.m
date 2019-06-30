function startup


thisM = ver('MATLAB');
MATLABVersion = thisM.Release(2:end-1);% ��Ҫǰ������
StartTime = clock;
StartTimeString = datestr(StartTime,'mmmm dd, yyyy HH:MM:SS');

StopTimeString = StartTimeString;

Interval = 0;

%��¼
if exist('recordML.mat')
    load('recordML.mat');
end
if exist('recordML')
    % �������ǻ������һ��
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