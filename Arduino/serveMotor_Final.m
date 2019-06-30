%%
% ���� -> 5V pin.
% ���� -> GND
% ���� -> D4
clear
%%
a = arduino('COM4', 'MEGA2560', 'Libraries', 'Servo');
% Cannot detect Arduino hardware. Make sure Arduino hardware is properly plugged in.
% �����û������USB������
% ���MATLAB�����Զ����������ӣ�������arduino�����ʱ���ָ���˿ںͰ�������
% ��һ�������������Ứһ��ʱ�䣬Ҫ��һ���
%%
s = servo(a, 'D4');   
%% Step3 ��ʼ����

angle1 = 0:0.02:1;
angle2 = flip(angle1);
angleList = [angle1, angle2(2:end-1)];
clear angle1 angle2

writePosition(s, 0);
figure(1)
cla
xlim([-1,1]);
ylim([0,1]);
detectR = 1;
color = {'r','b'};
for times = 1:201
    angleIndex = rem(times,length(angleList))+1;
    angle = angleList(angleIndex);
    writePosition(s, angle);
    current_pos = readPosition(s);
    current_pos = current_pos*180;
    
    x = detectR * cos(current_pos*pi/180);
    y = detectR * sin(current_pos*pi/180);
    
    % ���ϰ�����1�����ϰ�����0
    index = 1 + readDigitalPin(a,'D5');
    plot(x,y,[color{index},'*']);
    hold on
    pause(0.1);
    
    % ����������
    if angle == 1 || angle == 0
        detectR = detectR+0.1;
        xlim([-detectR,detectR]);
        ylim([0,detectR]);
    end
end


