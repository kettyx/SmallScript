function ReportML

recordMAT = 'C:\Matlab\MyMATLABRecord\recordML.mat';

if exist(recordMAT)
    load(recordMAT);
    writetable(recordML,'Report.xlsx');
    disp('����д�룺Report.xlsx');
else
    disp(['�Ҳ��������ļ���',recordMAT]);
end

end