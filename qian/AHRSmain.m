function [out] = AHRSmain(input)
%AHRSmain AHRS滤波算法实现
%   输入：

acc = input(1:3);
gyro = input(4:6);
mag = input(7:9);
out = AHRSupdate( gyro,  acc,  mag);

end

