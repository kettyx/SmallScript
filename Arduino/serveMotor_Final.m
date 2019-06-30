%%
% 红线 -> 5V pin.
% 灰线 -> GND
% 黄线 -> D4
clear
%%
a = arduino('COM4', 'MEGA2560', 'Libraries', 'Servo');
% Cannot detect Arduino hardware. Make sure Arduino hardware is properly plugged in.
% 检查有没有连线USB数据线
% 如果MATLAB不能自动搜索到板子，那运行arduino命令的时候就指定端口和班子类型
% 第一次运行这个命令会花一点时间，要等一会儿
%%
s = servo(a, 'D4');   
%% Step3 开始工作

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
    
    % 无障碍读入1，有障碍读入0
    index = 1 + readDigitalPin(a,'D5');
    plot(x,y,[color{index},'*']);
    hold on
    pause(0.1);
    
    % 不覆盖数据
    if angle == 1 || angle == 0
        detectR = detectR+0.1;
        xlim([-detectR,detectR]);
        ylim([0,detectR]);
    end
end


