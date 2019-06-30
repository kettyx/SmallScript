function finish

load('recordML');


thisM = ver('MATLAB');
MATLABVersion = thisM.Release(2:end-1);% ��Ҫǰ������
StopTime = 0;
Interval = 0;

% ͬʱ�򿪶���汾ʱ���ҵ���ǰ�汾�����һ����ӽ���ʱ��
thisRLoc = find(strcmp(recordML.MATLABVersion,MATLABVersion));    

% ��һ������ȱʧ���Ͳ�ͳ�������
if ~isempty(thisRLoc)
    lastLine = thisRLoc(end);
    StartTimeString = recordML{lastLine,2};
    
    StopTime = clock;
    StopTimeString = datestr(StopTime);
    
    interval = etime(StopTime,datevec(StartTimeString,'mmmm dd, yyyy HH:MM:SS'));
    
    recordML{end,3}= {StopTimeString};
    recordML.Interval(end) = interval;
end

save('recordML','recordML');

end