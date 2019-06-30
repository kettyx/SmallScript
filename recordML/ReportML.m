function ReportML

recordMAT = 'C:\Matlab\MyMATLABRecord\recordML.mat';

if exist(recordMAT)
    load(recordMAT);
    writetable(recordML,'Report.xlsx');
    disp('数据写入：Report.xlsx');
else
    disp(['找不到数据文件：',recordMAT]);
end

end