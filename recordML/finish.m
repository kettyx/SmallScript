function finish

load('recordML');


thisM = ver('MATLAB');
MATLABVersion = thisM.Release(2:end-1);% 不要前后括号
StopTime = 0;
Interval = 0;

% 同时打开多个版本时，找到当前版本的最后一行添加结束时间
thisRLoc = find(strcmp(recordML.MATLABVersion,MATLABVersion));    

% 万一有数据缺失，就不统计这次了
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